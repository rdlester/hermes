//ball
Ball ball = null;
int balli = 0; //index in canvas
int ballj = 0;
int ballRadius = 10;
int ballMass = 100;
int ballElasticity = 1;
//goal
Goal goal = null;
int goali = 0; //index in canvas
int goalj = canvasNumCellsY-1;

////////////////////////////////////////
// BALLS AND GOAL
////////////////////////////////////////
/**
 *
 */
class Ball extends MultisampledMassedBeing {
  
  Ball() {
    super(new Circle(new PVector((canvasLeftX+balli*cellSideLength)+cellSideLength/2, 
                                 (containerTopY+ballj*cellSideLength)+cellSideLength/2),
                     ballRadius), 
          new PVector(0,0), ballMass, ballElasticity, 35, 8);
    world.registerBeing(this, true);
  }
  
  void update() {
    //add the flow from the cell
    int x = (int)getX();
    int y = (int)getY();
    x -= canvasLeftX;
    y -= containerTopY;
    int i = x / cellSideLength;
    int j = y / cellSideLength;
        
    //check to make sure did not escape //TODO: remove this hack if possible!
    if(i < 0) {
      i=0;
      setX(canvasLeftX);
      setVelocityX(-getVelocityX());
    }
    if(i >= canvasNumCellsX) {
      i=canvasNumCellsX-1;
      setX(canvasRightX);
      setVelocityX(-getVelocityX());
    }
    if(j < 0) {
      j=0;
      setY(containerTopY);
      setVelocityY(-getVelocityY());
    }
    if(j >= canvasNumCellsY) {
      j=canvasNumCellsY-1;
      setY(containerBottomY);
      setVelocityY(-getVelocityY());
    }
    
    Cell[][] grid = canvas.getGrid();
    Cell in = grid[i][j];  
    if(!in.hasTool()) { //appply the flow if the cell has no tool within
     setVelocity(PVector.add(getVelocity(), in.getFlowDir()));
    } 
  }
  
  void draw() {
    fill(189, 0, 0);
    noStroke();
    ellipse(0,0,ballRadius*2,ballRadius*2);
  }
}

/**
 *
 */
class Goal extends Being {
 Goal() {
  super(new Rectangle(new PVector((canvasLeftX+goali*cellSideLength), 
                                 (containerTopY+goalj*cellSideLength)), 
                      new PVector(cellSideLength, cellSideLength), PApplet.CORNER), 
        new PVector(0,0));
  world.registerBeing(this, false);
 }
 void draw() {
  if(mode == RUN) {
    strokeWeight(3);
    stroke(189, 0, 0);
    line(10,10,cellSideLength-10,cellSideLength-10); //    \
    line(cellSideLength-10, 10, 10, cellSideLength-10); //  /
  } else if(mode == COMPLETED) {
    strokeWeight(2);
    stroke(255);
    fill(62, 67, 71, 130);
    rect(0, 0, cellSideLength, cellSideLength);
    strokeWeight(3);
    stroke(0, 240, 0);
    line(15, 20, 20, 30); // \
    line(20, 30, 30, 10); // /
  }
 } 
}

/**
 *
 */
class Bubble extends MultisampledMassedBeing {
  
  Bubble(PVector position) {
    super(new Circle(position, ballRadius/2), new PVector(0,0), ballMass, ballElasticity, 35, 8);
    world.registerBeing(this, true);
  }
  
  void draw() {
    fill(146, 239, 233, 120);
    noStroke();
    ellipse(0,0,ballRadius,ballRadius);
  }
  
  void update() {    
    //add the flow from the cell
    int x = (int)getX();
    int y = (int)getY();
    x -= canvasLeftX;
    y -= containerTopY;
    int i = x / cellSideLength;
    int j = y / cellSideLength;
    
    //check to make sure did not escape //TODO: remove this hack if possible!
    if(i < 0) {
      i=0;
      setX(canvasLeftX);
      setVelocityX(-getVelocityX());
    }
    if(i >= canvasNumCellsX) {
      i=canvasNumCellsX-1;
      setX(canvasRightX);
      setVelocityX(-getVelocityX());
    }
    if(j < 0) {
      j=0;
      setY(containerTopY);
      setVelocityY(-getVelocityY());
    }
    if(j >= canvasNumCellsY) {
      j=canvasNumCellsY-1;
      setY(containerBottomY);
      setVelocityY(-getVelocityY());
    }
    
    Cell[][] grid = canvas.getGrid();
    Cell in = grid[i][j];  
    if(!in.hasTool()) { //appply the flow if the cell has no tool within
     setVelocity(PVector.add(getVelocity(), in.getFlowDir()));
    }
  } 
}

///////////////////////////////////////////////////
// INTERACTORS
///////////////////////////////////////////////////

class BallGoalCollider extends Collider<Ball, Goal> {
  public boolean handle(Ball being1, Goal being2) {
    setMode(COMPLETED);
    return true;
  }
}
