class OtherGroup extends Group {

  OtherGroup(World world) {
    super(world);
  }

  float spawnX = width;
  float spawnY = height/2 - BODY_HEIGHT/2;
  int animationIndexToUseOnSpawn = 0;

  Float groupTravelSpeed = 1.0;

  void handleOscMessage(OscMessage message) {
    String[] msgSplit = message.getAddress().split("/");

    if (msgSplit[1].equals(SYSTEM_NAME)) {
      if (msgSplit[2].equals("GenerateAnOther")) {
        if (message.hasRemainingArguments()) {
          if (message.getAndRemoveFloat() == 1.0) {       
            Other other = new Other(spawnX, spawnY, BODY_WIDTH, BODY_HEIGHT, createAnimatedSpriteForOther());
            other.animatedSprite.setActiveAnimation(animationIndexToUseOnSpawn % other.animatedSprite.getNumberOfAnimations());
            other.animatedSprite.overrideMillisecondsPerFrame(numberOfMillisecondsFramePlaysFor);
            other.howManyPixelsToTravel = groupTravelSpeed;
            add(other);

            world.registerBeing(other, true);
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
          groupTravelSpeed = travel;
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


