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
    po.subscribe(player, POConstants.W);
    po.subscribe(player, POConstants.A);
    po.subscribe(player, POConstants.S);
    po.subscribe(player, POConstants.D);
    po.subscribe(player, POConstants.UP);
    po.subscribe(player, POConstants.DOWN);
    po.subscribe(player, POConstants.LEFT);
    po.subscribe(player, POConstants.RIGHT);
  
    // make player collide with platforms
    world.register(player, platforms, new PlatformCollider(0));
  }
}
