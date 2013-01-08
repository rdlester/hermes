/**
 * When two GlitchySquares overlap,
 * draw a border around them
 */
class SquareInteractor extends Interactor<GlitchySquare, GlitchySquare> {
  SquareInteractor() {
    super();
  }
  
  boolean detect(GlitchySquare being1, GlitchySquare being2) {
    return being1.getShape().collide(being2.getShape());
  }
  
  void handle(GlitchySquare being1, GlitchySquare being2) {
    being1.drawStroke();
    being2.drawStroke();
  }
}
