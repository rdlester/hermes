import processing.opengl.*;
import java.util.Hashtable;

import hermes.*;
import hermes.hshape.*;
import hermes.animation.*;
import hermes.physics.*;
import hermes.postoffice.*;

///////////////////////////////////////////////////
// DEFINE
///////////////////////////////////////////////////

static final int WINDOW_WIDTH = 600;
static final int WINDOW_HEIGHT = 600;

static final float GRAVITY = -200; // acceleration due to gravity

///////////////////////////////////////////////////
// GLOBAL VARS
///////////////////////////////////////////////////

World world;
PlatformCamera cam;
PostOffice po;
PlatformGroup platforms;
Player player;

///////////////////////////////////////////////////
// PAPPLET
///////////////////////////////////////////////////

void setup() {
  size(600, 600);  // set window size
  Hermes.setPApplet(this);            // give the library the PApplet

  // set up the world, camera, and post office
  cam = new PlatformCamera();
  po = new PostOffice();
  world = new PlatformWorld(po, cam);

  rectMode(CENTER);

  frameRate(60);

  //Sets up and starts world
  world.start();
}

void draw() {
  background(230);

  world.draw();
}
