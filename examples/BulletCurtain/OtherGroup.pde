class OtherGroup extends Group<Other> {

  float spawnX;
  float spawnY;
  int animationIndexToUseOnSpawn = 0;

  float otherTravelSpeed = 1.0;
  float otherTravelSpeedMultiplier = 2;

  float bodyWidth, bodyHeight;


  OtherGroup(World world, float bodyWidth, float bodyHeight) {
    super(world);
    
    this.bodyWidth = bodyWidth;
    this.bodyHeight = bodyHeight;

    //Default spawn position (on the right side of the screen)
    spawnX = width;
    spawnY = height/2 - bodyHeight/2;
  }

  void receive(OscMessage message) {
    String[] msgSplit = message.getAddress().split("/");

    if (msgSplit[1].equals(SYSTEM_NAME)) {
      if (msgSplit[2].equals("GenerateAnOther")) {
        if (message.hasRemainingArguments()) {
          if (message.getAndRemoveFloat() == 1.0) {       
            Other other = new Other(spawnX, spawnY, bodyWidth, bodyHeight, createAnimatedSpriteForOther());
            other.animatedSprite.setActiveAnimation(animationIndexToUseOnSpawn % other.animatedSprite.getNumberOfAnimations());
            other.animatedSprite.overrideMillisecondsPerFrame(numberOfMillisecondsFramePlaysFor);
            other.howManyPixelsToTravel = otherTravelSpeed;
            add(other);

            world.register(other);
          }
        }
      }

      else if (msgSplit[2].equals("SetOtherSpawnX")) {
        if (message.hasRemainingArguments()) {

          float constrainedX = constrain(message.getAndRemoveFloat(), 0.0, 1.0);
          float remappedX = map(constrainedX, 0.0, 1.0, (width/3), width - BODY_WIDTH);
          spawnX = remappedX;
        }
      }


      else if (msgSplit[2].equals("SetOtherSpawnY")) {
        if (message.hasRemainingArguments()) {
          float constrainedY = constrain(message.getAndRemoveFloat(), 0.0, 1.0);
          float remappedY = map(constrainedY, 0.0, 1.0, 0.0, height - BODY_HEIGHT);
          spawnY = remappedY;
        }
      }

      else if (msgSplit[2].equals("SetOtherTravelSpeed")) {
        if (message.hasRemainingArguments()) {
          float travel = constrain(message.getAndRemoveFloat(), 0.0, 1.0);
          travel = map(travel, 0.0, 1.0, 1.0, 20);
          otherTravelSpeed = travel;
        }
      }

      else if (msgSplit[2].equals("NewAnimationForSpawnedOthers")) {
        if (message.hasRemainingArguments()) {
          if (message.getAndRemoveFloat() == 1.0) {       
            animationIndexToUseOnSpawn++;
          }
        }
      }

      else if (msgSplit[2].equals("SetTravelMultiplierForAllOthers")) {
        if (message.hasRemainingArguments()) {
          if (message.getAndRemoveFloat() == 1.0) {       
            float newMultiplier = constrain(message.getAndRemoveFloat(), 0.0, 1.0);
            newMultiplier = map(newMultiplier, 0.0, 1.0, 0.0, 5);
            otherTravelMultiplier = newMultiplier;
          }
        }
      }
    }
  }
}

