class DemoWorld extends World {
  DemoWorld(PostOffice po, HCamera cam) {
    super(po, cam);
  }

  void setup() {
    _ballGroup = new BallGroup(_world);
    //ball group handles all messages
    _postOffice.subscribe(_ballGroup, POLY_KEY);
    _postOffice.subscribe(_ballGroup, CIRCLE_KEY);
    _postOffice.subscribe(_ballGroup, RECT_KEY);
    _postOffice.subscribe(_ballGroup, DELETE_KEY);
    _postOffice.subscribe(_ballGroup, Button.LEFT);
    _postOffice.subscribe(_ballGroup, "/BouncingBalls/SetElasticity");
    _postOffice.subscribe(_ballGroup, "/BouncingBalls/SetMass");
    _postOffice.subscribe(_ballGroup, "/BouncingBalls/SetSides");
    _postOffice.subscribe(_ballGroup, "/BouncingBalls/SetRotate");

    _boxGroup = new BoxGroup(_world);

    //Set up the interactions
    _world.register(_ballGroup, _ballGroup, new MassedCollider(), new SelfInteractionOptimizer());
    _world.register(_boxGroup, _ballGroup, new InsideMassedCollider());
  }
}

