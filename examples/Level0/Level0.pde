import java.util.LinkedList;
import src.hermes.*;
import src.hermesTest.physicsTest.*;
import src.hermesTest.postOfficeTests.*;
import src.hermes.shape.*;
import src.hermes.animation.*;
import src.hermesTest.shapeTests.*;
import src.hermesTest.core.*;
import src.hermes.physics.*;
import src.hermes.postoffice.*;
import static src.hermes.HermesMath.*;

/**
Notes:
- may want to make toolbox into more columns to fit all the tools -- maybe even add an area for "currently selected tool" 
  or just add some length to the deal -- need odd number of tiles high
- may not need to register the canvas, toolbox with world (do not need to get drawn, updated) 
- could we add a sort of map and filter functionality to group? since it's parametrized,  it might
  be doable (maybe using a class .... i dont know)
- ask sam about multi-sampling



//TODO:
- make cell arrows draw //I will do this! -rl
- make cell arrow "randomizer" //this too! -rl
- make the tools //-rl
- menus, save levels (?do we want?)
- don't draw arrow on gaol cell
- new way to show selected tool in toolbox - with handle
- rotation of tools, handle
- set reasonable elasticities

Bugs:
- look at the bubbles in cells where a tool is on start .. not sure what we want here -jen i think it's just a drawing order issue
  i.e. we're not drawing over those balls again
- don't draw arrows in cells in toolbox (give null value or somehtin)
- hover wtf??




**/

///////////////////////////////////////////////////
// GLOBAL VARS AND CONSTANSTS
///////////////////////////////////////////////////

World world;
Camera cam;
PostOffice po;


final int BUILD = 0;
final int RUN = 1;
final int COMPLETED = 2;
int mode = BUILD; // 0 is setup; 1 is run


//Frame size
int frameWidth = 700;
int frameHeight = 630;
int bgColor = color(122, 131, 139);

//Container sizes and locations
//Y location and size is same for both
int containerHeight = 480;
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

//Constants defining the tools
final int NOTOOL = 0;
final int QUADRANGLE = 1;
final int TRIANGLE = 2;
final int HEXAGON = 3;
final int CIRCLETOOL = 4;
final int WEDGE = 5;
final int PUNCHER = 6;
final int BATON = 7;
final int FUSE = 8;
//Tool stored by dragging, used for placing tools on the board
Tool templateTool = null;
Tool dragTool = null;
int dragIniti = -1; // set to -1 when from toolbox,
int dragInitj = -1; // real values when from canvas

//tool elasticity
final float SPRINGY = 1.2; //TODO: ??????set?
final float PERFECT = 1;
final float STICKY = 0;

//ball
Ball ball = null;
int balli = 0; //index in canvas
int ballj = 0;
int ballRadius = 10;
int ballMass = 100;
int ballElasticity = 1;
//goal
Goal goal = null;
int goali = 0; //index in canvas
int goalj = canvasNumCellsY-1;

//groups
Group<Ball> ballGroup = null;
Group<Goal> goalGroup = null;
Group<Canvas> canvasGroup = null;
ToolGroup toolGroup = null;
Group<Bubble> bubbleGroup = null;



