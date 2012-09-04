class Other extends Actor {

  OtherGroup parentGroup;
  
  Float howManyPixelsToTravel = 1.0;

  Other(float x, float y, float bodyWidth, float bodyHeight, AnimatedSprite animatedSprite) {
    super(x, y, bodyWidth, bodyHeight, animatedSprite);
  }

  void update() {
    setX(getX() - (howManyPixelsToTravel * otherTravelMultiplier));

    if (getX() + bodyWidth < 0) {
      world.delete(this);
    }
  }
}
