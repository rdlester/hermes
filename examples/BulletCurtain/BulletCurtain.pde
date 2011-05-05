//Hi! The comments in this piece might often seem verbose. They're there to provide some clear explanations of the functions of the library!

/*
=======================================
 Inputs:
 =======================================
 
 The user will send messages to the following OSC addresses: 
 
 	/SetSubjectX
 	/SetSubjectY
 		move the Subject on an x and y axis (continuous value between 0.0 and 1.0)
 	/SetOtherSpawnX
 	/SetOtherSpawnY
 		specify the x and y coordinate of where new Others are generated
 	/SetOtherSpeed
 		set how fast Others travel 
 
 	/Fire
 		shoot a bullet from the player ship (trigger value of 1.0)
 	/GenerateOther
 		generate enemy ships (trigger value of 1.0)
 
 MAYBE
 	/ChangeOtherStyle
 		ability to step through a set of graphics, determining how new Others will be drawn (trigger value of 1.0)
 	/ChangeBackgroundStyle
 		ability to step through a minimal set of background graphics / colors (trigger value of 1.0)
 
 
 =======================================
 Outputs:
 =======================================
 
 	/OldestOtherX
 	/OldestOtherY
 		oldest enemy ship x and y 
 	/NewestOtherX
 	/NewestOtherY
 		newest enemy ship x and y
 	/MainCollidedWithOther
 		notification of player ship collision (trigger value of 1.0)
 	/OtherDestroyed
 		notification of destruction of an enemy ship (trigger value of 1.0)
 
 
 Continuous:
 otherDestroyedAtX
 otherDestroyedAtY
 oldestOtherX
 oldestOtherY
 newestOtherX
 newestOtherY
 setCurtainX
 
 Triggers:
 otherDestroyed
 mainCollidedWithOther
 bulletCollidedRightWall
 otherCollidedLeftWall
 
 ///if time, add built in accumulators with decay
 */

import processing.opengl.*;
import src.hermes.*;
import src.hermes.shape.*;
import src.hermes.animation.*;
import src.hermes.postoffice.*;


static final String systemName = "BulletCurtain";

//todo: add camera rotation, make osc controllable.

//size.. static and final because they are constants

static final int numberOfWidthBlocks = 10;
static final int numberOfHeightBlocks = 8;
static final int pixelsPerBlock = 3;

static final int BODY_WIDTH = numberOfWidthBlocks * pixelsPerBlock;
static final int BODY_HEIGHT = numberOfHeightBlocks * pixelsPerBlock;

static final int NUMBER_OF_ANIMATIONS_IN_LIST = 20; //several animations in each AnimatedSprite

//Used to increase global animation speeds
int animationSpeedMultiplier = 2;

//Initial States... use for codebending
color mainColor = color (random(255), random(255), random(255), 255);
color altColor = color (random(255), random(255), random(255), 255);
int numberOfAnimationFrames = 5; //how many frames an animation gets when it is created
int millisecondsPerFrame = 1000; //how many milliseconds each from plays for (set when created)
AnimatedSprite spriteToUseForSubject; //use when generating the sprite of "subject"
Animation[] commonAnimations; //use when generating the AnimatedSprites of "Others"

float universalShotTravel;

//AnimatedSprite spriteToUseForOther; 

int curtainX = RES_WIDTH/3;

PatternGenerator patternGenerator;
Subject subject;


World world;

PostOffice postOffice;
OtherGroup otherGroup; 

Camera cam;

static final int RES_WIDTH = 600;
static final int RES_HEIGHT = 600;

void setup() { 

  Hermes.setPApplet(this);
  size(RES_WIDTH, RES_HEIGHT, OPENGL);

  patternGenerator = new PatternGenerator(); //used to makes generative random patterns for AnimatedSprites

  initializeAnimations();

  //  initializeAnimatedSprites();

  subject = new Subject (RES_WIDTH / 8, RES_HEIGHT / 2, spriteToUseForSubject);




  Other other = new Other(RES_WIDTH, RES_HEIGHT / 3, createAnimatedSpriteForOther());

  spriteToUseForSubject.setActiveAnimation(0);
  other.animatedSprite.setActiveAnimation(0);


  cam = new Camera();
  postOffice = new PostOffice(8808, 8809);
  world = new World(postOffice, cam);



  //Register these two initial entities
  world.registerBeing(subject, true);
  world.registerBeing(other, true);

  otherGroup = new OtherGroup(world);

  postOffice.registerOscSubscription(subject, "/BulletCurtain/SetSubjectX");
  postOffice.registerOscSubscription(subject, "/BulletCurtain/SetSubjectY");
  postOffice.registerOscSubscription(subject, "/BulletCurtain/HaveSubjectFire");

  postOffice.registerOscSubscription(otherGroup, "/BulletCurtain/GenerateAnOther");
  postOffice.registerOscSubscription(otherGroup, "/BulletCurtain/SetOtherSpawnX");
  postOffice.registerOscSubscription(otherGroup, "/BulletCurtain/SetOtherSpawnY");
  postOffice.registerOscSubscription(otherGroup, "/BulletCurtain/NewAnimationForSpawnedOthers");

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
    PImage[] generatedFrames = patternGenerator.generatePatternFrames(numberOfWidthBlocks, numberOfHeightBlocks, pixelsPerBlock, mainColor, numberOfAnimationFrames);

    //Use these frames to build an Animation
    Animation generatedAnimation = new Animation(generatedFrames, millisecondsPerFrame / animationSpeedMultiplier);

    //Add this Animation to the AnimatedSpite
    spriteToUseForSubject.addAnimation(generatedAnimation); //returns an int.. aka the index in the animation. useful sometimes, but not needed here
  }



  //  spriteToUseForOther = new AnimatedSprite(); //animations must be added to this before it can be used!
  commonAnimations = new Animation[NUMBER_OF_ANIMATIONS_IN_LIST];

  for (int i = 0; i < NUMBER_OF_ANIMATIONS_IN_LIST; i++) {

    //Generate frames for an animation, in the form of a PImage[]
    PImage[] generatedFrames = patternGenerator.generatePatternFrames(numberOfWidthBlocks, numberOfHeightBlocks, pixelsPerBlock, altColor, numberOfAnimationFrames);

    //Use these frames to build an Animation
    Animation generatedAnimation = new Animation(generatedFrames, millisecondsPerFrame / animationSpeedMultiplier);

    //Add this Animation to the AnimatedSpite
    //spriteToUseForOther.addAnimation(generatedAnimation); //returns an int.. aka the index in the animation. useful sometimes, but not needed here

    //Also build an animation pool
    commonAnimations[i] = generatedAnimation;
  }
}



