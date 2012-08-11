class ShotGroup extends Group {

  ShotGroup(World world) {
    super(world);
  }

  float initialTravel;

  void handleOscMessage(OscMessage message) {
    String[] msgSplit = message.getAddress().split("/");

    if (msgSplit[1].equals(SYSTEM_NAME)) {
      if (message.hasRemainingArguments()) {
        if (msgSplit[2].equals("SetTravelMultiplierForAllShots")) {
          float newMultiplier = constrain(message.getAndRemoveFloat(), 0.0, 1.0);
          newMultiplier = map(newMultiplier, 0.0, 1.0, 0.0, 10);
          shotTravelMultiplier = newMultiplier;
        }
      }
    }
  }
}

