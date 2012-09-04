/**
 * An immobile flashing square --- DANGEROUS 
 */
class GlitchySquare extends Being {
  static final int WIDTH = 50;
  static final int HEIGHT = 50;
  static final int SHAKE_STEP = 10;
  color _c;
  boolean _stroke;
  boolean _keyOn;

  // tracking direction
  boolean _up;
  boolean _right;
  boolean _down;
  boolean _left;

  GlitchySquare(int x, int y) {
    super(new Rectangle(x, y, WIDTH, HEIGHT));
    _c = color(0, 0, 0);
    _stroke = false;
    _keyOn = false;
  }

  public void update() {
    if (!_keyOn) {
      _position.x += round(random(SHAKE_STEP * 2)) - SHAKE_STEP;
    } 
    else {
      if (_up) {
        _position.y -= SHAKE_STEP;
      } 
      if (_right) {
        _position.x += SHAKE_STEP;
      } 
      if (_down) {
        _position.y += SHAKE_STEP;
      } 
      if (_left) {
        _position.x -= SHAKE_STEP;
      }
    }
    _stroke = false;
  }

  public void draw() {
    fill(_c);
    if (_stroke) {
      stroke(255);
    } 
    else {
      noStroke();
    }
    _shape.draw();
  }

  public void setColor(color c) {
    _c = c;
  }

  public void useKey() {
    _c = color(119, 205, 231);
    _keyOn = true;
  }

  public boolean usingKey() {
    return _keyOn;
  }

  public void drawStroke() {
    _stroke = true;
  }

  public color pickColor() {
    return color(int(random(256)), int(random(256)), int(random(256)));
  }

  public void receive(KeyMessage m) {
    int code = m.getKeyCode();
    if (m.isPressed()) {
      if (code == POConstants.UP) {
        _up = true;
      } 
      else if (code == POConstants.RIGHT) {
        _right = true;
      } 
      else if (code == POConstants.DOWN) {
        _down = true;
      } 
      else if (code == POConstants.LEFT) {
        _left = true;
      }
    } 
    else {
      if (code == POConstants.UP) {
        _up = false;
      } 
      else if (code == POConstants.RIGHT) {
        _right = false;
      } 
      else if (code == POConstants.DOWN) {
        _down = false;
      } 
      else if (code == POConstants.LEFT) {
        _left = false;
      }
    }
  }

  public void receive(MouseMessage m) {
    currentWorld.delete(this);
  }
}