void draw() {

  noSmooth();
  // scale(3);
  background(0);
  cam.draw();

  //saveFrame();
  // world.update();
}


abstract class SubjectObjectRelation extends Being {


  //Subject has an Animated Sprite.. 
  AnimatedSprite animatedSprite;

  SubjectObjectRelation(float x, float y, AnimatedSprite animatedSprite) {

    //First call to a subclass must be to the super constructor
    //in this case, it takes a Shape for position and collision detection
    super(new Rectangle(x, y, BODY_WIDTH, BODY_HEIGHT));

    this.animatedSprite = animatedSprite;
  }

  void draw() {
    PImage frameToDraw = animatedSprite.animate();
    image(frameToDraw, 0, 0);
  }
}

class Subject extends SubjectObjectRelation {

  float howMuchToTravel = 1;

  Subject(float x, float y, AnimatedSprite animatedSprite) {
    super(x, y, animatedSprite);
  }

  void update() {
  }


  void handleOscMessage(OscMessage message) {

    String[] msgSplit = message.getAddress().split("/");


    if (msgSplit[1].equals(systemName)) {


      if (msgSplit[2].equals("SetSubjectX")) {
        float constrainedX = constrain(message.getAndRemoveFloat(), 0.0, 1.0);
        float remappedX = map(constrainedX, 0.0, 1.0, 0.0, curtainX - BODY_WIDTH);
        setX(remappedX);
      }

      else if (msgSplit[2].equals("SetSubjectY")) {
        float constrainedY = constrain(message.getAndRemoveFloat(), 0.0, 1.0);
        float remappedY = map(constrainedY, 0.0, 1.0, 0.0, RES_HEIGHT - BODY_HEIGHT);
        setY(remappedY);
      }
    }
  }



  void shoot() {
    //Create a new shot, register it in the world, and register it for collisions
    Shot shot = new Shot(getX() + BODY_WIDTH, getY() + (BODY_HEIGHT/2), universalShotTravel);
    world.registerBeing(shot, true);
  }
}


class Shot extends Being {
  float travel;

  Shot(float x, float y, float travel) {

    super(new Rectangle(x, y, BODY_WIDTH, BODY_HEIGHT));
    this.travel = travel;
  }

  void update() {
    setX(getX() + shotTravel);

    if (getX() > RES_WIDTH) {
      world.removeBeingFromAllGroups(this);
    }
  }
}



class Other extends SubjectObjectRelation {

  float howMuchToTravel = 1;

  Other(float x, float y, AnimatedSprite animatedSprite) {
    super(x, y, animatedSprite);
  }

  void update() {
    setX(getX() - howMuchToTravel);

    if (getX() + BODY_WIDTH < 0) {
      world.removeBeingFromAllGroups(this);
    }
  }
}




class OtherGroup extends Group {

  OtherGroup(World world) {
    super(world);
  }

  float spawnX = RES_WIDTH;
  float spawnY = RES_HEIGHT/2 - BODY_HEIGHT/2;
  int animationIndexToUseOnSpawn = 0;

  void handleOscMessage(OscMessage message) {
    String[] msgSplit = message.getAddress().split("/");

    if (msgSplit[1].equals(systemName)) {
      if (msgSplit[2].equals("GenerateAnOther")) {
        if (message.getAndRemoveFloat() == 1.0) {       
          Other other = new Other(spawnX, spawnY, createAnimatedSpriteForOther());
          other.animatedSprite.setActiveAnimation(animationIndexToUseOnSpawn % other.animatedSprite.getNumberOfAnimations());
          add(other);
          world.registerBeing(other, true);
        }
      }

      else if (msgSplit[2].equals("SetOtherSpawnX")) {
        float constrainedX = constrain(message.getAndRemoveFloat(), 0.0, 1.0);
        float remappedX = map(constrainedX, 0.0, 1.0, curtainX, RES_WIDTH - BODY_WIDTH);
        spawnX = remappedX;
      }


      else if (msgSplit[2].equals("SetOtherSpawnY")) {
        float constrainedY = constrain(message.getAndRemoveFloat(), 0.0, 1.0);
        float remappedY = map(constrainedY, 0.0, 1.0, 0.0, height - BODY_HEIGHT);
        spawnY = remappedY;
      }


      else if (msgSplit[2].equals("NewAnimationForSpawnedOthers")) {
        if (message.getAndRemoveFloat() == 1.0) {       
          animationIndexToUseOnSpawn++;
        }
      }
    }
  }
}

