/**
 * An immobile flashing square --- DANGEROUS 
 */
class GlitchySquare extends Being {
  static final int WIDTH = 50;
  static final int HEIGHT = 50;
  static final int SHAKE_STEP = 10;
  color _c;
  boolean _stroke;

  GlitchySquare(int x, int y) {
    super(new Rectangle(x, y, WIDTH, HEIGHT));
    _c = color(0,0,0);
    _stroke = false;
  }

  public void update() {
    //_c = pickColor();
    _position.x += round(random(SHAKE_STEP * 2)) - SHAKE_STEP;
    _stroke = false;
  }

  public void draw() {
    fill(_c);
    if(_stroke) {
      strokeWeight(5);
      stroke(255);
    } else {
      noStroke();
    }
    _shape.draw();
  }
  
  public void setColor(color c) {
    _c = c;
  }
  
  public void drawStroke() {
    _stroke = true;
  }

  private color pickColor() {
    return color(int(random(256)), int(random(256)), int(random(256)));
  }
}

