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
// GLOBAL VARS
///////////////////////////////////////////////////

static final int WINDOW_WIDTH = 600;
static final int WINDOW_HEIGHT = 600;

World world;
Camera cam;
PostOffice po;

////////////////////////////////////////
// BEINGS
////////////////////////////////////////

class Canvas extends Being {
  
  int canvasWidth = 400;
  int canvasHeight = 570;
  
  Canvas(PVector topLeft, int canvasWidth, int canvasHeight) {
    super(topLeft, new PVector(canvasWidth, canvasHeight), PApplet.CORNER));
    this.canvasWidth = canvasWidth;
    this.canvasHeight = canvasHeight;
  }
  
  void draw() {
    rectMode(CORNER);
    rect(0,0, canvasWidth, canvasHeight);
  }

  
}

///////////////////////////////////////////////////
// PAPPLET
///////////////////////////////////////////////////

void setup() {
  size(WINDOW_WIDTH, WINDOW_HEIGHT); 
  Hermes.setPApplet(this);
 
  cam = new Camera();
  try {
   po = new PostOffice(8080, 8000);
  } catch(Exception e) {
   po = new PostOffice(); 
  }
  world = new World(po, cam);
  world.lockUpdateRate(50);
  
  Canvas canvas = new Canvas(new PVector(), 480, 570);
  
  smooth();

  world.start(); // gets the World thread running
}


void draw() {
    background(230);
    
    cam.draw(); // Camera object handles drawing all the appropriate Beings

}
