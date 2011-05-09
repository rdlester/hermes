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

//todo: 
//add camera rotation, make osc controllable.
//if time, consider built in accumulators with decay

import processing.opengl.*;
import src.hermes.*;
import src.hermes.shape.*;
import src.hermes.animation.*;
import src.hermes.postoffice.*;

static final String systemName = "BulletCurtain";

//size.. static and final because they are constants

static final int numberOfWidthBlocks = 10;
static final int numberOfHeightBlocks = 8;
static final int pixelsPerBlock = 4;


static final int BODY_WIDTH = numberOfWidthBlocks * pixelsPerBlock;
static final int BODY_HEIGHT = numberOfHeightBlocks * pixelsPerBlock;

static final int NUMBER_OF_ANIMATIONS_IN_LIST = 20; //several animations in each AnimatedSprite

//Used to increase global animation speeds
int animationSpeedMultiplier = 2;

//Initial States... use for codebending
color mainColor = color (random(255), random(255), random(255), 255);
color altColor = color (random(255), random(255), random(255), 255);
int numberOfAnimationFrames = 5; //how many frames an animation gets when it is created
int millisecondsPerFrame = 500; //how many milliseconds each from plays for (set when created)
AnimatedSprite spriteToUseForSubject; //use when generating the sprite of "subject"
Animation[] commonAnimations; //use when generating the AnimatedSprites of "Others"

float universalShotTravel = 10;

//AnimatedSprite spriteToUseForOther; 

int curtainX = RES_WIDTH/3;

PatternGenerator patternGenerator;
Subject subject;


World world;

PostOffice postOffice;
OtherGroup otherGroup; 

ShotGroup shotGroup;

StateBeing worldStateBeing;

Camera cam;

static final int RES_WIDTH = 800;
static final int RES_HEIGHT = 600;

void setup() { 

  Hermes.setPApplet(this);
  size(RES_WIDTH, RES_HEIGHT, OPENGL);

  patternGenerator = new PatternGenerator(); //used to makes generative random patterns for AnimatedSprites

  initializeAnimations();

  //  initializeAnimatedSprites();

  subject = new Subject (RES_WIDTH / 8, RES_HEIGHT / 2, spriteToUseForSubject);

  spriteToUseForSubject.setActiveAnimation(0);


  cam = new Camera();
  postOffice = new PostOffice(8808, 8809);
  world = new World(postOffice, cam);


  //Register these two initial entities
  world.registerBeing(subject, true);


  otherGroup = new OtherGroup(world);
  shotGroup = new ShotGroup(world);

  worldStateBeing = new StateBeing();

  postOffice.registerOscSubscription(subject, "/BulletCurtain/SetSubjectX");
  postOffice.registerOscSubscription(subject, "/BulletCurtain/SetSubjectY");
  postOffice.registerOscSubscription(subject, "/BulletCurtain/HaveSubjectShoot");

  postOffice.registerOscSubscription(otherGroup, "/BulletCurtain/GenerateAnOther");
  postOffice.registerOscSubscription(otherGroup, "/BulletCurtain/SetOtherSpawnX");
  postOffice.registerOscSubscription(otherGroup, "/BulletCurtain/SetOtherSpawnY");
  postOffice.registerOscSubscription(otherGroup, "/BulletCurtain/NewAnimationForSpawnedOthers");
  postOffice.registerOscSubscription(otherGroup, "/BulletCurtain/SetOtherTravelSpeed");
  postOffice.registerOscSubscription(otherGroup, "/BulletCurtain/SetTravelMultiplierForAllOthers");


  postOffice.registerOscSubscription(subject, "/BulletCurtain/SetShotTravelSpeed");

  postOffice.registerOscSubscription(shotGroup, "/BulletCurtain/SetTravelMultiplierForAllShots");

  postOffice.registerOscSubscription(worldStateBeing, "/BulletCurtain/SetAnimationSpeed");

  ShotOtherCollider shotOtherCollider = new ShotOtherCollider();

  world.registerInteraction(shotGroup, otherGroup, shotOtherCollider, true);

  world.lockUpdateRate(60);
  world.start();
}

