/*

 This is a generative Shoot-Em-UP or "Bullet Hell" system. 
 You have a character on the left (the "Subject") that can move and shoot. 
 You can generate enemies ("Others") that travel from left to right
 The system is controlled entirely with OSC, so it is ripe for exploration via strange data sets (oscillators, clocks, other games, etc).
 
 This code is rough around the edges - a more (computationally) efficient design might involve creating pools of Beings (Subjects/Others/Shots) up front.
 Such a design might be better for a program like this, where one sometimes finds oneself spawning hundreds of objects per second.....
 Also this design is 90% OO encapsulation 10% Processing wonky globals, forgive my sins. 
 
 =======================================
 Inputs:
 =======================================
 
 To control this game/system, the user will send messages to the following OSC addresses: 
 
 	/SetSubjectX
 	/SetSubjectY
 		move the Subject on an x and y axis (continuous value between 0.0 and 1.0)
 	/SetOtherSpawnX
 	/SetOtherSpawnY
 		specify the x and y coordinate of where new Others are generated
 	/SetOtherSpeed
 		set how fast Others travel 
 	/MakeSubjectShoot
 		shoot a bullet from the player ship (trigger value of 1.0)
 	/GenerateOther
 		generate enemy ships (trigger value of 1.0)
 
 
 **NOT currently in place, but potential future additons maybe?
 	-/ChangeOtherStyle
 		ability to step through a set of graphics, determining how new Others will be drawn (trigger value of 1.0)
 	-/ChangeBackgroundStyle
 		ability to step through a minimal set of background graphics / colors (trigger value of 1.0)
 **
 
 =======================================
 Outputs:
 =======================================
 
 To use this game to control other systems, one should monitor these addresses:
 
 	/OldestOtherX
 	/OldestOtherY
 		oldest Other's x and y 
 	/NewestOtherX
 	/NewestOtherY
 		newest Other's x and y
 	/MainCollidedWithOther
 		notification of player ship collision (trigger value of 1.0)
 	/OtherDestroyed
 		notification of destruction of an enemy ship (trigger value of 1.0)
 /OtherDestroyedAtY
 /OtherDestroyedAtX
 x and y of the last destroyed Other 
 
 */

import processing.opengl.*;
import hermes.*;
import hermes.hshape.*;
import hermes.animation.*;
import hermes.postoffice.*;

static final String SYSTEM_NAME = "BulletCurtain";

//Constants for OSC input and output ports - change these here if you want different ports.
final int PORT_FOR_INCOMING_OSC_MESSAGES = 8808;
final int PORT_FOR_OUTGOING_OSC_MESSAGES = 8809;

//character graphics are made of blocks..
static final int WIDTH_BLOCKS= 12;
static final int HEIGHT_BLOCKS = 8;
//and each block is a square of pixels.
static final int PIXELS_PER_BLOCK = 4;

//thus the width and height for each character is:
static final int BODY_WIDTH = WIDTH_BLOCKS * PIXELS_PER_BLOCK;
static final int BODY_HEIGHT = HEIGHT_BLOCKS * PIXELS_PER_BLOCK;

//an AnimatedSprite is made up of several possible animations, which are all rendered at setup for speed's sake
static final int NUMBER_OF_ANIMATIONS_IN_POOL = 20; 


//Objects that are common to all possible worlds
Subject subject; //character on the left
OtherGroup otherGroup; //group for "enemies" on right
ShotGroup shotGroup; //group for shots from character on left
WorldState worldState; 
CharacterGraphicsGenerator characterGraphicsGenerator; //
AnimatedSprite spriteToUseForSubject; //use when generating the sprite of "subject"
Animation[] commonAnimations; //use when generating the AnimatedSprites of "Others"

//Basic Hermes objects..
World world;
PostOffice postOffice;


//note to self: these are leftover from this as a hack - if I re
//Initial States... use for codebending
int numberOfAnimationFrames = 5; //how many frames each character's animation gets when it is created
int numberOfMillisecondsFramePlaysFor = 500; //how many milliseconds each animation frame stays active (set when created)

//Basically global variables.. used for codebending changes that affect several items at once.
int animationSpeedMultiplier = 2;
float shotTravelMultiplier = 1.0;
float otherTravelMultiplier = 1.0; 




void setup() { 

  Hermes.setPApplet(this);
  size(640, 480, OPENGL);
  rectMode(CORNER);

  //instantiate basic Hermes objects
  postOffice = new PostOffice(PORT_FOR_INCOMING_OSC_MESSAGES, PORT_FOR_OUTGOING_OSC_MESSAGES);
  world = new World(postOffice);

  //instantiate objects used for generating graphocs
  characterGraphicsGenerator = new CharacterGraphicsGenerator(); //used to makes generative random patterns for AnimatedSprites
  initializeAnimations();

  //Instantiate and register the "Subject" chararacter.
  subject = new Subject (width / 8, height / 2, BODY_WIDTH, BODY_HEIGHT, spriteToUseForSubject);
  spriteToUseForSubject.setActiveAnimation(0);
  world.registerBeing(subject, true);

  //and then the groups... 
  otherGroup = new OtherGroup(world, BODY_WIDTH, BODY_HEIGHT);
  shotGroup = new ShotGroup(world);

  //This object holds general state for manipulation via OSC
  worldState = new WorldState();

  //Register the OSC addresses with the Post Office
  //For the Subject..
  postOffice.registerOscSubscription(subject, "/BulletCurtain/SetSubjectX");
  postOffice.registerOscSubscription(subject, "/BulletCurtain/SetSubjectY");
  postOffice.registerOscSubscription(subject, "/BulletCurtain/MakeSubjectShoot");
  //For the Others..
  postOffice.registerOscSubscription(otherGroup, "/BulletCurtain/GenerateAnOther");
  postOffice.registerOscSubscription(otherGroup, "/BulletCurtain/SetOtherSpawnX");
  postOffice.registerOscSubscription(otherGroup, "/BulletCurtain/SetOtherSpawnY");
  postOffice.registerOscSubscription(otherGroup, "/BulletCurtain/NewAnimationForSpawnedOthers");
  postOffice.registerOscSubscription(otherGroup, "/BulletCurtain/SetOtherTravelSpeed");
  postOffice.registerOscSubscription(otherGroup, "/BulletCurtain/SetTravelMultiplierForAllOthers");
  //For Shots
  postOffice.registerOscSubscription(subject, "/BulletCurtain/SetShotTravelSpeed");
  postOffice.registerOscSubscription(shotGroup, "/BulletCurtain/SetTravelMultiplierForAllShots");
  //And general animation state
  postOffice.registerOscSubscription(worldState, "/BulletCurtain/SetAnimationSpeed");

  //Now instantiate & register interactions...
  ShotOtherCollider shotOtherCollider = new ShotOtherCollider();
  world.registerInteraction(shotGroup, otherGroup, shotOtherCollider);

  world.lockUpdateRate(60);
  world.start();
}

void draw() {
  background(0);
  noSmooth();
  world.draw();
}


AnimatedSprite createAnimatedSpriteForOther() {
  //make a single shared AnimatedSprite for the all enemy ("Other") Beings...
  AnimatedSprite spriteForOther = new AnimatedSprite();

  //then populate it with different Animations
  for (int i = 0; i < commonAnimations.length; i++) {
    spriteForOther.addAnimation(commonAnimations[i]);
  }

  return spriteForOther;
}

void initializeAnimations() { //helper, also, some code vaguely redundant.. 

  spriteToUseForSubject = new AnimatedSprite(); //animations must be added to this before it can be used!

  for (int i = 0; i < NUMBER_OF_ANIMATIONS_IN_POOL; i++) {

    //Generate frames for an animation, in the form of a PImage[]
    PImage[] generatedFrames = characterGraphicsGenerator.generate(WIDTH_BLOCKS, HEIGHT_BLOCKS, PIXELS_PER_BLOCK, numberOfAnimationFrames);

    //Use these frames to build an Animation
    Animation generatedAnimation = new Animation(generatedFrames, numberOfMillisecondsFramePlaysFor * animationSpeedMultiplier);

    //Add this Animation to the AnimatedSpite
    spriteToUseForSubject.addAnimation(generatedAnimation); //returns an int.. aka the index in the animation. useful sometimes, but not needed here
  }


  //Create a common animation pool for all 'Others'
  commonAnimations = new Animation[NUMBER_OF_ANIMATIONS_IN_POOL];

  for (int i = 0; i < NUMBER_OF_ANIMATIONS_IN_POOL; i++) {

    //Generate frames for an animation, in the form of a PImage[]
    PImage[] generatedFrames = characterGraphicsGenerator.generate(WIDTH_BLOCKS, HEIGHT_BLOCKS, PIXELS_PER_BLOCK, numberOfAnimationFrames);

    //Use these frames to build an Animation
    Animation generatedAnimation = new Animation(generatedFrames, numberOfMillisecondsFramePlaysFor * animationSpeedMultiplier);

    //Build the common animation pool for all 'Others'
    commonAnimations[i] = generatedAnimation;
  }
}







