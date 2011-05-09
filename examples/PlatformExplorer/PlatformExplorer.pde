import processing.opengl.*;

import src.hermes.*;
import src.hermesTest.physicsTest.*;
import src.hermesTest.postOfficeTests.*;
import src.hermes.shape.*;
import src.hermes.animation.*;
import src.hermesTest.shapeTests.*;
import src.hermesTest.core.*;
import src.hermes.physics.*;
import src.hermes.postoffice.*;
import static src.hermes.HermesMath.*;

////////////////////////////////////////
// BEINGS
////////////////////////////////////////

/**
 * represents the stationary platforms in the game
 */
class Platform extends MassedBeing {
 
  static final float HEIGHT = 40.0f;              // the platform's height
  final color COLOR = color(125,125,125);  // the platform's color

  float _width;   // width of this platform

  /**
   * makes a Platform with given center and width
   */
  Platform(PVector center, float width) {
    super(new Rectangle(center, width, HEIGHT), zeroVector(), INFINITY, 1);
    
    _width = width;
  }
 
  void draw() {
    fill(COLOR);
    rect(0, 0, _width, HEIGHT);
  }
 
}

/**
 * represents the player
 */
class Player extends MassedBeing {
  
  final static float PLAYER_WIDTH = 16;
  final static float PLAYER_HEIGHT = 36;
  final static float PLAYER_SPEED = 50;
  
  final static int FACING_LEFT = 1;
  final static int FACING_RIGHT = 2;
  
  boolean _jumped = false;
  int _direction = FACING_RIGHT;
  
  AnimatedSprite _sprite;
  int _animIndex;
  
  Player(float x, float y) {
    super(new Rectangle(makeVector(x, y), PLAYER_WIDTH, PLAYER_HEIGHT), zeroVector(), 1.0f, 1.0f);
    
    _sprite = new AnimatedSprite();
    Animation anim = new Animation("skeilert_walk_final", 1, 24, ".png", (int)(1000.0f / 24.0f));
    _animIndex = _sprite.addAnimation(anim);
    println(_animIndex);
    _sprite.setActiveAnimation(_animIndex);
  }
  
  void draw() {
    fill(0);
    //rect(0, 0, PLAYER_WIDTH, PLAYER_HEIGHT);
    scale(0.2);
    imageMode(CENTER);
    if(_direction == FACING_LEFT) {
      scale(-1,1);
      translate(20, 0);
    }
    image(_sprite.animate(), 0, 0);
  }
  
  void resetJump() {
    _jumped = false;
  }
  
  void handleKeyMessage(KeyMessage m) {
    int nKey = m.getKeyCode();
    if(m.isPressed()) { // the player's movement is controlled by w/a/s/d
      if(nKey == PostOffice.D || nKey == PostOffice.RIGHT) {
        getVelocity().x = PLAYER_SPEED;
        _direction = FACING_RIGHT;
        _sprite.unpause();
      }
      if(nKey == PostOffice.A || nKey == PostOffice.LEFT) {
        getVelocity().x = -PLAYER_SPEED;
        _direction = FACING_LEFT;
        _sprite.unpause();
      }
      if((nKey == PostOffice.W || nKey == PostOffice.UP) && !_jumped) {
        addImpulse(makeVector(0, -2*PLAYER_SPEED));
        _jumped = true;
        //_sprite.pause();
      }
      if(nKey == PostOffice.S || nKey == PostOffice.DOWN) {
        getVelocity().y = 2*PLAYER_SPEED;
        //_sprite.pause();
      }
    } else { // when a key is released, we stop the player
        if(nKey == PostOffice.D || nKey == PostOffice.A || nKey == PostOffice.LEFT || nKey == PostOffice.RIGHT) {
          getVelocity().x = 0;
          _sprite.pause();
        }
    }
  } 
  
}

 
static class Sector extends Being {
  
  final static int SECTOR_SIZE = 1800;
  final static float VERTICAL_STEP = 120;
  
  Rectangle _rect;
  
  int x, y;
  
  Sector(int x, int y, PlatformGroup platforms, float density) {
    super(rectOfSector(x,y));
    
    _rect = getBoundingBox();
    this.x = x;
    this.y = y;
    
    platforms.generatePlatforms(_rect, VERTICAL_STEP, density);
  }
  
  static Rectangle rectOfSector(int x, int y) {
    return new Rectangle(makeVector((float)(x * SECTOR_SIZE), (float)(y * SECTOR_SIZE)), SECTOR_SIZE, SECTOR_SIZE);
  }
  
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
  
  void draw() {}
    
}

class SectorGrid extends Being {
 
  Hashtable<Integer, Sector> _sectors;
  Sector _currentSector;

  SectorGrid(Sector first) {
      super(first._rect);
      _sectors = new Hashtable<Integer, Sector>(); 
      _currentSector = first;
      _sectors.put(packCoors(first.x, first.y), first);
  }
    
  Sector getCurrentSector() {
   return _currentSector;
  }
  
  void setCurrentSector(Sector sector) {
    _currentSector = sector;
  }

  Hashtable<Integer, Sector> getSectors() {
    return _sectors;
  }
  
  void draw() {} 

  Integer packCoors(int x, int y) {
     return new Integer(x ^ y << 16);
   }
  
}

///////////////////////////////////////////////
// GROUPS
///////////////////////////////////////////////

