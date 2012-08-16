/*

 This is a generative Shoot-Em-UP or "Bullet Hell" system. 
 You have a character on the left (the "Subject") that can move and shoot. 
 You can generate enemies ("Others") that travel from left to right
 The system is controlled entirely with OSC, so it is ripe for exploration via strange data sets (oscillators, clocks, other games, etc).
 
 This code is rough around the edges - a more (computationally) efficient design might involve creating a pool of Beings (Subjects/Others/Shots) up front.
 Such a design might be better for a program like this, where one sometimes finds oneself spawning hundreds of objects per second.....
 
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

/*Settings for character sprites. Each block is a square of pixels.
 */
static final int pixelsPerBlock = 4;
static final int WIDTH_BLOCKS= 10;
static final int heightBlocks = 8;

static final int BODY_WIDTH = WIDTH_BLOCKS * pixelsPerBlock;
static final int BODY_HEIGHT = heightBlocks * pixelsPerBlock;

static final int NUMBER_OF_ANIMATIONS_IN_LIST = 20; //several animations in each AnimatedSprite

//Used to increase global animation speeds
int animationSpeedMultiplier = 2;

//Initial States... use for codebending

int numberOfAnimationFrames = 5; //how many frames an animation gets when it is created
int numberOfMillisecondsFramePlaysFor = 500; //how many milliseconds each animation frame stays active (set when created)

AnimatedSprite spriteToUseForSubject; //use when generating the sprite of "subject"
Animation[] commonAnimations; //use when generating the AnimatedSprites of "Others"

//Basically global variables.. used for codebending changes that affect several items at once.
float universalShotTravel = 10; //how far does each shot travel per frame
float shotTravelMultiplier = 1.0;
float otherTravelMultiplier = 1.0; 


//Basic Hermes objects
World world;
PostOffice postOffice;
HCamera cam;

Subject subject; //character on the left

OtherGroup otherGroup; 
ShotGroup shotGroup;

StateBeing worldStateBeing;

CharacterGraphicsGenerator characterGraphicsGenerator;


void setup() { 

  Hermes.setPApplet(this);
  size(640, 480, OPENGL);
  rectMode(CORNER);

  characterGraphicsGenerator = new CharacterGraphicsGenerator(); //used to makes generative random patterns for AnimatedSprites

  initializeAnimations();

  subject = new Subject (width / 8, height / 2, BODY_WIDTH, BODY_HEIGHT, spriteToUseForSubject);

  spriteToUseForSubject.setActiveAnimation(0);

  postOffice = new PostOffice(8808, 8809);
  world = new World(postOffice);


  //Register these two initial entities
  world.register(subject);


  otherGroup = new OtherGroup(world);
  shotGroup = new ShotGroup(world);

  worldStateBeing = new StateBeing();

  //Register the OSC addresses with the Post Office
  postOffice.registerOscSubscription(subject, "/BulletCurtain/SetSubjectX");
  postOffice.registerOscSubscription(subject, "/BulletCurtain/SetSubjectY");
  postOffice.registerOscSubscription(subject, "/BulletCurtain/MakeSubjectShoot");

  postOffice.registerOscSubscription(otherGroup, "/BulletCurtain/GenerateAnOther");
  postOffice.registerOscSubscription(otherGroup, "/BulletCurtain/SetOtherSpawnX");
  postOffice.registerOscSubscription(otherGroup, "/BulletCurtain/SetOtherSpawnY");
  postOffice.registerOscSubscription(otherGroup, "/BulletCurtain/NewAnimationForSpawnedOthers");
  postOffice.registerOscSubscription(otherGroup, "/BulletCurtain/SetOtherTravelSpeed");
  postOffice.registerOscSubscription(otherGroup, "/BulletCurtain/SetTravelMultiplierForAllOthers");

  postOffice.registerOscSubscription(subject, "/BulletCurtain/SetShotTravelSpeed");

  postOffice.registerOscSubscription(shotGroup, "/BulletCurtain/SetTravelMultiplierForAllShots");

  postOffice.registerOscSubscription(worldStateBeing, "/BulletCurtain/SetAnimationSpeed");

  //Now the interactions...
  ShotOtherCollider shotOtherCollider = new ShotOtherCollider();

  world.register(shotGroup, otherGroup, shotOtherCollider);
//
  world.lockUpdateRate(60);
  world.start();
}



AnimatedSprite createAnimatedSpriteForOther() {
  //make a single Other when the system begins...
  AnimatedSprite spriteForOther = new AnimatedSprite();

  for (int i = 0; i < commonAnimations.length; i++) {
    spriteForOther.addAnimation(commonAnimations[i]);
  }

  return spriteForOther;
}


void initializeAnimations() { //helper, also, some code vaguely redundant.. 

  spriteToUseForSubject = new AnimatedSprite(); //animations must be added to this before it can be used!

  for (int i = 0; i < NUMBER_OF_ANIMATIONS_IN_LIST; i++) {

    //Generate frames for an animation, in the form of a PImage[]
    PImage[] generatedFrames = characterGraphicsGenerator.generate(WIDTH_BLOCKS, heightBlocks, pixelsPerBlock, numberOfAnimationFrames);

    //Use these frames to build an Animation
    Animation generatedAnimation = new Animation(generatedFrames, numberOfMillisecondsFramePlaysFor * animationSpeedMultiplier);

    //Add this Animation to the AnimatedSpite
    spriteToUseForSubject.addAnimation(generatedAnimation); //returns an int.. aka the index in the animation. useful sometimes, but not needed here
  }


  //Create a common animation pool for all 'Others'
  commonAnimations = new Animation[NUMBER_OF_ANIMATIONS_IN_LIST];

  for (int i = 0; i < NUMBER_OF_ANIMATIONS_IN_LIST; i++) {

    //Generate frames for an animation, in the form of a PImage[]
    PImage[] generatedFrames = characterGraphicsGenerator.generate(WIDTH_BLOCKS, heightBlocks, pixelsPerBlock, numberOfAnimationFrames);

    //Use these frames to build an Animation
    Animation generatedAnimation = new Animation(generatedFrames, numberOfMillisecondsFramePlaysFor * animationSpeedMultiplier);

    //Build the common animation pool for all 'Others'
    commonAnimations[i] = generatedAnimation;
  }
}


void draw() {
  background(0);
  noSmooth();
  world.draw();
}






//Dummy being for world state 
class StateBeing extends Being {
  StateBeing() {
    super(new Rectangle(1, 1, 1, 1));
  }

  void draw() {
  };

  void handleOscMessage(OscMessage message) {

    String[] msgSplit = message.getAddress().split("/");
    if (msgSplit[1].equals(SYSTEM_NAME)) {
      if (msgSplit[2].equals("SetAnimationSpeed")) {
        if (message.hasRemainingArguments()) {
          float speed = constrain(message.getAndRemoveFloat(), 0.0, 1.0);
          speed = map(speed, 0.0, 1.0, 10.0, 2000.0);
          numberOfMillisecondsFramePlaysFor = int(speed);
        }
      }
    }
  }
}

