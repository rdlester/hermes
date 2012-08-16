import hermes.physics.*;
import hermes.animation.*;
import hermes.hshape.*;
import hermes.postoffice.*;
import hermes.*;
import static hermes.postoffice.POConstants.*;
import java.util.LinkedList;

/**

Future extensions (TODO):
Add rotator handle to tools
Add more complex types of tools

Bugs:
Super elastic tools do crazy things.

**/

///////////////////////////////////////////////////
// PAPPLET
///////////////////////////////////////////////////

void setup() {
  size(frameWidth, frameHeight);
  Hermes.setPApplet(this);
 
  world = new LevelWorld(PORT_IN, PORT_OUT);
  world.lockUpdateRate(50);
  
  rectMode(CORNER);
  setMode(BUILD);
   
  smooth();

  world.start(); // gets the World thread running
}

void draw() {
    background(bgColor);
    world.draw(); // World handles drawing
}


