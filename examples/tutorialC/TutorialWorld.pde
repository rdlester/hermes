/**
 * Tutorial World
 * A World filled with squares
 */
class TutorialWorld extends World {
  int _squareNum;

  TutorialWorld(int squareNum/*, int portIn, int portOut*/) {
    super(/*portIn, portOut*/);
    _squareNum = squareNum;
  }

  void setup() {
    GlitchyGroup g = new GlitchyGroup(this);
    register(g);
    
    for (int i = 0; i < _squareNum; i++) {
      int x = (int) random(WINDOW_WIDTH - 50);
      int y = (int) random(WINDOW_HEIGHT - 50);
      GlitchySquare s = new GlitchySquare(x,y);
      s.useKey();
      register(s);
      subscribe(s, POConstants.UP);
      subscribe(s, POConstants.RIGHT);
      subscribe(s, POConstants.DOWN);
      subscribe(s, POConstants.LEFT);
      subscribe(s, POConstants.Button.LEFT, s.getShape());
      g.add(s);
    }
    
    register(g,g,new SquareInteractor());
  }
  
  void draw() {
    background(0);
    super.draw();
  }
}

