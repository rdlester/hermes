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
  
  final static float PLAYER_WIDTH = 10;
  final static float PLAYER_HEIGHT = 30;
  final static float PLAYER_SPEED = 50;
  
  boolean _jumped = false;
  
  Player(float x, float y) {
    super(new Rectangle(makeVector(x, y), PLAYER_WIDTH, PLAYER_HEIGHT), zeroVector(), 1.0f, 1.0f);
  }
  
  void draw() {
    fill(0);
    rect(0, 0, PLAYER_WIDTH, PLAYER_HEIGHT);
  }
  
  void resetJump() {
    _jumped = false;
  }
  
  void handleKeyMessage(KeyMessage m) {
    String szKey = m.getKey();
    if(m.isPressed()) { // the player's movement is controlled by w/a/s/d
      if(szKey.equals("D") || szKey.equals("Right"))
        getVelocity().x = PLAYER_SPEED;
      if(szKey.equals("A") || szKey.equals("Left"))
        getVelocity().x = -PLAYER_SPEED;
      if((szKey.equals("W") || szKey.equals("Up")) && !_jumped) {
        addImpulse(makeVector(0, -2*PLAYER_SPEED));
        _jumped = true;
      }
      if(szKey.equals("S") || szKey.equals("Down"))
        getVelocity().y = 2*PLAYER_SPEED;
    } else { // when a key is released, we stop the player
        if(szKey.equals("D") || szKey.equals("A") || szKey.equals("Left") || szKey.equals("Right"))
          getVelocity().x = 0;
    }
  } 
  
}

class RectBeing extends Being {
  
  float _width;
  float _height;
  
  RectBeing(Rectangle rect) {
    super(rect, zeroVector());
    _width = rect.getRectWidth();
    _height = rect.getRectHeight();
  }
  
  void draw() {
    fill(255);
    rect(0, 0, _width, _height);
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
  size(WINDOW_WIDTH, WINDOW_HEIGHT, JAVA2D);  // set window size
  Hermes.setPApplet(this);            // give the library the PApplet
  
  // set up the world, camera, and post office
  cam = new Camera();
  po = new PostOffice();
  world = new World(po, cam);
  
  Rectangle initialBounds = new Rectangle(zeroVector(), 2 * WINDOW_WIDTH, 2 * WINDOW_HEIGHT);
  
  //world.registerBeing(new RectBeing(initialBounds), false);
  
  // set up the platforms
  platforms = new PlatformGroup(world);
  platforms.generatePlatforms(
    initialBounds,
    120.0f, 0.8);    
  
  // set up the player
  player = new Player(0, 60);
  Group<Player> playerGroup = new Group<Player>(world);
  world.registerBeing(player, true);
  playerGroup.add(player);
  po.registerKeySubscription(player, "D");
  po.registerKeySubscription(player, "S");
  po.registerKeySubscription(player, "W");
  po.registerKeySubscription(player, "A");
  po.registerKeySubscription(player, "Up");
  po.registerKeySubscription(player, "Down");
  po.registerKeySubscription(player, "Left");
  po.registerKeySubscription(player, "Right");
  
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
