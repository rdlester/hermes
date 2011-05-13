
import src.hermes.*;
import src.hermesTest.physicsTest.*;
import src.hermesTest.postOfficeTests.*;
import src.hermes.shape.*;
import src.hermes.animation.*;
import src.hermesTest.shapeTests.*;
import src.hermesTest.core.*;
import src.hermes.physics.*;
import src.hermes.postoffice.*;

World _world;
PostOffice _postOffice;
Camera _camera;

BallGroup _ballGroup;

  boolean _mousePressed;
  float _origX, _origY;
  float _dX, _dY;

void setup() {
  size(400,400); 
  Hermes.setPApplet(this);
 
  _camera = new Camera();
  _postOffice = new PostOffice(8080, 8000);
  _world = new World(_postOffice, _camera);
  _world.lockUpdateRate(50);
 
  _ballGroup = new BallGroup(_world);
  
  _postOffice.registerMouseSubscription(_ballGroup, PostOffice.BUTTON1);
  
  _world.registerInteraction(_ballGroup, _ballGroup, new MassedCollider(), false);

  smooth();

  _world.start(); // gets the World thread running
}


void draw() {
    background(230);
    fill(color(255,0,0));
    ellipse(200, 125, 150, 150);
    if(_mousePressed) {
     line(_origX, _origY, _dX, _dY); 
    }
    
    _camera.draw(); // Camera object handles drawing all the appropriate Beings

}

class BallGroup extends Group<Ball> implements MouseSubscriber {
  

  
  BallGroup(World world) {
   super(world); 
   _mousePressed = false;
  }
  
 
 void handleMouseMessage(MouseMessage m) {
   if(!_mousePressed && m.getAction()==PostOffice.MOUSE_PRESSED) {
     _mousePressed = true;
     _origX = m.getX();
     _origY = m.getY();
     _dX = m.getX();
     _dY = m.getY();
   } else if (m.getAction()==PostOffice.MOUSE_DRAGGED) {
     _dX = m.getX();
     _dY = m.getY();  
   } else if(m.getAction()==PostOffice.MOUSE_RELEASED) {
      _mousePressed = false; 
      Ball ball = new Ball(new PVector(_dX, _dY), new PVector(_dX-_origX, _dY-_origY));
      getWorld().registerBeing(ball, true);
      this.add(ball);
   }
   

 }
  
}



class Ball extends MassedBeing {
  
  Group _group;
  color _color;

  Ball(PVector center, PVector velocity) {    
    super(new Circle(center, 20), velocity, 1, 1);  
    _color = color(random(255), random(255), random(255));  
  } 

  void draw() {
    fill(_color);
    ellipse(0,0,40,40); // always draw at (0,0)
  }
}