////////////////////////////////////////
// BEINGS
////////////////////////////////////////


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
      PVector nextDir = getRotate(preDir,theta);
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
        in.setTool(null);
      } else if(templateTool!=null && !prohibitedCell) { //cell has no tool and templateTool is set to something
        Tool newTool = makeTool(templateTool.getToolCode(), new PVector(canvasLeftX+i*cellSideLength+cellSideLength/2, containerTopY+j*cellSideLength+cellSideLength/2),
                                templateTool.getRotation(), templateTool.getElasticity());
        in.setTool(newTool);
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
    
    //draw a halo around the tool specified by toolMode
    //TODO: replace with better select
    /*
    int haloi = -1;
    int haloj = -1;
    switch(toolMode) {
     case FAKETOOL:  haloi = _fakeTooli;
                     haloj = _fakeToolj;
                     break;
    }
    
    if(haloi!=-1 && haloj!=-1) {
      noFill();
      strokeWeight(3);
      stroke(255, 150, 193);
      rect(haloi*cellSideLength, haloj*cellSideLength, cellSideLength, cellSideLength);
    }
    */
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

////////////////////////////////////////
// EXTERNAL OBJECTS
////////////////////////////////////////
/**
 *
 */
class Ball extends MassedBeing {
  
  Ball() {
    super(new Circle(new PVector((canvasLeftX+balli*cellSideLength)+cellSideLength/2, 
                                 (containerTopY+ballj*cellSideLength)+cellSideLength/2),
                     ballRadius), 
          new PVector(0,0), ballMass, ballElasticity);
    world.registerBeing(this, true);
  }
  
  void update() {
    //add the flow from the cell
    int x = (int)getX();
    int y = (int)getY();
    x -= canvasLeftX;
    y -= containerTopY;
    int i = x / cellSideLength;
    int j = y / cellSideLength;
        
    //check to make sure did not escape //TODO: remove this hack if possible!
    if(i < 0) i=0;
    if(i > canvasNumCellsX) i=canvasNumCellsX;
    if(j < 0) j=0;
    if(j > canvasNumCellsY) j=canvasNumCellsY;
    
    Cell[][] grid = canvas.getGrid();
    Cell in = grid[i][j];  
    if(!in.hasTool()) { //appply the flow if the cell has no tool within
     setVelocity(PVector.add(getVelocity(), in.getFlowDir()));
    } 
  }
  
  void draw() {
    fill(189, 0, 0);
    noStroke();
    ellipse(0,0,ballRadius*2,ballRadius*2);
  }
}

/**
 *
 */
class Goal extends Being {
 Goal() {
  super(new Rectangle(new PVector((canvasLeftX+goali*cellSideLength), 
                                 (containerTopY+goalj*cellSideLength)), 
                      new PVector(cellSideLength, cellSideLength), PApplet.CORNER), 
        new PVector(0,0));
  world.registerBeing(this, false);
 }
 void draw() {
  if(mode == RUN) {
    strokeWeight(3);
    stroke(189, 0, 0);
    line(10,10,cellSideLength-10,cellSideLength-10); //    \
    line(cellSideLength-10, 10, 10, cellSideLength-10); //  /
  } else if(mode == COMPLETED) {
    strokeWeight(2);
    stroke(255);
    fill(62, 67, 71, 130);
    rect(0, 0, cellSideLength, cellSideLength);
    strokeWeight(3);
    stroke(0, 240, 0);
    line(15, 20, 20, 30); // \
    line(20, 30, 30, 10); // /
  }
 } 
}

/**
 *
 */
class Bubble extends MassedBeing {
  
  Bubble(PVector position) {
    super(new Circle(position, ballRadius/2), new PVector(0,0), ballMass, ballElasticity);
    world.registerBeing(this, true);
  }
  
  void draw() {
    fill(146, 239, 233, 120);
    noStroke();
    ellipse(0,0,ballRadius,ballRadius);
  }
  
  void update() {    
    //add the flow from the cell
    int x = (int)getX();
    int y = (int)getY();
    x -= canvasLeftX;
    y -= containerTopY;
    int i = x / cellSideLength;
    int j = y / cellSideLength;
    
    //check to make sure did not escape //TODO: remove this hack if possible!
    if(i < 0) i=0;
    if(i > canvasNumCellsX) i=canvasNumCellsX;
    if(j < 0) j=0;
    if(j > canvasNumCellsY) j=canvasNumCellsY;
    
    Cell[][] grid = canvas.getGrid();
    Cell in = grid[i][j];  
    if(!in.hasTool()) { //appply the flow if the cell has no tool within
     setVelocity(PVector.add(getVelocity(), in.getFlowDir()));
    }
  } 
}

/**
 * The user pushes the RunButton to run the simulation, changing mode to RUN
 */
class RunButton extends Being {
  
  float runButtonDiameter = runButtonRadius*2;
  float innerSymbolLength = runButtonDiameter/3;
  boolean _hover = false;

   
  RunButton() {
    super(new Circle(new PVector(runButtonCenterX, runButtonCenterY), runButtonRadius));
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
   } else if(mode == RUN || mode == COMPLETED) {
     rect(-innerSymbolLength/2, -innerSymbolLength/2, innerSymbolLength, innerSymbolLength); 
   }
  }
}

class RandomButton extends Being {
  
  Canvas _c;
  boolean _hover;
  
