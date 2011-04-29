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

MrRectangle _myMrRectangle; 


void setup() {
 size(400,400); 
 Hermes.setPApplet(this);
 
 _camera = new Camera();
 _postOffice = new PostOffice(8080, 8000);
 _world = new World(_postOffice, _camera);
 _world.lockUpdateRate(50);
 
 PVector myposition = new PVector(20,20);
 _myMrRectangle = new MrRectangle(new Rectangle(myposition,10,10), myposition, new PVector(10,0));
 _world.registerBeing(_myMrRectangle, true);
 
 
 
 
 //Group<Ball> _ballGroup = new Group(_world); //make a Group to hold the Balls
  
  // TODO: deal with PostOffice interfacing when updated
  // - "register" for mouseclicks, generate ball where at click x,y
  
  
  
  
 




  _world.start(); // gets the World thread running
}


void draw() {
  synchronized(_camera) {
    _camera.draw(); // Camera object handles drawing all the appropriate Beings
  }
}


class MrRectangle extends Being {
 
 MrRectangle(Shape myshape, PVector position, PVector velocity) {
   super(myshape, velocity);
 }
 
 void draw() {
    fill(random(255));
    rect(0,0,1,10);
 }
  
}
/*
class Ball extends Being {

  Group _group;

  //TODO: give velocity vars (will new update loop handle moving? i think so)

  Ball(Group group) {
    super();
    _group = group;
    _group.add(this);
    //TODO: fill in
    //TODO: add random init velocity
    
  } 

  draw() {
    ellipse(0,0,30,30); // always draw at (0,0)
  }
}
*/

