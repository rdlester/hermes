class PlatformCamera extends HCamera {
  PlatformCamera() {
    super();
  }
  
  void draw() {
    setPosition(player.getPosition().x - WINDOW_WIDTH / 2,
                player.getPosition().y - WINDOW_HEIGHT / 2);
    super.draw();
  }
}
