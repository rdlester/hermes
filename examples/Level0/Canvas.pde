/**
 * Central canvas for building levels/tracks
 * Holds information for vector field
 * Has inside bounding box
 * Responsible for placing tools into grid
 */
class Canvas extends MassedBeing {
  
  Cell[][] _grid;
  int _iCellHover;
  int _jCellHover;
  boolean _hover;
  PostOffice _po;

  Canvas(PostOffice po) {
    super(new HRectangle(new PVector(canvasLeftX, containerTopY),
                        new PVector(canvasWidth, containerHeight)),
          new PVector(0,0), Float.POSITIVE_INFINITY, 1);
    _po = po;
    _grid = new Cell[canvasNumCellsX][canvasNumCellsY];
    _iCellHover = 0;
    _jCellHover = 0;
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
        world.register(_grid[i][j], false);
      } 
    }
  }
  
  /**
   * Randomize grid using 'drunk walk' and breadth-first traversal
   */
  void randomize() {
    //Queue for bft
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
  /**
   * Helper method for randomize
   */
  void addCell(Cell curr, Cell next, LinkedList queue, HashMap<Cell,Cell> order) {
    if(!order.containsKey(next)) {
      queue.addLast(next);
      order.put(next,curr);
    }
  }

  void draw() {
    if(_hover) {
      if(!_shape.contains(_po.getMouseLocation())) {
        _hover = false;
        _grid[_iCellHover][_jCellHover].setHover(false);
      }
    }
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
  void receive(MouseMessage m) {
    int x = m.getX();
    int y = m.getY();
    x -= canvasLeftX;
    y -= containerTopY;
    //constrain needed to prevent array index errors when mouse is on boundary
    int i = constrain(x / cellSideLength,0,8);
    int j = constrain(y / cellSideLength,0,10);
    //get corresponding cell
    Cell in = _grid[i][j];
    
    //prohibited cells are those with ball, goal
    boolean prohibitedCell = (i==balli && j==ballj) || (i==goali && j==goalj);
    
    //update hover graphics if cell mouse is over has changed
    if(!in.getHover()) {
      _hover = true;
      _grid[_iCellHover][_jCellHover].setHover(false);
      if(!prohibitedCell) {
        in.setHover(true);
        _iCellHover = i;
        _jCellHover = j;
      }
    }
    
    POCodes.Click action = m.getAction();

    if(action == POCodes.Click.RELEASED && mode == BUILD) { 
      if(dragTool != null) { //tool is being dropped into a cell
        //NOTE: dragTool's CENTER is at the mouse location
        if(!prohibitedCell) {
          // remove the tool at that cell if necessary
          if(in.hasTool()) {
            Tool toRemove = in.getTool();
            in.setTool(null);
            world.delete(toRemove);
          }
          dragTool.setPosition(new PVector(canvasLeftX+(i*cellSideLength)+cellSideLength/2, containerTopY+(j*cellSideLength)+cellSideLength/2));//////
          in.setTool(dragTool);
          selectedTool = dragTool;
          //clean up global vars
          dragTool = null;
          //TODO how to account for multi-cell objects? What about the baton (which doesn't actually take up a cell?)
        } else { // trying to drag into prohibited cell
          if(dragIniti<0 && dragInitj<0) { //from toolbox
            world.delete(dragTool);//delete the tool
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
    } else if(action == POCodes.Click.PRESSED && mode == BUILD) {
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
    } else if(action == POCodes.Click.DRAGGED && mode == BUILD) {
      if(dragTool!=null) { //TODO: this code is identical in 3 places, probably a better way to do this
        dragTool.setPosition(new PVector(m.getX(), m.getY()));
      } else if(templateTool!=null && !prohibitedCell) {
        // remove the tool at that cell if necessary
        if(in.hasTool()) {
          Tool toRemove = in.getTool();
          in.setTool(null);
          world.delete(toRemove);
        }
        Tool newTool = makeTool(templateTool.getToolCode(), new PVector(canvasLeftX+i*cellSideLength+cellSideLength/2, containerTopY+j*cellSideLength+cellSideLength/2),
                                templateTool.getRotation(), templateTool.getElasticity());
        in.setTool(newTool);
        selectedTool = newTool;
      }
    }
  }
  
  /**
   * Helper method for hovers
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


