/**
 * An immobile flashing square --- DANGEROUS 
 */
class GlitchySquare extends Being {
  static final int WIDTH = 50;
  static final int HEIGHT = 50;
  color _c;
  static final int SHAKE_STEP = 10;

  GlitchySquare(int x, int y) {
    super(new Rectangle(x, y, WIDTH, HEIGHT));
    _c = color(0,0,0);
  }

  public void update() {
    //_c = pickColor();
    _position.x += round(random(SHAKE_STEP * 2)) - SHAKE_STEP;
  }

  public void draw() {
    fill(_c);
    noStroke();
    _shape.draw();
  }
  
  public void setColor(color c) {
    _c = c;
  }

  private color pickColor() {
    return color(int(random(256)), int(random(256)), int(random(256)));
  }
}

