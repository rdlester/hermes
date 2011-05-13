//button stuff
int buttonHover = 240;

//run button
int starNum = 8;
int runButtonRadius = cellSideLength;
int runButtonCenterX = canvasLeftX + cellSideLength;
int runButtonCenterY = containerTopY - 10 - runButtonRadius;

//random button
int randomButtonSide = cellSideLength;
int randomButtonX = canvasRightX - randomButtonSide;
int randomButtonY = containerTopY - 10 - randomButtonSide;

/**
 * The user pushes the RunButton to run the simulation, changing mode to RUN
 */
class RunButton extends Being {
  
  float runButtonDiameter = runButtonRadius*2;
  float innerSymbolLength = runButtonDiameter/3;
  boolean _hover = false;
  boolean _keyPressed = false;
   
  RunButton() {
    super(new Circle(new PVector(runButtonCenterX, runButtonCenterY), runButtonRadius));
  }
  
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
    if(m.getAction() == PostOffice.MOUSE_PRESSED) {
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
   if(_hover) {
     fill(buttonHover);
   } else {
     fill(bgColor);
   }
   ellipse(0, 0, runButtonDiameter, runButtonDiameter); 
   fill(62, 67, 71);
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
  boolean _hover;
  boolean _keyPressed = false;
  
  RandomButton(Canvas c) {
    super(new Rectangle(randomButtonX,randomButtonY,randomButtonSide,randomButtonSide));
    _c = c;
    _hover = false;
  }
  
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
    if(m.getAction() == PostOffice.MOUSE_PRESSED) {
      _c.randomize();
    }
  }
  
  boolean getHover() {
    return _hover;
  }
  void setHover(boolean hover) {
    _hover = hover;
  }
  
  void draw() {
    if(_hover) {
      fill(buttonHover);
    }
    else {
      noFill();
    }
    getShape().draw();
    //Draw star in the center
    for(int i = 0; i < starNum; i++) {
      rotate(PI/starNum);
      line(randomButtonSide/4,randomButtonSide/4,-randomButtonSide/4,-randomButtonSide/4);
    }
  }
}
