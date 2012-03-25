/** 
 * Used in platform generation 
 * populates a rectangle with platforms 
 * sector coordinates are on a scale of 1800 pixels/unit (1/sector)
 */
static class Sector extends Being {
  
  final static int SECTOR_SIZE = 1800;    // pixel width of the sectors
  final static float VERTICAL_STEP = 120; // vertical space between platforms
  
  Rectangle rectangle;   // the rectangle
  
  int x, y;         // coordinates -- these are in sector space (1 unit per sector), not pixel space
  
  // creates a new sector at sector coors x,y, adds platforms to given PlatformGroup, with given density
  Sector(int x, int y, PlatformGroup platforms, float density) {
    super(rectOfSector(x,y));
    
    rectangle = getBoundingBox();
    this.x = x;
    this.y = y;
    
    platforms.generatePlatforms(rectangle, VERTICAL_STEP, density);
  }
  
  // the Rectangle defining the sector at this position
  static Rectangle rectOfSector(int x, int y) {
    return new Rectangle(new PVector((float)(x * SECTOR_SIZE), (float)(y * SECTOR_SIZE), 0), SECTOR_SIZE, SECTOR_SIZE);
  }
  
  // rectangles of the neighbors of this sector
  Rectangle[] getNeighborRects() {
    Rectangle[] rects = new Rectangle[8];
    rects[0] = rectOfSector(x, y - 1); // north
    rects[1] = rectOfSector(x, y + 1); // south
    rects[2] = rectOfSector(x + 1, y); // east
    rects[3] = rectOfSector(x - 1, y); // west
    rects[4] = rectOfSector(x + 1, y - 1); // NE
    rects[5] = rectOfSector(x + 1, y + 1); // SE
    rects[6] = rectOfSector(x - 1, y - 1); // NW
    rects[7] = rectOfSector(x - 1, y + 1); // SW
    
    return rects;
  }
    
}
