/**
 * Generates and stores the platforms in the game
 */
class PlatformGroup extends Group<Platform> {
  
  PlatformGroup(World world) { 
    super(world);
    
  }
  
  /**
   * adds a platform at given center and width
   */
  void addPlatform(PVector center, float width) {
    Platform platform = new Platform(center, width);
    world.registerBeing(platform, false);
    this.add(platform);
  }
  
  /**
   * fills an area with randomly-placed platforms
   */
  void generatePlatforms(Rectangle area, float verticalStep, float density) {
    float boxWidth = area.getRectWidth();
    float boxHeight = area.getRectHeight();
    float maxPlatWidth = boxWidth / 2;
    float minPlatWidth = Platform.HEIGHT * 2;
    // iterate through rows
    for(float y = area.getAbsMin().y + verticalStep; y <= area.getAbsMax().y - verticalStep; y += verticalStep) {
      float x = area.getAbsMin().x; // start at the left end of the rect
      float platWidth = random(minPlatWidth, maxPlatWidth); // width of the new platform
      float baseDist = random(minPlatWidth, maxPlatWidth);  // distance before the new platform
      x += platWidth / 2 + baseDist / density;              // move to the midpoint of the new platform
      while(x < area.getAbsMax().x - platWidth / 2) {       // keep going right until a platform would leave the rect
        addPlatform(new PVector(x, y, 0), platWidth);
        x += platWidth / 2;
        platWidth = random(minPlatWidth, maxPlatWidth);
        baseDist = random(minPlatWidth, maxPlatWidth);
        x += platWidth / 2 + baseDist / density;
      }
    }  
  }
  
  
}
