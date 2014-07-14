/**
 * Central ball of the game
 * This is what player tries to get into the goal
 */
class Ball extends MassedBeing {

  Ball() {
    super(new HCircle(new PVector((canvasLeftX+balli*cellSideLength)+cellSideLength/2, 
    (containerTopY+ballj*cellSideLength)+cellSideLength/2), ballRadius), 
    new PVector(0, 0), ballMass, ballElasticity, 35, 8);
    world.register(this, true);
  }

  void update() {
    //determine cell containing ball
    int x = (int)getX();
    int y = (int)getY();
    x -= canvasLeftX;
    y -= containerTopY;
    int i = x / cellSideLength;
    int j = y / cellSideLength;

    //check to make sure did not escape //TODO: remove this hack if possible!
    if (i < 0) {
      i=0;
      setX(canvasLeftX);
      setVelocityX(-getVelocityX());
    }
    if (i >= canvasNumCellsX) {
      i=canvasNumCellsX-1;
      setX(canvasRightX);
      setVelocityX(-getVelocityX());
    }
    if (j < 0) {
      j=0;
      setY(containerTopY);
      setVelocityY(-getVelocityY());
    }
    if (j >= canvasNumCellsY) {
      j=canvasNumCellsY-1;
      setY(containerBottomY);
      setVelocityY(-getVelocityY());
    }

    //Add cell's flow to ball
    Cell[][] grid = canvas.getGrid();
    Cell in = grid[i][j];  
    if (!in.hasTool()) { //appply the flow if the cell has no tool within
      setVelocity(PVector.add(getVelocity(), in.getFlowDir()));
    }
  }

  void draw() {
    fill(189, 0, 0);
    noStroke();
    ellipse(0, 0, ballRadius*2, ballRadius*2);
  }
}


