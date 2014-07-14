class Shot extends Being {


  float travel, shotWidth, shotHeight;

  Shot(float x, float y, float shotWidth, float shotHeight, float travel) {

    super(new HRectangle(x, y, shotWidth, shotHeight));
    this.travel = travel;
    this.shotWidth = shotWidth;
    this.shotHeight = shotHeight;
  }

  void update() {
    //This game doesn't use Hermes's built in physics, so the update needs to determine how much each shot travels
    setX(getX() + (travel * shotTravelMultiplier));

    //if the shot has traveled offscreen, delete it from the groups
    if (getX() > width) {
      world.delete(this);
    }
  }


  void draw() {
    noStroke();
    fill(255);
    rect(0, 0, shotWidth, shotHeight);
  }
}

