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
    po.subscribe(player, POCodes.Key.W);
    po.subscribe(player, POCodes.Key.A);
    po.subscribe(player, POCodes.Key.S);
    po.subscribe(player, POCodes.Key.D);
    po.subscribe(player, POCodes.Key.UP);
    po.subscribe(player, POCodes.Key.DOWN);
    po.subscribe(player, POCodes.Key.LEFT);
    po.subscribe(player, POCodes.Key.RIGHT);
  
    // make player collide with platforms
    world.register(player, platforms, new PlatformCollider(0));
  }
}