  RandomButton(Canvas c) {
    super(new Rectangle(randomButtonX,randomButtonY,randomButtonSide,randomButtonSide));
    _c = c;
    _hover = false;
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

///////////////////////////////////////////////////
// TOOLS (ACCESSABLE TO SELF)
///////////////////////////////////////////////////
 
/**
 *
 */
abstract class Tool extends MassedBeing {
  int _toolCode;
  boolean _selected = false;
  double _totalRotation=0;
  
  Tool(Shape shp, PVector velocity, float mass, float elasticity, int toolCode) {
    super(shp, velocity, mass, elasticity); 
    _toolCode = toolCode;
    world.registerBeing(this, true);
    world.addBeing(this, toolGroup);
  }

  int getToolCode() {return _toolCode;}
  void select() {_selected = true;}
  void deselect() {_selected = false;}
  boolean isSelected() {return _selected;}
  
  abstract void handleMouseMessage(MouseMessage m);
  
  void rotate(double theta) {_totalRotation = (_totalRotation + theta)%(PI*2);}
  double getRotation() {return _totalRotation;}
  
  void draw() {
    fill(0);
    stroke(255);
    strokeWeight(2); 
  }
  
}

//position is always CENTER
Tool makeTool(int toolCode, PVector position, double theta, float elasticity) {
   Tool toReturn = null;
   switch(toolCode) {
     case QUADRANGLE: toReturn = new Quadrangle(position, theta, elasticity); 
                      break;
     case TRIANGLE:   toReturn = new Triangle(position, theta, elasticity);
                      break;
     case HEXAGON:    toReturn = new Hexagon(position, theta, elasticity);
                      break;
     case CIRCLETOOL: toReturn = new CircleTool(position, theta, elasticity);
                      break;
     case WEDGE:      toReturn = new Wedge(position, theta, elasticity);
                      break;
     default:         println("Error in makeTool: toolCode did not match any tools");
                      break;   
   } 
   return toReturn; 
}

/**
 *
 */
class Quadrangle extends Tool {
 
  Quadrangle(PVector center, double theta, float elasticity) {
   super(Polygon.createRegularPolygon(center, 4, cellSideLength/2),
         new PVector(0, 0), Float.POSITIVE_INFINITY, elasticity, QUADRANGLE);
   this.rotate(theta);
  } 
 
  void rotate(double theta) {
    super.rotate(theta);
   ((Polygon)this.getShape()).rotate(theta);
  } 
  
  void handleMouseMessage(MouseMessage m) {} //TODO: fil in?
  
  void draw() {
    super.draw();
    getShape().draw();
  }

}

/**
 *
 */
class Triangle extends Tool {
  
 Triangle(PVector center, double theta, float elasticity) {
   super(Polygon.createRegularPolygon(center, 3, cellSideLength/2),
         new PVector(0, 0), Float.POSITIVE_INFINITY, elasticity, TRIANGLE);
   this.rotate(theta);
 }

 void rotate(double theta) {
   super.rotate(theta);
   ((Polygon)this.getShape()).rotate(theta);
 } 
 
 void handleMouseMessage(MouseMessage m) {
   //note:assumes clicked in own cell
   if(!isSelected()) {
    select(); 
   }
   //TODO: handle
   println("clicked in triangle");
 }
 
 void draw() {
  super.draw();
  getShape().draw();
  //TODO: add handle
 }  
}

/**
 *
 */
class Hexagon extends Tool {
 
  Hexagon(PVector center, double theta, float elasticity) {
   super(Polygon.createRegularPolygon(center, 6, cellSideLength/2),
         new PVector(0, 0), Float.POSITIVE_INFINITY, elasticity, HEXAGON);
   this.rotate(theta);
  } 
 
  void rotate(double theta) {
   super.rotate(theta);
   ((Polygon)this.getShape()).rotate(theta);
  } 
  
  void handleMouseMessage(MouseMessage m) {} //TODO: fil in?
  
  void draw() {
    super.draw();
    getShape().draw();
  }

}

/**
 *
 */
class CircleTool extends Tool {
 
  CircleTool(PVector center, double theta, float elasticity) {
   super(new Circle(center, cellSideLength/2),
         new PVector(0, 0), Float.POSITIVE_INFINITY, elasticity, CIRCLETOOL);
  } 
  
  void handleMouseMessage(MouseMessage m) {} //TODO: fil in?
  
  void draw() {
    super.draw();
    getShape().draw();
  }
}

/**
 *
 */
class Wedge extends Tool {
  
  Wedge(PVector center, double theta, float elasticity) {
    super(generateWedge(center), new PVector(0,0), Float.POSITIVE_INFINITY, elasticity, WEDGE);
    rotate(theta);
  }
  
  void rotate(double theta) {
    super.rotate(theta);
  }
  
  void handleMouseMessage(MouseMessage m) {}
}

Polygon generateWedge(PVector center) {
  ArrayList<PVector> points = new ArrayList<PVector>();
  points.add(new PVector(cellSideLength/2,cellSideLength/2));
  points.add(new PVector(-cellSideLength/2,cellSideLength/2));
  points.add(new PVector(-cellSideLength/2,-cellSideLength/2));
  return new Polygon(center,points);
}


///////////////////////////////////////////////////
// GROUPS
///////////////////////////////////////////////////

class ToolGroup extends Group<Tool> {
 
 ToolGroup(World theworld) {
  super(theworld);
 }

 void deselectAll() {
  for(Iterator<Tool> iter = iterator(); iter.hasNext(); ) {
    iter.next().deselect();
  }
 } 
  
}

///////////////////////////////////////////////////
// INTERACTORS
///////////////////////////////////////////////////

class BallGoalCollider extends Collider<Ball, Goal> {
  public boolean handle(Ball being1, Goal being2) {
    setMode(COMPLETED);
    return true;
  }
}



///////////////////////////////////////////////////
// GENERAL MOUSE HANDLER
///////////////////////////////////////////////////

/**
 *
 */
class MouseHandler implements MouseSubscriber {

  Canvas _c;
  ToolBox _b;
  RunButton _r;
  RandomButton _rand;

  MouseHandler(Canvas c, ToolBox b, RunButton r, RandomButton rand) {
    _c = c;
    _b = b;
    _r = r;
    _rand = rand;
  }

  void handleMouseMessage(MouseMessage m) {
    int x = m.getX();
    int y = m.getY();
    
    // no matter where you click, deselect all tools
    if(m.getAction() == PostOffice.MOUSE_PRESSED) {
      toolGroup.deselectAll();
    }
    
    if(canvasLeftX<x && x<canvasRightX && containerTopY<y && y<containerBottomY) {// in canvas
      _rand.setHover(false);
      _r.setHover(false); // turn run button hover off
      _c.handleMouseMessage(m); 
    } else if(toolBoxLeftX<x && x<toolBoxRightX && containerTopY<y && y<containerBottomY) { // in toolbox
      checkCanvasHover();
      _rand.setHover(false);
      _r.setHover(false); // turn run button hover off
      _b.handleMouseMessage(m);
    } else if(HermesMath.inCircle(x,y,runButtonCenterX,runButtonCenterY,runButtonRadius)) { // in run button
      checkCanvasHover();
      _rand.setHover(false);
      _r.setHover(true); // turn run button hover on
      _r.handleMouseMessage(m);
    } else if(randomButtonX - randomButtonSide/2 < x && randomButtonY - randomButtonSide/2 < y && x < randomButtonX + randomButtonSide/2 && y < randomButtonY + randomButtonSide/2) { // in random button
      if(mode==BUILD) _rand.setHover(true);
      _rand.handleMouseMessage(m);
      _r.setHover(false); // turn run button hover off
    } else { // not in container
      checkCanvasHover();
      _rand.setHover(false);
      _r.setHover(false); // turn run button hover off
      notInAContainer(m); 
    }
    
  } 
  
  void checkCanvasHover() {
    if(_c.getHover()) { //remove hover from canvas
      _c.eraseHover();
      _c.setHover(false);
    }
  }

  void notInAContainer(MouseMessage m) {
    int action = m.getAction();
    if(action == PostOffice.MOUSE_RELEASED && mode == BUILD) {
      //check if you are currently dragging a tool
      if(dragTool!=null) {
        world.deleteBeing(dragTool); //delete the tool
        dragTool = null;
      }
    }
    if(action == PostOffice.MOUSE_DRAGGED && mode == BUILD) {
      if(dragTool!=null) { // currently dragging a tool
        //Update location of tool being dragged
        dragTool.setPosition(new PVector(m.getX(), m.getY()));
      }
    }
  }   
}

///////////////////////////////////////////////////
// OTHER CLASSES
///////////////////////////////////////////////////

/**
 *
 */
class Zero {
  
 int vertBarWidth = 30;
 int vertBarHeight = 60;
 
 int horizBarWidth = 60;
 int horizBarHeight = 10;
 
 int vertBarLeftX = 0;
 int vertBarRightX = 70;
 int vertBarY = horizBarHeight;

 int horizBarX = 20;
 int horizBarBottomY = horizBarHeight + vertBarHeight;
 int horizBarTopY = 0;

 void draw() {
   fill(255);
   noStroke();
   rect(horizBarX, horizBarTopY, horizBarWidth, horizBarHeight);
   rect(horizBarX, horizBarBottomY, horizBarWidth, horizBarHeight);
   rect(vertBarLeftX, vertBarY, vertBarWidth, vertBarHeight);
   rect(vertBarRightX, vertBarY, vertBarWidth, vertBarHeight);
 } 
  
}

///////////////////////////////////////////////////
// HELPER METHODS
///////////////////////////////////////////////////

/**
 *
 */
void setMode(int newMode) {
  if(newMode == BUILD) {
    if(bubbleGroup!=null) {//delete the bubbles
      bubbleGroup.destroy();
    }
    if(ball!=null) {     //delete the ball
      world.deleteBeing(ball);
      ball = null;
    }
    if(goal!=null) { // delete the goal
      world.deleteBeing(goal);
      goal = null;
    }
  } else if(newMode == RUN) {
    //clean up global vars
    templateTool = null;
    dragTool = null;
    
    makeBubbles();//make the bubbles (note: I put this before make the ball so that ball will be drawn overtop)
    ball = new Ball();    //make the ball
    world.addBeing(ball, ballGroup);
    goal = new Goal();    //make the goal
    world.addBeing(goal, goalGroup);
  } else if(newMode == COMPLETED) {
    //TODO: fill in 
    if(ball!=null) {
      world.deleteBeing(ball);
      ball = null; 
    }
  }
  
  mode = newMode;
}

/**
 *
 */
void makeBubbles() {
  Cell[][] grid = canvas.getGrid();
  for(int i=0; i<canvasNumCellsX; i++) {
   for(int j=0; j<canvasNumCellsY; j++) {
     if(!grid[i][j].hasTool()) {
       Bubble bubble = new Bubble(new PVector(canvasLeftX+(i*cellSideLength)+(cellSideLength/2), containerTopY+(j*cellSideLength)+(cellSideLength/2)));
       world.addBeing(bubble, bubbleGroup);//add to bubbleGroup
     }
   } 
  }
}

///////////////////////////////////////////////////
// PAPPLET
///////////////////////////////////////////////////

void setup() {
  size(frameWidth, frameHeight);
  Hermes.setPApplet(this);
 
  cam = new Camera();
  try {
   po = new PostOffice(8080, 8000);
  } catch(Exception e) {
   po = new PostOffice();
  }
  world = new World(po, cam);
  world.lockUpdateRate(50);
  
  rectMode(CORNER);
  setMode(BUILD);
  
  //instantiate groups
  ballGroup = new Group(world);
  goalGroup = new Group(world);
  toolGroup = new ToolGroup(world);
  canvasGroup = new Group(world);
  bubbleGroup = new Group(world);
  
  //containers
  canvas = new Canvas();
  world.registerBeing(canvas, true);
  world.addBeing(canvas, canvasGroup);
  toolBox = new ToolBox();
  world.registerBeing(toolBox, false);
  
  //buttons
  RunButton runButton = new RunButton();
  world.registerBeing(runButton, true);
  textFont(createFont("Courier", 36));
  textAlign(CENTER);
  RandomButton randomButton = new RandomButton(canvas);
  world.registerBeing(randomButton,false);
  
  //make the mousehandler and register subscriptions with the postoffice
  MouseHandler mouseHandler = new MouseHandler(canvas, toolBox, runButton, randomButton);
  po.registerMouseSubscription(mouseHandler, PostOffice.LEFT_BUTTON);
	po.registerMouseSubscription(mouseHandler, PostOffice.NO_BUTTON);
  
  //register interactions
  world.registerInteraction(canvasGroup, ballGroup, new InsideMassedCollider(), true);
  world.registerInteraction(canvasGroup, bubbleGroup, new InsideMassedCollider(), true);
  world.registerInteraction(ballGroup, goalGroup, new BallGoalCollider(), true);
  world.registerInteraction(toolGroup, ballGroup, new MassedCollider(), true);
  world.registerInteraction(toolGroup, bubbleGroup, new MassedCollider(), true);
   
  smooth();

  world.start(); // gets the World thread running
}

void draw() {
    background(bgColor);
    cam.draw(); // Camera object handles drawing all the appropriate Beings
}