class ShotOtherCollider extends BoundingBoxCollider<Shot, Other> {

  boolean handle(Shot shot, Other other) {


    postOffice.sendFloat("/"+systemName+"/"+"OtherDestroyed", 1.0);

    postOffice.sendFloat("/"+systemName+"/"+"OtherDestroyedAtX", map(other.getX(), 0.0, RES_WIDTH, 0.0, 1.0));
    postOffice.sendFloat("/"+systemName+"/"+"OtherDestroyedAtY", map(other.getY(), 0.0, RES_HEIGHT, 0.0, 1.0));

    world.deleteBeing(shot);
    world.deleteBeing(other);

    return true;
  }
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



  //Create a common animation pool for all 'Others'
  commonAnimations = new Animation[NUMBER_OF_ANIMATIONS_IN_LIST];

  for (int i = 0; i < NUMBER_OF_ANIMATIONS_IN_LIST; i++) {

    //Generate frames for an animation, in the form of a PImage[]
    PImage[] generatedFrames = patternGenerator.generatePatternFrames(numberOfWidthBlocks, numberOfHeightBlocks, pixelsPerBlock, altColor, numberOfAnimationFrames);

    //Use these frames to build an Animation
    Animation generatedAnimation = new Animation(generatedFrames, millisecondsPerFrame / animationSpeedMultiplier);

    //Build the common animation pool for all 'Others'
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
    super(new Rectangle(x, y, BODY_WIDTH, BODY_HEIGHT, CORNER));

    this.animatedSprite = animatedSprite;
  }

  void draw() {
    PImage frameToDraw = animatedSprite.animate();
    image(frameToDraw, 0, 0);
  }
}

class Subject extends SubjectObjectRelation {


  Subject(float x, float y, AnimatedSprite animatedSprite) {
    super(x, y, animatedSprite);
  }

  void update() {
  }


  void handleOscMessage(OscMessage message) {

    String[] msgSplit = message.getAddress().split("/");


    if (msgSplit[1].equals(systemName)) {


      if (msgSplit[2].equals("SetSubjectX")) {
        if (message.hasRemainingArguments()) {
          float constrainedX = constrain(message.getAndRemoveFloat(), 0.0, 1.0);
          float remappedX = map(constrainedX, 0.0, 1.0, 0.0, curtainX - BODY_WIDTH);
          setX(remappedX);
        }
      }

      else if (msgSplit[2].equals("SetSubjectY")) {
        if (message.hasRemainingArguments()) {
          float constrainedY = constrain(message.getAndRemoveFloat(), 0.0, 1.0);
          float remappedY = map(constrainedY, 0.0, 1.0, 0.0, RES_HEIGHT - BODY_HEIGHT);
          setY(remappedY);
        }
      }

      else if (msgSplit[2].equals("HaveSubjectShoot")) {
        if (message.hasRemainingArguments()) {
          if (message.getAndRemoveFloat() == 1.0) {       
            shoot();
          }
        }
      }
    }
  }



  void shoot() {
    //Create a new shot, register it in the world, and register it for collisions
    Shot shot = new Shot(getX() + BODY_WIDTH, getY() + (BODY_HEIGHT/2), universalShotTravel);
    world.registerBeing(shot, true);
    shotGroup.add(shot);
  }
}






float shotTravelMultiplier = 1.0;

class Shot extends Being {

  float travel;

  static final float shotWidth = pixelsPerBlock * 2;
  static final float shotHeight = pixelsPerBlock * 1;

  Shot(float x, float y, float travel) {

    super(new Rectangle(x, y, shotWidth, shotHeight, CORNER));
    this.travel = travel;
  }

  void update() {
    setX(getX() + (travel * shotTravelMultiplier));

    if (getX() > RES_WIDTH) {
      world.deleteBeing(this);
    }
  }


  void draw() {
    noStroke();
    fill(255);
    rect(0, 0, shotWidth, shotHeight);
  }
}


class ShotGroup extends Group {

  ShotGroup(World world) {
    super(world);
  }

  float initialTravel;

