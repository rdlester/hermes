/**
 * Represents the player
 */
class Player extends MassedBeing {
  
  final static float PLAYER_WIDTH = 16;
  final static float PLAYER_HEIGHT = 36;
  final static float PLAYER_SPEED = 150;
  
  // constants used to indicate the direction the player is facing
  final static int FACING_LEFT = 1;
  final static int FACING_RIGHT = 2;
  
  int direction = FACING_RIGHT; // the direction the player is facing
  boolean jumped = false;       // whether the player can jump
  
  AnimatedSprite sprite;
  int animIndex;
  
  Player(float x, float y) {
    super(new Rectangle(HermesMath.makeVector(x, y), PLAYER_WIDTH, PLAYER_HEIGHT), HermesMath.zeroVector(), 1.0f, 1.0f);
    
    // load the animated character walk cycle
    sprite = new AnimatedSprite();
    Animation anim = new Animation("skeilert_walk_final", 1, 24, ".png", (int)(1000.0f / 24.0f));
    animIndex = sprite.addAnimation(anim);
    sprite.setActiveAnimation(animIndex);
    sprite.pause();
  }
  
  void draw() {
    scale(0.2);
    imageMode(CENTER);
    // if the character is facing left, invert the image
    if(direction == FACING_LEFT) {
      scale(-1,1);
      translate(20, 0);
    }
    image(sprite.animate(), 0, 0); // draw the current animation frame
  }
  
  // when this is called the player can jump again
  void resetJump() {
    jumped = false;
  }
  
  // we use update() to apply gravity
  void update() {
    addForce(new PVector(0, -GRAVITY * getMass(), 0));
    if(abs(getVelocity().y) >= 5)
      sprite.pause();
  }
  
  void receive(KeyMessage m) {
    int nKey = m.getKeyCode();
    if(m.isPressed()) { // the player's movement is controlled by w/a/s/d or the arrows
      if(nKey == POConstants.D || nKey == POConstants.RIGHT) {
        getVelocity().x = PLAYER_SPEED;
        direction = FACING_RIGHT;
      }
      if(nKey == POConstants.A || nKey == POConstants.LEFT) {
        getVelocity().x = -PLAYER_SPEED;
        direction = FACING_LEFT;
      }
      if((nKey == POConstants.W || nKey == POConstants.UP) && !jumped) {
        addImpulse(new PVector(0, -PLAYER_SPEED, 0));
        jumped = true;
      }
      if(nKey == POConstants.S || nKey == POConstants.DOWN) {
        getVelocity().y = 2*PLAYER_SPEED;
      }
      if(abs(getVelocity().y) <= 5) sprite.unpause();
    } else { // when a key is released, we stop the player
        if(nKey == POConstants.D || nKey == POConstants.A || nKey == POConstants.LEFT || nKey == POConstants.RIGHT) {
          getVelocity().x = 0;
          sprite.pause();
        }
    }
  } 
  
}
