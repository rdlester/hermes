///////////////////////////////////////////////////
// HELPER METHODS
///////////////////////////////////////////////////

/**
 * Changing mode of game between BUILD, RUN, and COMPLETED
 */
void setMode(int newMode) {
  if(newMode == BUILD) {
    if(bubbleGroup!=null) {//delete the bubbles
      bubbleGroup.destroy();
    }
    if(ball!=null) {     //delete the ball
      world.delete(ball);
      ball = null;
    }
    if(goal!=null) { // delete the goal
      world.delete(goal);
      goal = null;
    }
  } else if(newMode == RUN) {
    //clean up global vars
    templateTool = null;
    dragTool = null;
    selectedTool = null;
    
    makeBubbles();//make the bubbles (note: I put this before make the ball so that ball will be drawn overtop)
    ball = new Ball();    //make the ball
    world.addToGroup(ball, ballGroup);
    goal = new Goal();    //make the goal
    world.addToGroup(goal, goalGroup);
  } else if(newMode == COMPLETED) {
    //TODO: fill in 
    if(ball!=null) {
      world.delete(ball);
      ball = null; 
    }
  }
  
  mode = newMode;
}

/**
 * Factory helper method for filling canvas with bubbles
 */
void makeBubbles() {
  Cell[][] grid = canvas.getGrid();
  for(int i=0; i<canvasNumCellsX; i++) {
   for(int j=0; j<canvasNumCellsY; j++) {
     if(!grid[i][j].hasTool()) {
       Bubble bubble = new Bubble(new PVector(canvasLeftX+(i*cellSideLength)+(cellSideLength/2), containerTopY+(j*cellSideLength)+(cellSideLength/2)));
       world.addToGroup(bubble, bubbleGroup);//add to bubbleGroup
     }
   } 
  }
}


