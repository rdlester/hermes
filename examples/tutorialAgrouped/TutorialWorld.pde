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
      g.addSquare();
    }
  }
  
  void draw() {
    background(0);
    super.draw();
  }
}

