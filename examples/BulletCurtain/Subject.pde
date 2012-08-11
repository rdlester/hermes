class Subject extends SubjectObjectRelation {


  Subject(float x, float y, float bodyWidth, float bodyHeight, AnimatedSprite animatedSprite) {
    super(x, y, bodyWidth, bodyHeight, animatedSprite);
  }

  void update() {
  }


  void handleOscMessage(OscMessage message) {

    String[] msgSplit = message.getAddress().split("/");


    if (msgSplit[1].equals(SYSTEM_NAME)) {


      if (msgSplit[2].equals("SetSubjectX")) {
        if (message.hasRemainingArguments()) {
          float constrainedX = constrain(message.getAndRemoveFloat(), 0.0, 1.0);
          float remappedX = map(constrainedX, 0.0, 1.0, 0.0, (width/3) - BODY_WIDTH);
          setX(remappedX);
        }
      }

      else if (msgSplit[2].equals("SetSubjectY")) {
        if (message.hasRemainingArguments()) {
          float constrainedY = constrain(message.getAndRemoveFloat(), 0.0, 1.0);
          float remappedY = map(constrainedY, 0.0, 1.0, 0.0, height - BODY_HEIGHT);
          setY(remappedY);
        }
      }

      else if (msgSplit[2].equals("MakeSubjectShoot")) {
        if (message.hasRemainingArguments()) {
          if (message.getAndRemoveFloat() == 1.0) {    
           shoot();
          }
        }
      }
    }
  }


  void shoot() {
    //Create a new shot (placed to the right of the Subject and proportional to its size)
    //then register it in the world, and register it for collisions
    Shot shot = new Shot(getX() + bodyWidth, getY() + (bodyHeight/2), bodyHeight/2, bodyHeight/4, universalShotTravel);
    world.registerBeing(shot, true);
    shotGroup.add(shot);
  }
}
