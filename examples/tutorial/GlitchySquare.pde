/**
 * An immobile flashing square --- DANGEROUS 
 */
class GlitchySquare extends Being {
  static final int WIDTH = 50;
  static final int HEIGHT = 50;
  color _c;
  boolean _shake;
  int _shakeStep;

  GlitchySquare(int x, int y) {
    super(new Rectangle(x, y, WIDTH, HEIGHT));
    _c = pickColor();
    _shake = false;
    _shakeStep = 5;
  }

  public void update() {
    _c = pickColor();
    if (_shake) {
      _position.x += _shakeStep;
      _shake = false;
    } else {
      _position.x -= _shakeStep;
      _shake = true;
    }
  }

  public void draw() {
    fill(_c);
    _shape.draw();
  }

  private color pickColor() {
    return color(int(random(256)), int(random(256)), int(random(256)));
  }
}

