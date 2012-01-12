/**
 * Translucent balls demonstrating flow of canvas to player
 * Do not interact with the goal
 */
class Bubble extends MassedBeing {

  Bubble(PVector position) {
    super(new Circle(position, ballRadius/2), new PVector(0, 0), ballMass, ballElasticity, 35, 8);
    world.registerBeing(this, true);
  }

  void draw() {
    fill(146, 239, 233, 120);
    noStroke();
    ellipse(0, 0, ballRadius, ballRadius);
  }

  void update() {    
    //Get the cell the bubble is in
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

    //Add the flow to the bubble
    Cell[][] grid = canvas.getGrid();
    Cell in = grid[i][j];  
    if (!in.hasTool()) { //appply the flow if the cell has no tool within
      setVelocity(PVector.add(getVelocity(), in.getFlowDir()));
    }
  }
}

