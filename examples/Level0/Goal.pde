/**
 * Where player is trying to get the ball
 */
class Goal extends Being {
  Goal() {
    super(new HRectangle(new PVector((canvasLeftX+goali*cellSideLength), 
                        (containerTopY+goalj*cellSideLength)), 
                        new PVector(cellSideLength, cellSideLength)), 
          new PVector(0, 0));
    world.register(this, false);
  }

  void draw() {
    if (mode == RUN) {
      //Draw X
      strokeWeight(3);
      stroke(189, 0, 0);
      line(10, 10, cellSideLength-10, cellSideLength-10); //    \
      line(cellSideLength-10, 10, 10, cellSideLength-10); //  /
    } 
    else if (mode == COMPLETED) {
      //Draw check mark
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


