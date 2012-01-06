/**
 * The ToolBox contains the available tools for level-buidling
 */
class ToolBox extends Being {
  
  Cell[][] _grid;
  
  //Used for controlling the dragging of tools
  Canvas _canvas;
  
  //label
  Zero zero;
  
  ToolBox(Canvas canvas) {
    super(new Rectangle(new PVector(toolBoxLeftX, containerTopY),
                        new PVector(toolBoxWidth, containerHeight)));
    _grid = new Cell[toolBoxNumCellsX][toolBoxNumCellsY];
    _canvas = canvas;
    initialize();
  }
  
  void initialize() {
     //make all the cells 
     for(int i=0; i<toolBoxNumCellsX; i++) {
       for(int j=0; j<toolBoxNumCellsY; j++) {
         _grid[i][j] = new Cell(new PVector(toolBoxLeftX + i*cellSideLength, containerTopY + j*cellSideLength),-1,-1);
         world.registerBeing(_grid[i][j], false);
       } 
     }
     
     //add the zero
     zero = new Zero();
     
     //Add tools
     //quadrangle
     Tool templateQuadrangle = makeTool(QUADRANGLE, 
                                  new PVector(toolBoxLeftX + 1*cellSideLength+cellSideLength/2, 
                                              containerTopY + 1*cellSideLength+cellSideLength/2),
                                  0, PERFECT);
     _grid[1][1].setTool(templateQuadrangle);
     
     //triangle
     Tool templateTriangle = makeTool(TRIANGLE,
                                new PVector(toolBoxLeftX + 1*cellSideLength+cellSideLength/2, 
                                            containerTopY + 3*cellSideLength+cellSideLength/2),
                                0, PERFECT);
     _grid[1][3].setTool(templateTriangle);
     
     //hexagon
     Tool templateHexagon = makeTool(HEXAGON,
                                new PVector(toolBoxLeftX + 1*cellSideLength+cellSideLength/2, 
                                            containerTopY + 5*cellSideLength+cellSideLength/2),
                                0, PERFECT);
     _grid[1][5].setTool(templateHexagon);     
     
     //circletool
     Tool templateCircleTool = makeTool(CIRCLETOOL,
                                new PVector(toolBoxLeftX + 1*cellSideLength+cellSideLength/2, 
                                            containerTopY + 7*cellSideLength+cellSideLength/2),
                                0, PERFECT);
     _grid[1][7].setTool(templateCircleTool);   
     
     //wedge
     Tool templateWedge = makeTool(WEDGE,
                                new PVector(toolBoxLeftX + 1*cellSideLength+cellSideLength/2, 
                                            containerTopY + 9*cellSideLength+cellSideLength/2),
                                0, PERFECT);
     _grid[1][9].setTool(templateWedge);  
          
     
  }
  
  /**
   * Handles a mousemessage within the toolbox boundaries
   */
  void handleMouseMessage(MouseMessage m) {
    //checks if it was a mouse pressed
    if(m.getAction() == MOUSE_PRESSED && mode == BUILD) {
      //erase selection regardless of click location
      selectedTool = null;
      //get pixel location of mouse press in frame
      int x = m.getX();
      int y = m.getY();
      //get pixel location of mouse press relative to toolbox topleft corner
      x -= toolBoxLeftX;
      y -= containerTopY;
      //get i,j indices of cell containing mouse press
      int i = constrain(x / cellSideLength,0,2);
      int j = constrain(y / cellSideLength,0,10);
      // if that cell contains a tool, set templateTool to that tool
      if(_grid[i][j].hasTool()) {
        templateTool = _grid[i][j].getTool();
        templateTool.handleMouseMessage(m);
        //instantiate dragTool
        dragTool = makeTool(templateTool.getToolCode(), new PVector(m.getX(), m.getY()),
                                templateTool.getRotation(), templateTool.getElasticity());
        dragIniti = -1;
        dragInitj = -1;
      }
    } else if(m.getAction() == MOUSE_DRAGGED && mode == BUILD) {
      if(dragTool!=null) { //already dragging a tool
        dragTool.setPosition(new PVector(m.getX(), m.getY()));
      } /*else if(templateTool!=null) { // templateTool already set but no new tool created yet
        //instantiate new version of that tool 
        dragTool = makeTool(templateTool.getToolCode(), new PVector(m.getX(), m.getY()),
                                templateTool.getRotation(), templateTool.getElasticity());
        dragIniti = -1;
        dragInitj = -1;
      }*/
    } else if(m.getAction() == MOUSE_RELEASED && mode == BUILD 
                && !canvas.getShape().contains(m.getX(),m.getY())) {
      //check if you are currently dragging a tool
      if(dragTool!=null) {
        world.deleteFromGroups(dragTool); //delete the tool
        dragTool = null;
      }
    } else {
      
    }
  }

  void draw() {
    //draw the label
    pushMatrix();
    translate(10, -90);
    zero.draw();
    popMatrix();
    
  }
}
