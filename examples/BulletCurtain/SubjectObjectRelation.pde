//Basic template class for characters
abstract class SubjectObjectRelation extends Being {

  //Each has an Animated Sprite.. 
  AnimatedSprite animatedSprite;
  
  float bodyWidth, bodyHeight;

  SubjectObjectRelation(float x, float y, float bodyWidth, float bodyHeight, AnimatedSprite animatedSprite) {

    //First call to a subclass must be to the super constructor
    //in this case, it takes a Shape for position and collision detection
    super(new Rectangle(x, y, bodyWidth, bodyHeight));

    this.animatedSprite = animatedSprite;
    this.bodyWidth = bodyWidth;
    this.bodyHeight = bodyHeight;
  }

  void draw() {
    PImage frameToDraw = animatedSprite.animate();
    image(frameToDraw, 0, 0);
  }
}
