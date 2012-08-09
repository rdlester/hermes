/** 
 * Stores the sectors in the game, holding them in a Hashtable
 * this allows for storage of an indefinite number of sectors
 * allocated on the fly
 */
class SectorGrid extends Being {
 
  Hashtable<Integer, Sector> sectors;  // all the sectors, hashed by a number derived from their coordinates
  Sector currentSector;                // the current sector containing the character

  PlatformGroup platformGroup;      // group to add platforms to

  // sets up the grid with a starting sector
  SectorGrid(Sector first, PlatformGroup platforms) {
      super(first.rectangle);
      sectors = new Hashtable<Integer, Sector>(); 
      currentSector = first;
      platformGroup = platforms;
      sectors.put(packCoors(first.x, first.y), first);
  }
    
  // returns the sector where the camera is currently centered
  Sector getCurrentSector() {
   return currentSector;
  }
  
  // changes the current sector where the camera is centered
  void setCurrentSector(Sector sector) {
    currentSector = sector;
  }
 
  // used for generating the hash code for sectors
  Integer packCoors(int x, int y) {
     return new Integer(x ^ y << 16);
  }
  
  // gets the sector at the given x,y sector coordinates
  // if the sector is not yet in the hastable, it is generated and populated
  Sector getSector(int x, int y) {
    Integer coors = packCoors(x, y);
    Sector sector = sectors.get(coors); // retrieve the sector
    if(sector == null) {        // if it does not yet exist, generate it
      sector = new Sector(x, y, platformGroup, random(0.5, 1)); // generate with random density
      sectors.put(coors, sector);       // add the new sector to the hastable
    }
    return sector;
  }
  
}
