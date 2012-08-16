class ShotOtherCollider extends BoundingBoxCollider<Shot, Other> {

  
  //Interaction sends OSC message when an "Other" is destroyed.
  void handle(Shot shot, Other other) {

    world.getPostOffice().sendFloat("/"+SYSTEM_NAME+"/"+"OtherDestroyed", 1.0);

    world.getPostOffice().sendFloat("/"+SYSTEM_NAME+"/"+"OtherDestroyedAtX", map(other.getX(), 0.0, width, 0.0, 1.0));
    world.getPostOffice().sendFloat("/"+SYSTEM_NAME+"/"+"OtherDestroyedAtY", map(other.getY(), 0.0, height, 0.0, 1.0));

    world.deleteFromGroups(shot);
    world.deleteFromGroups(other);
  }
}


