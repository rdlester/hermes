/**
 * Synchronizes the color of the GlitchySquares
 */
class GlitchyGroup extends Group<GlitchySquare> {

  GlitchyGroup(World w) {
    super(w);
  }

  public void update() {
    color c = pickColor();
    for (GlitchySquare s : getObjects()) {
      s.setColor(c);
    }
  }

  private color pickColor() {
    return color(int(random(256)), int(random(256)), int(random(256)));
  }

  public void addSquare() {
    int x = (int) random(WINDOW_WIDTH - 50);
    int y = (int) random(WINDOW_HEIGHT - 50);
    GlitchySquare s = new GlitchySquare(x, y);
    _world.register(s);
    this.add(s);
  }
}

