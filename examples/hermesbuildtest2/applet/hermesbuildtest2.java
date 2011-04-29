import processing.core.*; 
import processing.xml.*; 

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

import java.applet.*; 
import java.awt.Dimension; 
import java.awt.Frame; 
import java.awt.event.MouseEvent; 
import java.awt.event.KeyEvent; 
import java.awt.event.FocusEvent; 
import java.awt.Image; 
import java.io.*; 
import java.net.*; 
import java.text.*; 
import java.util.*; 
import java.util.zip.*; 
import java.util.regex.*; 

public class hermesbuildtest2 extends PApplet {












World _world;
PostOffice _postOffice;
Camera _camera;

MrRectangle _myMrRectangle; 


public void setup() {
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


public void draw() {
  synchronized(_camera) {
    _camera.draw(); // Camera object handles drawing all the appropriate Beings
  }
}


class MrRectangle extends Being {
 
 MrRectangle(Shape myshape, PVector position, PVector velocity) {
   super(myshape, velocity);
 }
 
 public void draw() {
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

  static public void main(String args[]) {
    PApplet.main(new String[] { "--present", "--bgcolor=#666666", "--stop-color=#cccccc", "hermesbuildtest2" });
  }
}
