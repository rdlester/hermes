//Container sizes and locations
//Y location and size is same for both
int containerHeight = 440;
int containerTopY = 120;
int containerBottomY = containerTopY + containerHeight;
//Canvas X and width
Canvas canvas = null;
int canvasWidth = 360;
int canvasLeftX = 30;
int canvasRightX = canvasLeftX + canvasWidth;
//Toolbox X and width
ToolBox toolBox;
int toolBoxWidth = 120;
int toolBoxLeftX = 430;
int toolBoxRightX = toolBoxLeftX + toolBoxWidth;

//Cell constants
static final PVector INIT_DIR = new PVector(0,1);
static final float INIT_STR = 1;
float flowMax = 10;
int cellSideLength = 40; //gives us 9 across, 12 down in canvas ; 3 across, 12 down in toolbox
int canvasNumCellsX = canvasWidth / cellSideLength;
int canvasNumCellsY = containerHeight / cellSideLength;
int toolBoxNumCellsX = toolBoxWidth / cellSideLength;
int toolBoxNumCellsY = containerHeight / cellSideLength;

////////////////////////////////////////
// CONTAINERS
////////////////////////////////////////
/**
 * Central canvas for building levels/tracks
 * Holds information for vector field
 * Has inside bounding box
 * Responsible for placing tools into grid
 */
class Canvas extends MassedBeing {
  
  Cell[][] _grid;
  boolean _hover;

  Canvas() {
    super(new Rectangle(new PVector(canvasLeftX, containerTopY), new PVector(canvasWidth, containerHeight), PApplet.CORNER),
          new PVector(0,0), Float.POSITIVE_INFINITY, 1);
    _grid = new Cell[canvasNumCellsX][canvasNumCellsY];
    _hover = false;
    initialize();
  }
  
  Cell[][] getGrid() {
    return _grid; 
  }
  
  //Initialize cell grid
  void initialize() {
    for(int i=0; i<canvasNumCellsX; i++) {
      for(int j=0; j<canvasNumCellsY; j++) {
        _grid[i][j] = new Cell(new PVector(canvasLeftX + i*cellSideLength, containerTopY + j*cellSideLength),i,j);
        world.registerBeing(_grid[i][j], false);
      } 
    }
  }
  
  //Randomize grid using drunk walk and bfs
  void randomize() {
    //Queue for bfs
    //Add new cells to end, pull from first
    LinkedList<Cell> queue = new LinkedList<Cell>();
    //Map keeping track of cell before current cell
    HashMap<Cell,Cell> order = new HashMap<Cell,Cell>();
    
    //Get initial direction
    //This is constrained between down and right
    float initAngle = random(PI/2);
    PVector initDir = HermesMath.getRotate(INIT_DIR,-initAngle);
    float initStr = INIT_STR;
    //Get the first cell and set its vector
    Cell first = _grid[0][0];
    first.setFlowDir(initDir);
    first.setFlowStr(initStr);
    //Get the adjacent cells and set up bfs traversal
    Cell start = _grid[1][0];
    queue.addLast(start);
    order.put(start,first);
    start = _grid[0][1];
    queue.addLast(start);
    order.put(start,first);
    
    while(queue.size() > 0) {
      //Get next cell
      Cell curr = queue.removeFirst();
      //Get the cell before this one
      Cell pre = order.get(curr);
      //Get the previous direction and rotate it by a constrained amount
      PVector preDir = pre.getFlowDir();
      float theta = random(PI/2) - PI/4;
      PVector nextDir = HermesMath.getRotate(preDir,theta);
      curr.setFlowDir(nextDir);
      //Get the previous strength and adjust it
      float preStr = pre.getFlowStr();
      //TODO: adjust strength
      curr.setFlowStr(preStr);
      
      //Get adjacent cells and add them if they exist and have not been added/checked
      int i = curr.geti();
      int j = curr.getj();
      if(i - 1 >= 0) {
        addCell(curr,_grid[i-1][j],queue,order);
      }
      if(j - 1 >= 0) {
        addCell(curr,_grid[i][j-1],queue,order);
      }
      if(i+1 < canvasNumCellsX) {
        addCell(curr,_grid[i+1][j],queue,order);
      }
      if(j+1 < canvasNumCellsY) {
        addCell(curr,_grid[i][j+1],queue,order);
      }
    }
  }
  
