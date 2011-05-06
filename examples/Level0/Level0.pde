import src.template.library.*;
import src.hermes.*;
import src.hermesTest.physicsTest.*;
import src.hermesTest.postOfficeTests.*;
import src.hermes.shape.*;
import src.hermes.animation.*;
import src.hermesTest.shapeTests.*;
import src.hermesTest.core.*;
import src.hermes.physics.*;
import src.hermes.postoffice.*;
import static src.hermes.HermesMath.*;

///////////////////////////////////////////////////
// GLOBAL VARS AND CONSTANSTS
///////////////////////////////////////////////////

World world;
Camera cam;
PostOffice po;

int mode = 0; // 0 is setup; 1 is run
int frameWidth = 700;
int frameHeight = 540;
PVector canvasTopLeft = new PVector(30, 30);
int canvasWidth = 360;
int canvasHeight = 480;
int cellSideLength = 40; //gives us 9 across, 12 down




////////////////////////////////////////
// BEINGS
////////////////////////////////////////

class Canvas extends Being {
  
  Canvas() {
    super(new Rectangle(canvasTopLeft, new PVector(canvasWidth, canvasHeight), PApplet.CORNER));
    initialize();
  }
  
  void initialize() {
    for(int i=0; i<canvasWidth/sideLength; i++) {
     for(int j=0; j<canvasHeight/sideLength; j++) {
      
     } 
    }
  }
  
  void draw() {
    rectMode(CORNER);
    fill(230);
    rect(0,0, canvasWidth, canvasHeight);
  }

}

class Cell extends Being {
 
  PVector _flowDirection;
  Float _flowStrength;
  
  Cell(PVector topLeft) {
    super(new Rectangle(topLeft, new PVector(cellSideLength, cellSideLength), PApplet.CORNER);
    _flowDirection = new PVector(0,1);
    _flowStrength = 1;
  }
  
  void setFlow(PVector direction, float strength) {
    _flowDirection = direction; 
    _flowStrength = strength;
  }
  
 void draw() {
   noFill();
   stroke(180);
   rect(0, 0, cellSideLength, cellSideLength);
   
 }
  
}

///////////////////////////////////////////////////
// GROUPS
///////////////////////////////////////////////////

class CellGroup extends Group {
  
  
}

///////////////////////////////////////////////////
// PAPPLET
///////////////////////////////////////////////////

void setup() {
  size(frameWidth, frameHeight); 
  Hermes.setPApplet(this);
 
  cam = new Camera();
  try {
   po = new PostOffice(8080, 8000);
  } catch(Exception e) {
   po = new PostOffice(); 
  }
  world = new World(po, cam);
  world.lockUpdateRate(50);
  
  Canvas canvas = new Canvas();
  world.registerBeing(canvas, false);
  
  smooth();

  world.start(); // gets the World thread running
}


void draw() {
    background(110);
    
    cam.draw(); // Camera object handles drawing all the appropriate Beings

}
