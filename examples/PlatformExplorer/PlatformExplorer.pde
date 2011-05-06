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
    rect(-_width / 2, -HEIGHT / 2, _width, HEIGHT);
  }
 
}

/**
 * represents the player
 */
class Player extends MassedBeing {
  
  final static float PLAYER_WIDTH = 10;
  final static float PLAYER_HEIGHT = 30;
  final static float PLAYER_SPEED = 50;
  
  boolean _jumped = false;
  
  Player(float x, float y) {
    super(new Rectangle(makeVector(x, y), PLAYER_WIDTH, PLAYER_HEIGHT), zeroVector(), 1.0f, 1.0f);
  }
  
  void draw() {
    fill(0);
    rect(-PLAYER_WIDTH / 2, -PLAYER_HEIGHT / 2, PLAYER_WIDTH, PLAYER_HEIGHT);
  }
  
  void resetJump() {
    _jumped = false;
  }
  
  void handleKeyMessage(KeyMessage m) {
    String szKey = m.getKey();
    if(m.isPressed()) { // the player's movement is controlled by w/a/s/d
      if(szKey.equals("D") || szKey.equals("RIGHT"))
        getVelocity().x = PLAYER_SPEED;
      if(szKey.equals("A") || szKey.equals("LEFT"))
        getVelocity().x = -PLAYER_SPEED;
      if((szKey.equals("W") || szKey.equals("UP")) && !_jumped) {
        addImpulse(makeVector(0, -2*PLAYER_SPEED));
        _jumped = true;
      }
      if(szKey.equals("S") || szKey.equals("DOWN"))
        getVelocity().y = 2*PLAYER_SPEED;
    } else { // when a key is released, we stop the player
        if(szKey.equals("D") || szKey.equals("A") || szKey.equals("LEFT") || szKey.equals("RIGHT"))
          getVelocity().x = 0;
    }
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
    float boxWidth = area.getWidth();
    float boxHeight = area.getHeight();
    float maxPlatWidth = boxWidth / 2;
    float minPlatWidth = Platform.HEIGHT * 2;
    //int nRows = (int)(boxHeight / verticalStep) - 1;
    for(float y = area.getAbsMin().y + verticalStep; y <= area.getAbsMax().y - verticalStep; y += verticalStep) {
      float x = area.getAbsMin().x;
      while(x < area.getAbsMax().x) {
        float platWidth = random(minPlatWidth, maxPlatWidth);
        float baseDist = random(minPlatWidth, maxPlatWidth);
        x += platWidth / 2 + baseDist / density;
        addPlatform(makeVector(x, y), platWidth);
        x += platWidth / 2;
      }
    }  
  }
  
}

///////////////////////////////////////////////////
// Interactors
///////////////////////////////////////////////////

class PlatformCollider extends GenericMassedCollider<Player, Platform> {
  
  public PlatformCollider(float elasticity) {
    super(elasticity);
  }
  
  public boolean handle(Player player, Platform platform) {
    player.resetJump();
    return super.handle(player, platform);
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
  size(WINDOW_WIDTH, WINDOW_HEIGHT);  // set window size
  Hermes.setPApplet(this);            // give the library the PApplet
  
  // set up the world, camera, and post office
  cam = new Camera();
  po = new PostOffice();
  world = new World(po, cam);
  
  // set up the platforms
  platforms = new PlatformGroup(world);
  platforms.generatePlatforms(
    new Rectangle(makeVector(WINDOW_WIDTH / 2, WINDOW_HEIGHT / 2), 2 * WINDOW_WIDTH, 2 * WINDOW_HEIGHT),
    120.0f, 0.8);    
  
  // set up the player
  player = new Player(WINDOW_WIDTH / 2, WINDOW_HEIGHT / 2 + 60);
  Group<Player> playerGroup = new Group<Player>(world);
  world.registerBeing(player, true);
  playerGroup.add(player);
  po.registerKeySubscription(player, "D");
  po.registerKeySubscription(player, "S");
  po.registerKeySubscription(player, "W");
  po.registerKeySubscription(player, "A");
  po.registerKeySubscription(player, "UP");
  po.registerKeySubscription(player, "DOWN");
  po.registerKeySubscription(player, "LEFT");
  po.registerKeySubscription(player, "RIGHT");
  
  // make player collide with platforms
  world.registerInteraction(playerGroup, platforms, new PlatformCollider(0), false);
  
  // add gravity to player
  world.registerInteraction(GravityEnvironment.makeGravityGroup(makeVector(0, 50),
    new Rectangle(makeVector(WINDOW_WIDTH / 2, WINDOW_HEIGHT / 2), 2 * WINDOW_WIDTH, 2 * WINDOW_HEIGHT), world),
    playerGroup, GravityEnvironment.makeGravityInteractor(), false);
  
  // run it!
  smooth();
  world.lockUpdateRate(50);
  world.start();
}

void draw() {
  background(230);
  
  cam.setPosition(player.getPosition().x - WINDOW_WIDTH / 2, player.getPosition().y - WINDOW_HEIGHT / 2);
  
  cam.draw(); // draw the world
}
