/**
 * Template interactor between a MyBeing and another MyBeing
 */
class SquareInteractor extends Collider<GlitchySquare, GlitchySquare> {
  SquareInteractor() {
    super();
  }
  
  void handle(GlitchySquare being1, GlitchySquare being2) {
    being1.drawStroke();
    being2.drawStroke();
  }
}

