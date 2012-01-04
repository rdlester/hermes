//button stuff
int buttonHover = 240;

//run button
int starNum = 8;
int runButtonRadius = cellSideLength;
int runButtonCenterX = canvasLeftX + cellSideLength;
int runButtonCenterY = containerTopY - 10 - runButtonRadius;

//random button
int randomButtonSide = cellSideLength;
int randomButtonX = canvasRightX - 3*randomButtonSide/2;
int randomButtonY = containerTopY - 10 - 3*randomButtonSide/2;

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
  void handleKeyMessage(KeyMessage m) {
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
  
  void handleMouseMessage(MouseMessage m) {
    _hover = true;
    if(m.getAction() == MOUSE_PRESSED) {
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

/**
 * When pressed, randomizes the vector field on the canvas
 */
class RandomButton extends Being {
  
  Canvas _c;
  PostOffice _po;
  boolean _hover;
  boolean _keyPressed = false;
  
  RandomButton(Canvas c, PostOffice po) {
    super(new Rectangle(randomButtonX,randomButtonY,randomButtonSide,randomButtonSide));
    _c = c;
    _hover = false;
    _po = po;
  }
  
  /**
   * Tells canvas to randomize vector field on key press or mouse press
   */
  void handleKeyMessage(KeyMessage m) {
    if(m.isPressed() && !_keyPressed) {
      _c.randomize();
      _keyPressed = true;
    }
    else {
      _keyPressed = false;
    }
  }
  
  void handleMouseMessage(MouseMessage m) {
    _hover = true;
    if(m.getAction() == MOUSE_PRESSED) {
      _c.randomize();
    }
  }
  
  
  boolean getHover() {return _hover;}
  void setHover(boolean hover) {_hover = hover;}
  
  void draw() {
    if(_hover) {
      fill(buttonHover);
      _hover = _po.isMouseInRegion(this.getShape());
    }
    else {
      noFill();
    }
    getShape().draw();
    //Draw star in the center
    translate(randomButtonSide/2,randomButtonSide/2);
    for(int i = 0; i < starNum; i++) {
      rotate(PI/starNum);
      line(randomButtonSide/4,randomButtonSide/4,-randomButtonSide/4,-randomButtonSide/4);
    }
  }
}
