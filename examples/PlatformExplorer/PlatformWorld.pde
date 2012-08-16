class PlatformWorld extends World {
  PlatformWorld(PostOffice po, HCamera cam) {
    super(po,cam);
  }
  
  void setup() {
    // set up the platforms
    platforms = new PlatformGroup(world);
    Sector first = new Sector(0, 0, platforms, 0.8);
    SectorGrid grid = new SectorGrid(first, platforms);
  
    // set up platform generation
    world.register(grid, cam, new PlatformGenerator());
  
    // set up the player
    player = new Player(0, 60);
    println("player created");
    world.register(player, true);
    po.registerKeySubscription(player, POConstants.W);
    po.registerKeySubscription(player, POConstants.A);
    po.registerKeySubscription(player, POConstants.S);
    po.registerKeySubscription(player, POConstants.D);
    po.registerKeySubscription(player, POConstants.UP);
    po.registerKeySubscription(player, POConstants.DOWN);
    po.registerKeySubscription(player, POConstants.LEFT);
    po.registerKeySubscription(player, POConstants.RIGHT);
  
    // make player collide with platforms
    world.register(player, platforms, new PlatformCollider(0));
  }
}
