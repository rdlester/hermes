/*
* This version has the "slingshot" look and a bounding box internal collisions
*
*/

//import src.template.library.*;
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
BoxGroup _boxGroup;

  boolean _mousePressed;
  float _origX, _origY;
  float _dX, _dY;

final int WIDTH = 400;
final int HEIGHT = 400;

void setup() {
  size(WIDTH, HEIGHT); 
  Hermes.setPApplet(this);
 
  _camera = new Camera();
  _postOffice = new PostOffice(8080, 8000); 
  _world = new World(_postOffice, _camera);
  _world.lockUpdateRate(50);
 
  _ballGroup = new BallGroup(_world);
  _postOffice.registerMouseSubscription(_ballGroup, PostOffice.LEFT_BUTTON);
  _postOffice.registerOscSubscription(_ballGroup, "/BouncingBalls/SetElasticity");
  _postOffice.registerOscSubscription(_ballGroup, "/BouncingBalls/SetMass");
  
  _boxGroup = new BoxGroup(_world);
  
  _world.registerInteraction(_ballGroup, _ballGroup, new MassedCollider(), false);
  _world.registerInteraction(_boxGroup, _ballGroup, new InsideMassedCollider(), false);

  GravityEnvironment enviro = new GravityEnvironment(new PVector(0, 100),
    new Rectangle(new PVector(0,0), new PVector(0,0), new PVector(WIDTH, HEIGHT)));
  Group<GravityEnvironment> gravGroup = new Group<GravityEnvironment>(_world);
  _world.registerBeing(enviro, false);
  gravGroup.add(enviro);
  _world.registerInteraction(gravGroup, _ballGroup, GravityEnvironment.makeGravityInteractor(), false);
  
  Group<Platform> platforms = new Group<Platform>(_world);
  Platform plat1 = new Platform(new PVector(200,200),100);
  _world.registerBeing(plat1, true);
  platforms.add(plat1);
  _world.registerInteraction(platforms, _ballGroup, new MassedCollider(), false);
  
  smooth();

  _world.start(); // gets the World thread running
}


void draw() {
    background(230);
    if(_mousePressed) {
     line(_origX, _origY, _dX, _dY); 
    }
    
    _camera.draw(); // Camera object handles drawing all the appropriate Beings

}

class BoxGroup extends Group<Box> {
 
  BoxGroup(World world) {
    super(world);
    Box boite = new Box();
    getWorld().registerBeing(boite, true);
    this.add(boite);
  }
  
}

class BallGroup extends Group<Ball> implements MouseSubscriber {
  
  float _newMass = 1;
  float _newElasticity = 0.5;
  
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
      Ball ball = new Ball(new PVector(_origX, _origY), new PVector(_origX-_dX, _origY-_dY), _newMass, _newElasticity);
      getWorld().registerBeing(ball, true);
      this.add(ball);
   }
 }
   
   void handleOscMessage(OscMessage m) {
     
     String[] messages = m.getAddress().split("/");
     
     if(messages[1].equals("BouncingBalls")) {
       
       if(messages[2].equals("SetMass")) {
         _newMass = constrain(m.getAndRemoveFloat(), 0, 1);
       }
       else if(messages[2].equals("SetElasticity")) {
         _newElasticity = constrain(m.getAndRemoveFloat(), 0, 1);
       }
       
     }
     
   }
  
}

class Ball extends MultisampledMassedBeing {
  
  Group _group;
  color _color;

  Ball(PVector center, PVector velocity, float mass, float elasticity) {    
    super(new Circle(center, 25 * mass), velocity, mass, elasticity, 35, 8);  
    _color = color(random(255), random(255), random(255));  
  } 

  void update() {
    if(getX() < 0)
      setX(0);
    if(getY() < 0)
      setY(0);
    if(getX() > (float)WIDTH)
      setX((float)WIDTH);
    if(getY() > (float)HEIGHT)
      setY((float)HEIGHT);
  }

  void draw() {
    fill(_color);
    ellipse(0,0,50 * getMass(),50 * getMass()); // always draw at (0,0)
  }
  
}

class Platform extends MassedBeing {
  
  float _width;
  
 Platform(PVector center, float width) {
   super(new Rectangle(center, width, 40), new PVector(0,0), Float.POSITIVE_INFINITY, 1);
   _width = width;
 }
  
 void draw() {
   fill(120);
   rect(-_width/2, -20, _width, 40);
 }
  
}

class Box extends MassedBeing {
  
  Box() {
   super(new Rectangle(new PVector(0,0), new PVector(0,0), new PVector((float)WIDTH,(float)HEIGHT)), new PVector(0,0), Float.POSITIVE_INFINITY, 1); 
  }
  
  void draw() {}
  
}

