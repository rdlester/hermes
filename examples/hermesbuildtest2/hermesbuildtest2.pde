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

MrRectangle _firstMrRectangle; 
MrRectangle _secondMrRectangle;

void setup() {
 size(400,400); 
 Hermes.setPApplet(this);
 
 _camera = new Camera();
 _postOffice = new PostOffice(8080, 8000);
 _world = new World(_postOffice, _camera);
 _world.lockUpdateRate(3);
 
 PVector firstposition = new PVector(20,20);
 _firstMrRectangle = new MrRectangle(new Rectangle(firstposition,10,10), firstposition, new PVector(40,0));
 PVector secondposition = new PVector(20,40);
 _secondMrRectangle = new MrRectangle(new Rectangle(secondposition,10,10), secondposition, new PVector(60,0));
 _world.registerBeing(_firstMrRectangle, true);
 _world.registerBeing(_secondMrRectangle, true);
 
 
 
 
 //Group<Ball> _ballGroup = new Group(_world); //make a Group to hold the Balls
  
  // TODO: deal with PostOffice interfacing when updated
  // - "register" for mouseclicks, generate ball where at click x,y
  
  
  
  
 




  _world.start(); // gets the World thread running
}


void draw() {
    background(100);
    _camera.draw(); // Camera object handles drawing all the appropriate Beings
}


class MrRectangle extends Being {
 
 MrRectangle(Shape firstshape, PVector position, PVector velocity) {
   super(firstshape, velocity);
 }
 
 void draw() {
   //background(100);
   //fill(255);
   //stroke(0);
    //fill(random(255), random(255), random(255));
    rect(0,0,10,10);
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

