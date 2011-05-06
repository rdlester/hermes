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
//Frame size
int frameWidth = 700;
int frameHeight = 540;
//Canvas size and location
PVector canvasTopLeft = new PVector(30, 30);
int canvasWidth = 360;
int canvasHeight = 480;
//Cell constants
int cellSideLength = 40; //gives us 9 across, 12 down
int numCellsX = canvasWidth / cellSideLength;
int numCellsY = canvasHeight / cellSideLength;




////////////////////////////////////////
// BEINGS
////////////////////////////////////////

class Canvas extends Being {
  
	Tool[][] _grid;

  Canvas() {
    super(new Rectangle(canvasTopLeft, new PVector(canvasWidth, canvasHeight), PApplet.CORNER));
	 _grid = new Tool[numCellsX][numCellsY];
    initialize();
  }
  
  void initialize() {
    for(int i=0; i<numCellsX; i++) {
     for(int j=0; j<numCellsY; j++) {
      
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
   //Draw arrow
	strokeWeight(4 * _flowStrength);
	line(cellSideLength/2, cellSideLength/4, cellSideLength/2, (3 * cellSideLength)/4);
	line(cellSideLength/2, (3 * cellSideLength)/4, cellSideLength/)
	
 }

abstract class Tool extends Being {

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