/**
 * generates and stores the platforms in the game
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
    for(float y = area.getAbsMin().y + verticalStep; y <= area.getAbsMax().y - verticalStep; y += verticalStep) {
      float x = area.getAbsMin().x;
      float platWidth = random(minPlatWidth, maxPlatWidth);
      float baseDist = random(minPlatWidth, maxPlatWidth);
      x += platWidth / 2 + baseDist / density;
      while(x < area.getAbsMax().x - platWidth / 2) {
        addPlatform(makeVector(x, y), platWidth);
        x += platWidth / 2;
        platWidth = random(minPlatWidth, maxPlatWidth);
        baseDist = random(minPlatWidth, maxPlatWidth);
        x += platWidth / 2 + baseDist / density;
      }
    }  
  }
  
  
}

///////////////////////////////////////////////////
// Interactors
///////////////////////////////////////////////////

class PlatformCollider extends GenericMassedCollider<Player, Platform> {
  
  PlatformCollider(float elasticity) {
    super(elasticity);
  }
  
  boolean handle(Player player, Platform platform) {
    player.resetJump();
    return super.handle(player, platform);
  }
  
}

class PlatformGenerator implements Interactor<SectorGrid, Camera> {
        
   PlatformGroup _platformGroup;
   
   PlatformGenerator(PlatformGroup group) {
    _platformGroup = group;
   }
    
   boolean detect(SectorGrid grid, Camera cam) {
     return !grid.getCurrentSector().getBoundingBox().contains(cam.getBoundingBox());
   }
    
   boolean handle(SectorGrid grid, Camera cam) {
     Sector current = grid.getCurrentSector();
     Hashtable<Integer,Sector> sectors = grid.getSectors();
     Rectangle[] neighbors = current.getNeighborRects();
     for(int i = 0; i < 8; i++) {
       if(cam.getBoundingBox().collide(neighbors[i])) {
         int x = (int)neighbors[i].getPosition().x / Sector.SECTOR_SIZE;
         int y = (int)neighbors[i].getPosition().y / Sector.SECTOR_SIZE;
         if(sectors.get(packCoors(x,y)) == null) {
           sectors.put(packCoors(x,y), new Sector(x, y, _platformGroup, random(0.5, 1)));
         }
         if(neighbors[i].contains(cam.getBoundingBox().getCenter()))
           grid.setCurrentSector(sectors.get(packCoors(x,y)));
       }
     }
     return true;
   }
   
   Integer packCoors(int x, int y) {
     return new Integer(x ^ y << 16);
   }
  
}


///////////////////////////////////////////////////
// DEFINE
///////////////////////////////////////////////////

static final int WINDOW_WIDTH = 600;
static final int WINDOW_HEIGHT = 600;

///////////////////////////////////////////////////
// GLOBAL VARS
///////////////////////////////////////////////////

World world;
Camera cam;
PostOffice po;
PlatformGroup platforms;
Player player;

///////////////////////////////////////////////////
// PAPPLET
///////////////////////////////////////////////////

void setup() {
  size(WINDOW_WIDTH, WINDOW_HEIGHT, JAVA2D);  // set window size
  Hermes.setPApplet(this);            // give the library the PApplet
  
  // set up the world, camera, and post office
  cam = new Camera();
  po = new PostOffice();
  world = new World(po, cam);
  
  Rectangle initialBounds = new Rectangle(zeroVector(), INFINITY, INFINITY);
  
  //world.registerBeing(new RectBeing(initialBounds), false);
  
  // set up the platforms
  platforms = new PlatformGroup(world);
  Sector first = new Sector(0, 0, platforms, 0.8);
  SectorGrid grid = new SectorGrid(first);
  Group<SectorGrid> gridGroup = new Group<SectorGrid>(world);
  gridGroup.add(grid);
  
  Group<Camera> camGroup = new Group<Camera>(world);
  camGroup.add(cam);
  
  // set up platform generation
  world.registerInteraction(gridGroup, camGroup, new PlatformGenerator(platforms), true);
  
  // set up the player
  player = new Player(0, 60);
  Group<Player> playerGroup = new Group<Player>(world);
  world.registerBeing(player, true);
  playerGroup.add(player);
  po.registerKeySubscription(player, PostOffice.W);
  po.registerKeySubscription(player, PostOffice.A);
  po.registerKeySubscription(player, PostOffice.S);
  po.registerKeySubscription(player, PostOffice.D);
  po.registerKeySubscription(player, PostOffice.UP);
  po.registerKeySubscription(player, PostOffice.DOWN);
  po.registerKeySubscription(player, PostOffice.LEFT);
  po.registerKeySubscription(player, PostOffice.RIGHT);
  
  // make player collide with platforms
  world.registerInteraction(playerGroup, platforms, new PlatformCollider(0), false);
  
  // add gravity to player
  world.registerInteraction(GravityEnvironment.makeGravityGroup(makeVector(0, 50),
    initialBounds, world),
    playerGroup, GravityEnvironment.makeGravityInteractor(), false);
  
  rectMode(CENTER);
  
  // run it!
  //smooth();
  //world.lockUpdateRate(60);
  world.start();
}

void draw() {
  background(230);
  
  cam.setPosition(player.getPosition().x - WINDOW_WIDTH / 2, player.getPosition().y - WINDOW_HEIGHT / 2);
  
  cam.draw(); // draw the world
}
