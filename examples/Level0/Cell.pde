/**
 * Helper class for Canvas, ToolBox, defines a cell in the vector field
 * Location is defined by which cell of the 2D array they are stored in inside Canvas, ToolBox
 */
class Cell extends Being {
 
  PVector _flowDir; //Any normalized vector
  float _flowStr; //Cannot be negative or greater than flowMax
  Tool _tool;
  boolean _hover;
  //Keeps track of cell's location in grid
  int _i;
  int _j;
  
  Cell(PVector cellTopLeft, int i, int j) {
    super(new Rectangle(cellTopLeft, new PVector(cellSideLength, cellSideLength)));
    _flowDir = INIT_DIR;
    _flowStr = INIT_STR;
    _tool = null;
    _hover = false;
    _i = i;
    _j = j;
  }
  
  PVector getFlowDir() {return _flowDir;}
  void setFlowDir(PVector direction) {_flowDir = direction;}

  float getFlowStr() {return _flowStr;}
  void setFlowStr(float strength) {_flowStr = strength;}
	
  boolean hasTool() {return _tool != null;}
  void setTool(Tool tool) {_tool = tool;}
  Tool getTool() {return _tool;}
  
  boolean getHover() {return _hover;}
  void setHover(boolean hover) {_hover = hover;}
  
  int geti() {return _i;}
  int getj() {return _j;}

  void draw() {
    if(_hover && mode == BUILD) {
      fill(137, 148, 158);
    }
    else {
      noFill();
    }
    //Draw cell square
    stroke(255);
    strokeWeight(2);
    rect(0, 0, cellSideLength, cellSideLength);
    if(mode == BUILD && (_i!=goali || _j!=goalj)) { // in BUILD mode
      if(!hasTool() && _i>=0 && _j>=0) { // the cell does not contain a tool draw the arrow
        //TODO: figure out algorithm for representing flow strength
        translate(cellSideLength/2, cellSideLength/2);
        float angle = HermesMath.angle(_flowDir);
        rotate(angle - PI/2);
        stroke(0,0,255,70);
        translate(0, cellSideLength/4);
        line(0, 0, 0, -cellSideLength/2);
        rotate(PI/4.0);
        line(0,0,0,-cellSideLength/4);
        rotate(3*PI/2.0);
        line(0,0,0,-cellSideLength/4);
      }
    } else if(mode == RUN) { // in RUN mode
      //TODO: fill in
    }
  }
}


