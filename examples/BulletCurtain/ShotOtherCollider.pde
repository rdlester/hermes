class ShotOtherCollider extends BoundingBoxCollider<Shot, Other> {

  void handle(Shot shot, Other other) {

    postOffice.sendFloat("/"+SYSTEM_NAME+"/"+"OtherDestroyed", 1.0);

    postOffice.sendFloat("/"+SYSTEM_NAME+"/"+"OtherDestroyedAtX", map(other.getX(), 0.0, width, 0.0, 1.0));
    postOffice.sendFloat("/"+SYSTEM_NAME+"/"+"OtherDestroyedAtY", map(other.getY(), 0.0, height, 0.0, 1.0));

    world.deleteFromGroups(shot);
    world.deleteFromGroups(other);
  }
}


