/**
 * A template to get you started
 * Define your beings, groups, interactors and worlds in separate tabs
 * Put the pieces together in this top-level file!
 */

import hermes.*;
import hermes.hshape.*;
import hermes.animation.*;
import hermes.physics.*;
import hermes.postoffice.*;
import static hermes.HermesMath.*;
import static hermes.postoffice.POConstants.*;

///////////////////////////////////////////////////
// CONSTANTS
///////////////////////////////////////////////////
/**
 * Constants should go up here
 * Making more things constants makes them easier to adjust and play with!
 */
static final int WINDOW_WIDTH = 600;
static final int WINDOW_HEIGHT = 600;
static final int PORT_IN = 8080;
static final int PORT_OUT = 8000; 

World currentWorld;

/**
 * Add groups here if you need custom group behavoir
 */

///////////////////////////////////////////////////
// PAPPLET
///////////////////////////////////////////////////

void setup() {
  size(WINDOW_WIDTH, WINDOW_HEIGHT); 
  Hermes.setPApplet(this);

  currentWorld = new TemplateWorld(PORT_IN, PORT_OUT);       

  //Important: don't forget to add setup to TemplateWorld!

  world.start(); // this should be the last line in setup() method
}

void draw() {
  world.draw();
}