  void handleOscMessage(OscMessage message) {
    String[] msgSplit = message.getAddress().split("/");

    if (msgSplit[1].equals(systemName)) {
      if (message.hasRemainingArguments()) {
        if (msgSplit[2].equals("SetTravelMultiplierForAllShots")) {
          float newMultiplier = constrain(message.getAndRemoveFloat(), 0.0, 1.0);
          newMultiplier = map(newMultiplier, 0.0, 1.0, 0.0, 10);
          shotTravelMultiplier = newMultiplier;
        }
      }
    }
  }
}

float otherTravelMultiplier = 1.0;

class Other extends SubjectObjectRelation {

  Float howManyPixelsToTravel = 1.0;

  Other(float x, float y, AnimatedSprite animatedSprite) {
    super(x, y, animatedSprite);
  }

  void update() {
    setX(getX() - (howManyPixelsToTravel * otherTravelMultiplier));

    if (getX() + BODY_WIDTH < 0) {
      world.deleteBeing(this);
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

  Float groupTravelSpeed = 1.0;

  void handleOscMessage(OscMessage message) {
    String[] msgSplit = message.getAddress().split("/");

    if (msgSplit[1].equals(systemName)) {
      if (msgSplit[2].equals("GenerateAnOther")) {
        if (message.hasRemainingArguments()) {
          if (message.getAndRemoveFloat() == 1.0) {       
            Other other = new Other(spawnX, spawnY, createAnimatedSpriteForOther());
            other.animatedSprite.setActiveAnimation(animationIndexToUseOnSpawn % other.animatedSprite.getNumberOfAnimations());
            other.animatedSprite.overrideMillisecondsPerFrame(millisecondsPerFrame);
            other.howManyPixelsToTravel = groupTravelSpeed;
            add(other);

            world.registerBeing(other, true);
          }
        }
      }

      else if (msgSplit[2].equals("SetOtherSpawnX")) {
        if (message.hasRemainingArguments()) {

          float constrainedX = constrain(message.getAndRemoveFloat(), 0.0, 1.0);
          float remappedX = map(constrainedX, 0.0, 1.0, curtainX, RES_WIDTH - BODY_WIDTH);
          spawnX = remappedX;
        }
      }


      else if (msgSplit[2].equals("SetOtherSpawnY")) {
        if (message.hasRemainingArguments()) {
          float constrainedY = constrain(message.getAndRemoveFloat(), 0.0, 1.0);
          float remappedY = map(constrainedY, 0.0, 1.0, 0.0, height - BODY_HEIGHT);
          spawnY = remappedY;
        }
      }

      else if (msgSplit[2].equals("SetOtherTravelSpeed")) {
        if (message.hasRemainingArguments()) {
          float travel = constrain(message.getAndRemoveFloat(), 0.0, 1.0);
          travel = map(travel, 0.0, 1.0, 1.0, 20);
          groupTravelSpeed = travel;
        }
      }

      else if (msgSplit[2].equals("NewAnimationForSpawnedOthers")) {
        if (message.hasRemainingArguments()) {
          if (message.getAndRemoveFloat() == 1.0) {       
            animationIndexToUseOnSpawn++;
          }
        }
      }

      else if (msgSplit[2].equals("SetTravelMultiplierForAllOthers")) {
        if (message.hasRemainingArguments()) {
          if (message.getAndRemoveFloat() == 1.0) {       
            float newMultiplier = constrain(message.getAndRemoveFloat(), 0.0, 1.0);
            newMultiplier = map(newMultiplier, 0.0, 1.0, 0.0, 5);
            otherTravelMultiplier = newMultiplier;
          }
        }
      }
    }
  }
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
    if (msgSplit[1].equals(systemName)) {
      if (msgSplit[2].equals("SetAnimationSpeed")) {
        if (message.hasRemainingArguments()) {
          float speed = constrain(message.getAndRemoveFloat(), 0.0, 1.0);
          speed = map(speed, 0.0, 1.0, 10.0, 2000.0);
          millisecondsPerFrame = int(speed);
        }
      }
    }
  }
}

