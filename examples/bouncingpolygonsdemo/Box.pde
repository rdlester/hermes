/**
 * Container box to the world
 */
class Box extends MassedBeing {
  Box() {
   super(new Rectangle(new PVector(0,0), new PVector(0,0), new PVector((float)WIDTH,(float)HEIGHT)), new PVector(0,0), Float.POSITIVE_INFINITY, 1); 
  }
  
  void draw() {}
}
