//Here is a skeleton of the basic things you need to set up a new Hermes app. 

import src.hermes.*;
import src.hermes.postoffice.*;
import src.hermes.animation.*;
import src.hermes.physics.*;
import src.hermes.hshape.*;

//At bare minimum, you want a World, PostOffice, and HCamera:
World world;
PostOffice postOffice;
HCamera hCamera;

void setup() {

  //Let Hermes know about your processing sketch
  Hermes.setPApplet(this);  

  hCamera = new HCamera(); 
  //Using port 8700 for OSC input and 8701 for OSC output
  //Change these if these ports are in use, or just call 'new PostOffice()' you aren't using OSC.
  postOffice = new PostOffice(8700, 8701); 

  //World takes a postOffice and an hCamera
  world = new World(postOffice, hCamera);
  
  //Now, do any setup you need (make Beings and Groups, register interactions and post office subscriptions, etc), set your screen resolution with size(), etc
  //
  //
  
  //lastly, start your world!
  world.start();
}

void draw() {
  
  //This will draw any beings contained within the bounds of your HCamera
  hCamera.draw();
}

//define your Being classes here:

