/**
 * The user pushes the RunButton to run the simulation, changing mode to RUN
 */
class RunButton extends Being {
  
  PostOffice _po;
  float runButtonDiameter = runButtonRadius*2;
  float innerSymbolLength = runButtonDiameter/3;
  boolean _hover = false;
  boolean _keyPressed = false;
  
  RunButton(PostOffice po) {
    super(new Circle(new PVector(runButtonCenterX, runButtonCenterY), runButtonRadius));
    _po = po;
  }
  
  /**
   * Switches run mode on key press or mouse press
   */
  void receive(KeyMessage m) {
    if(m.isPressed() && !_keyPressed) {
      if(mode == BUILD) {
        setMode(RUN);
      }
      else {
        setMode(BUILD);
      }
      _keyPressed = true;
    }
    else {
      _keyPressed = false;
    }
  }
  
  void receive(MouseMessage m) {
    _hover = true;
    if(m.getAction() == POCodes.Click.PRESSED) {
      //switch modes
      if(mode == BUILD) {
        setMode(RUN);
      } else if(mode == RUN || mode == COMPLETED) {
        setMode(BUILD); 
      }
    }
  }
  
  boolean getHover() {return _hover;}
  void setHover(boolean hover) {_hover = hover;}
  
  void draw() {
   strokeWeight(3);
   stroke(62, 67, 71);
   if(_hover) { //Add light highlighting when mouse is hovering over button
     fill(buttonHover);
     _hover = _po.isMouseInRegion(this.getShape());
   } else {
     fill(bgColor);
   }
   ellipse(0, 0, runButtonDiameter, runButtonDiameter); 
   fill(62, 67, 71);
   //Draw inner symbol
   if(mode == BUILD) {
     triangle(-runButtonRadius/3.5+3, -runButtonRadius/3.5, runButtonRadius/4+3, 0, -runButtonRadius/3.5+3, runButtonRadius/3.5);
   } else {
     rect(-innerSymbolLength/2, -innerSymbolLength/2, innerSymbolLength, innerSymbolLength); 
   }
  }
}


