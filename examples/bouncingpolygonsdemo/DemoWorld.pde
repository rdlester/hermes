class DemoWorld extends World {
  DemoWorld(PostOffice po, HCamera cam) {
    super(po, cam);
  }

  void setup() {
    _ballGroup = new BallGroup(_world);
    //ball group handles all messages
    _postOffice.registerKeySubscription(_ballGroup, POLY_KEY);
    _postOffice.registerKeySubscription(_ballGroup, CIRCLE_KEY);
    _postOffice.registerKeySubscription(_ballGroup, RECT_KEY);
    _postOffice.registerKeySubscription(_ballGroup, DELETE_KEY);
    _postOffice.registerMouseSubscription(_ballGroup, LEFT_BUTTON);
    _postOffice.registerOscSubscription(_ballGroup, "/BouncingBalls/SetElasticity");
    _postOffice.registerOscSubscription(_ballGroup, "/BouncingBalls/SetMass");
    _postOffice.registerOscSubscription(_ballGroup, "/BouncingBalls/SetSides");
    _postOffice.registerOscSubscription(_ballGroup, "/BouncingBalls/SetRotate");

    _boxGroup = new BoxGroup(_world);

    //Set up the interactions
    _world.registerInteraction(_ballGroup, _ballGroup, new MassedCollider(), new SelfInteractionOptimizer());
    _world.registerInteraction(_boxGroup, _ballGroup, new InsideMassedCollider());
  }
}

