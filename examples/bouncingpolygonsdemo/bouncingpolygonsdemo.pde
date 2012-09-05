/*
* Physics demo:
* Click and release mouse to create shapes
* Drag to give polygon velocity
* Use the '1', '2', and '3' keys to choose shape
* '1' = Rectangle, '2' = Circle, '3' = Polygon
* Use the 'd' key to delete shapes
*
* OSC demo:
* Open 'oscControl.pd' in puredata
* Click the button attached to the 'connect' message
* While this sketch is running,
* use sliders to create polygons of different shapes and sizes
*/

//import src.template.library.*;
import hermes.*;
import hermes.hshape.*;
import hermes.animation.*;
import hermes.physics.*;
import hermes.postoffice.*;
import java.util.Random;
import static hermes.HermesMath.*;
import static hermes.postoffice.POCodes.*;

//////////////
// Constants
//////////////

//Engine parts
World _world;
PostOffice _postOffice;
HCamera _camera;

//Groups
BallGroup _ballGroup;
BoxGroup _boxGroup;

//Tracking the mouse
boolean _mousePressed;
float _origX, _origY;
float _dX, _dY;

//Screen/World size
final int WIDTH = 400;
final int HEIGHT = 400;

//Used in creating polygons, updated by OSC
static int polyPoint = 3; //Number of points in PolyBalls
static float polyRot = 0; //Amount to rotate new PolyBalls by

//Constant determining ball size
static final int ballSize = 25; //Size of ball, scaled by ball mass

//Used for creating different shapes
static int mode = 0; //Mode dictating which type of ball will get created
static final int POLY_MODE = 0;
static final int POLY_KEY = Key.VK_1;
static final int CIRCLE_MODE = 1;
static final int CIRCLE_KEY = Key.VK_2;
static final int RECT_MODE = 2;
static final int RECT_KEY = Key.VK_3;
static final int DELETE_KEY = D;

void setup() {
  size(WIDTH, HEIGHT);
  Hermes.setPApplet(this);
 
  //Set up the engine
  _camera = new HCamera();
  try {
    _postOffice = new PostOffice(8080, 8000);
  } catch(Exception e) {
    _postOffice = new PostOffice();
  }
  _world = new DemoWorld(_postOffice, _camera);
  _world.lockUpdateRate(50);

  smooth();

  _world.start(); // gets the World thread running
}


void draw() {
  background(230); //Overwrite what's already been drawn
	
  if(_mousePressed) {
    //Draw line indicating velocity of created ball
    line(_origX, _origY, _dX, _dY);
  }
    
  _camera.draw(); //Camera object handles drawing all the appropriate Beings

}








