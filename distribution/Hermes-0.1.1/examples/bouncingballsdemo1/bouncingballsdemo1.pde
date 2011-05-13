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

World _world;
PostOffice _postOffice;
Camera _camera;

BallGroup _ballGroup;

void setup() {
  size(400,400); 
  Hermes.setPApplet(this);
 
  _camera = new Camera();
  _postOffice = new PostOffice(8080, 8000);
  _world = new World(_postOffice, _camera);
  _world.lockUpdateRate(50);
  
  
 
  _ballGroup = new BallGroup(_world);
  
  _postOffice.registerMouseSubscription(_ballGroup, PostOffice.BUTTON1);

  _world.start(); // gets the World thread running
}


void draw() {
    background(100);
    _camera.draw(); // Camera object handles drawing all the appropriate Beings
}

class BallGroup extends Group<Ball> implements MouseSubscriber {
  
  boolean _mousePressed;
  
  BallGroup(World world) {
   super(world); 
   _mousePressed = false;
  }
  
 
 void handleMouseMessage(MouseMessage m) {
   
   /*
   if(!_mousePressed) {
     Ball ball = new Ball(new PVector(m.getX(), m.getY()));
     getWorld().registerBeing(ball, true);
     this.add(ball);
     _mousePressed = true;
   } else {
     if(m.getAction()==PostOffice.MOUSE_RELEASED) {
        _mousePressed = false; 
     }
   }
   
   */
   
   
     Ball ball = new Ball(new PVector(m.getX(), m.getY()));
     getWorld().registerBeing(ball, true);
     this.add(ball);

   

 }
  
}



class Ball extends Being {
  
  Group _group;
  color _color;

  Ball(PVector center) {    
    super(new Circle(center, 20), new PVector(random(60) - 30, random(60) - 30));  
    _color = color(random(255), random(255), random(255));  
  } 

  void draw() {
    fill(_color);
    ellipse(0,0,20,20); // always draw at (0,0)
  }
}

