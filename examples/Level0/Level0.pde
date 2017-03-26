/**
Level0 is a prototype level-editor
for exploring the use of arbitrary force/vector fields in physics-based games.

The goal of the game is to get a red ball into the goal.

To do so, the player will have to guide the ball
through an electric field that pushes and pulls the ball in various directions.

The grid on the bottom right represents the main playing field.
The ball starts on the top right, and the goal is located on the bottom right.
The arrows in each cell represent the direction of the force applied by the electric field at that location.

The giant 'play' button will start and stop the ball's motion.
When playing, small blue balls starting from the centers of all but the ball-start and goal cell
will appear in order to help visualize the flow produced by the current electric field.
To change the electric field, click the star button or hit 'space'.

The grid on the bottom left is the "toolbox".
There are four types of tools that can be placed in the game:
- diamond
- triangle
- hexagon
- circle
- right trianle (wedge)
To add a block to the playing field, first click on the tool to select it,
then click on a grid cell in the playing field to add it.
Clicking and dragging on the playing field will 'paint' the tool across the cells.
To delete a tool from the playing field, simply drag it off the playing field and release.
To rotate a tool, select it and press the 'w' key.
To change the elasticity of the tool, select it and press the 'e' key.
(Note: the clear elasticity adds speed to the ball on a bounce,
potentially causing it to move too fast for the physics engine to handle! Use alternate elasticities with caution)
**/

import hermes.physics.*;
import hermes.animation.*;
import hermes.hshape.*;
import hermes.postoffice.*;
import hermes.*;
import static hermes.postoffice.POCodes.*;
import java.util.LinkedList;

///////////////////////////////////////////////////
// PAPPLET
///////////////////////////////////////////////////

void setup() {
  size(600, 600);
  Hermes.setPApplet(this);

  world = new LevelWorld();
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