  void addCell(Cell curr, Cell next, LinkedList queue, HashMap<Cell,Cell> order) {
    if(!order.containsKey(next)) {
      queue.addLast(next);
      order.put(next,curr);
    }
  }

  void draw() {
    if(mode == BUILD) {
      //draw phantom ball
      pushMatrix();
      translate(balli*cellSideLength+cellSideLength/2, ballj*cellSideLength+cellSideLength/2);
      fill(189, 0, 0, 70);
      noStroke();
      ellipse(0,0,ballRadius*2,ballRadius*2);
      popMatrix();
      
      //draw phantom goal
      pushMatrix();
      translate(goali*cellSideLength, goalj*cellSideLength);
      strokeWeight(2);
      stroke(189, 0, 0, 70);
      line(10,10,cellSideLength-10,cellSideLength-10); //    \
      line(cellSideLength-10, 10, 10, cellSideLength-10); //  / 
      popMatrix();
    }
  }

  /**
   * If the user has selected a tool, place the tool in the location of the mouse
   */
  void handleMouseMessage(MouseMessage m) {
    int x = m.getX();
    int y = m.getY();
    x -= canvasLeftX;
    y -= containerTopY;
    int i = x / cellSideLength;
    int j = y / cellSideLength;
    //get corresponding cell
    Cell in = _grid[i][j];
    
    //prohibited cells are those with ball, goal
    boolean prohibitedCell = (i==balli && j==ballj) || (i==goali && j==goalj);
    
    //update hover graphics if cell mouse is over has changed
    if(!in.getHover()) {
      _hover = true;
      eraseHover();
      if(!prohibitedCell) {
        in.setHover(true);
      }
    }
    
    int action = m.getAction();

    if(action == PostOffice.MOUSE_RELEASED && mode == BUILD) { 
      if(dragTool != null) { //tool is being dropped into a cell
        //NOTE: dragTool's CENTER is at the mouse location
        if(!prohibitedCell) {
          // remove the tool at that cell if necessary
          if(in.hasTool()) {
            Tool toRemove = in.getTool();
            in.setTool(null);
            world.deleteBeing(toRemove);
          }
          dragTool.setPosition(new PVector(canvasLeftX+(i*cellSideLength)+cellSideLength/2, containerTopY+(j*cellSideLength)+cellSideLength/2));//////
          in.setTool(dragTool);
          selectedTool = dragTool;
          //clean up global vars
          dragTool = null;
          //TODO how to account for multi-cell objects? What about the baton (which doesn't actually take up a cell?)
        } else { // trying to drag into prohibited cell
          if(dragIniti<0 && dragInitj<0) { //from toolbox
            world.deleteBeing(dragTool);//delete the tool
            dragTool = null;
            dragIniti = -1;
            dragInitj = -1;
          } else { // from canvas
            dragTool.setPosition(new PVector(canvasLeftX+(dragIniti*cellSideLength)+cellSideLength/2, containerTopY+(dragInitj*cellSideLength)+cellSideLength/2));//return to previous place
            _grid[dragIniti][dragInitj].setTool(dragTool);
            dragTool = null;
            dragIniti = -1;
            dragInitj = -1;
          }
        }
      }
    } else if(action == PostOffice.MOUSE_PRESSED && mode == BUILD) {
      //check if pressed on cell containing tool
      if(in.hasTool()) {
        dragTool = in.getTool();//set dragTool to the tool therein
        dragIniti = i;
        dragInitj = j;
        selectedTool = dragTool;
        in.setTool(null);
      } else if(templateTool!=null && !prohibitedCell) { //cell has no tool and templateTool is set to something
        Tool newTool = makeTool(templateTool.getToolCode(), new PVector(canvasLeftX+i*cellSideLength+cellSideLength/2, containerTopY+j*cellSideLength+cellSideLength/2),
                                templateTool.getRotation(), templateTool.getElasticity());
        in.setTool(newTool);
        selectedTool = newTool;
      }    
    } else if(action == PostOffice.MOUSE_DRAGGED && mode == BUILD) {
      if(dragTool!=null) { //TODO: this code is identical in 3 places, probably a better way to do this
        dragTool.setPosition(new PVector(m.getX(), m.getY()));
      } else if(templateTool!=null && !prohibitedCell) {
        // remove the tool at that cell if necessary
        if(in.hasTool()) {
          Tool toRemove = in.getTool();
          in.setTool(null);
          world.deleteBeing(toRemove);
        }
        Tool newTool = makeTool(templateTool.getToolCode(), new PVector(canvasLeftX+i*cellSideLength+cellSideLength/2, containerTopY+j*cellSideLength+cellSideLength/2),
                                templateTool.getRotation(), templateTool.getElasticity());
        in.setTool(newTool);
        selectedTool = newTool;
      }
    }
  }
  
