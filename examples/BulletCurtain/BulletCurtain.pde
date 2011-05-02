//Hi! The comments in this piece might often seem verbose. They're there to provide some clear explanations of the functions of the library!

import src.hermes.*;
import src.hermes.shape.*;
import src.hermes.animation.*;
import src.hermes.postoffice.*;

//todo: add camera rotation, make osc controllable.

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
AnimatedSprite spriteToUseForOther; //use when generating the sprite of "Other"


PatternGenerator patternGenerator;
Subject subject;


World world;

PostOffice postOffice;
Camera cam;

void setup() { 

  Hermes.setPApplet(this);
  size(640, 480);

  patternGenerator = new PatternGenerator(); //used to makes generative random patterns for AnimatedSprites

  initializeAnimatedSprites();

  subject = new Subject (width / 8, height / 2, spriteToUseForSubject);

  //make a single Other when the system begins...
  Other other = new Other(width, height / 3, spriteToUseForOther);


  cam = new Camera();
  postOffice = new PostOffice(8808, 8809);
  world = new World(postOffice, cam);



  //Register these two initial entities
  world.registerBeing(subject, true);
  world.registerBeing(other, true);




  postOffice.registerOscSubscription(new MoveSubjectX(subject), "/BulletCurtain/SetSubjectX");


  world.lockUpdateRate(60);
  world.start();
}


void initializeAnimatedSprites() { //helper, also, some code vaguely redundant.. 

  spriteToUseForSubject = new AnimatedSprite(); //animations must be added to this before it can be used!

  for (int i = 0; i < NUMBER_OF_ANIMATIONS_IN_LIST; i++) {

    //Generate frames for an animation, in the form of a PImage[]
    PImage[] generatedFrames = patternGenerator.generatePatternFrames(numberOfWidthBlocks, numberOfHeightBlocks, pixelsPerBlock, mainColor, numberOfAnimationFrames);

    //Use these frames to build an Animation
    Animation generatedAnimation = new Animation(generatedFrames, millisecondsPerFrame / animationSpeedMultiplier);

    //Add this Animation to the AnimatedSpite
    spriteToUseForSubject.addAnimation(generatedAnimation); //returns an int.. aka the index in the animation. useful sometimes, but not needed here
  }


  spriteToUseForOther = new AnimatedSprite(); //animations must be added to this before it can be used!

  for (int i = 0; i < NUMBER_OF_ANIMATIONS_IN_LIST; i++) {

    //Generate frames for an animation, in the form of a PImage[]
    PImage[] generatedFrames = patternGenerator.generatePatternFrames(numberOfWidthBlocks, numberOfHeightBlocks, pixelsPerBlock, altColor, numberOfAnimationFrames);

    //Use these frames to build an Animation
    Animation generatedAnimation = new Animation(generatedFrames, millisecondsPerFrame / animationSpeedMultiplier);

    //Add this Animation to the AnimatedSpite
    spriteToUseForOther.addAnimation(generatedAnimation); //returns an int.. aka the index in the animation. useful sometimes, but not needed here
  }


  spriteToUseForSubject.setActiveAnimation(0);
  spriteToUseForOther.setActiveAnimation(0);
}



void draw() {

  noSmooth();
  // scale(3);
  background(0);
  cam.draw();
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
}


class Other extends SubjectObjectRelation {

  float howMuchToTravel = 10;

  Other(float x, float y, AnimatedSprite animatedSprite) {
    super(x, y, animatedSprite);
  }

  void update() {
    setX(getX() - howMuchToTravel);
  }
}






class MoveSubjectX implements OscSubscriber {

  Subject subject;

  MoveSubjectX(Subject subject) {
    this.subject = subject;
  }

  void handleOscMessage(OscMessage message) {
    // float constrainedX = constrain(message.getAndRemoveFloat(), 0.0, 1.0);
    //float remappedX = map(constrainedX, 0.0, 1.0, 0.0, width);

    println("H!");
    //  subject.setX(remappedX);
    


    try {
      message.getContents();
    }
    catch (NullPointerException n) {
      println("null");
    }
  }
}