  /**
   * Helper method for mouse updates
   */
  void eraseHover() {
    for(int i=0; i<canvasNumCellsX; i++) {
      for(int j=0; j<canvasNumCellsY; j++) {
        _grid[i][j].setHover(false);
      } 
    }
  }
  
  boolean getHover() {
    return _hover;
  }
  
  void setHover(boolean hover) {
    _hover = hover;
  }
}

/**
 * The ToolBox contains the available tools for level-buidling
 */
class ToolBox extends Being {
  
  Cell[][] _grid;
  
  //label
  Zero zero;
  
  ToolBox() {
    super(new Rectangle(new PVector(toolBoxLeftX, containerTopY), new PVector(toolBoxWidth, containerHeight), PApplet.CORNER));
    _grid = new Cell[toolBoxNumCellsX][toolBoxNumCellsY];
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
    if(m.getAction() == PostOffice.MOUSE_PRESSED && mode == BUILD) {
      //get pixel location of mouse press in frame
      int x = m.getX();
      int y = m.getY();
      //get pixel location of mouse press relative to toolbox topleft corner
      x -= toolBoxLeftX;
      y -= containerTopY;
      //get i,j indices of cell containing mouse press
      int i = x / cellSideLength;
      int j = y / cellSideLength;
      // if that cell contains a tool, set templateTool to that tool
      if(_grid[i][j].hasTool()) {
        templateTool = _grid[i][j].getTool();
        templateTool.handleMouseMessage(m);
      }
    } else if(m.getAction() == PostOffice.MOUSE_DRAGGED && mode == BUILD) {
      if(dragTool!=null) { //already dragging a tool
        dragTool.setPosition(new PVector(m.getX(), m.getY()));
      } else if(templateTool!=null) { // templateTool already set but no new tool created yet
        //instantiate new version of that tool 
        dragTool = makeTool(templateTool.getToolCode(), new PVector(m.getX(), m.getY()),
                                templateTool.getRotation(), templateTool.getElasticity());
        dragIniti = -1;
        dragInitj = -1;
      }
    } else if(m.getAction() == PostOffice.MOUSE_RELEASED && mode == BUILD) {
      //check if you are currently dragging a tool
      if(dragTool!=null) {
        world.deleteBeing(dragTool); //delete the tool
        dragTool = null;
      }
    } else {
      //TODO: fill in 
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
    super(new Rectangle(cellTopLeft, new PVector(cellSideLength, cellSideLength), PApplet.CORNER));
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
