import src.template.library.*;
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



//TODO:
- mousemessage handling is messy - just do it from one place






**/

///////////////////////////////////////////////////
// GLOBAL VARS AND CONSTANSTS
///////////////////////////////////////////////////

World world;
Camera cam;
PostOffice po;


static int BUILD = 0;
static int RUN = 1;
int mode = BUILD; // 0 is setup; 1 is run


//Frame size
int frameWidth = 700;
int frameHeight = 540;

//Container sizes and locations
//Y location and size is same for both
int containerHeight = 480;
int containerTopY = 30;
int containerBottomY = containerTopY + containerHeight;
//Canvas X and width
int canvasWidth = 360;
int canvasLeftX = 30;
int canvasRightX = canvasLeftX + canvasWidth;
//Toolbox X and width
int toolBoxWidth = 120;
int toolBoxLeftX = 430;
int toolBoxRightX = toolBoxLeftX + toolBoxWidth;

//Cell constants
float flowMax = 10;
int cellSideLength = 40; //gives us 9 across, 12 down in canvas ; 3 across, 12 down in toolbox
int canvasNumCellsX = canvasWidth / cellSideLength;
int canvasNumCellsY = containerHeight / cellSideLength;
int toolBoxNumCellsX = toolBoxWidth / cellSideLength;
int toolBoxNumCellsY = containerHeight / cellSideLength;

//Tool stored by dragging, used for placing tools on the board
int toolMode = 0;
//Constants defining the tool being dragged
final int PUNCHER = 1;
final int BATON = 2;
final int FUSE = 3;
final int SQUARE = 4;
final int CIRCLE = 5;
final int FAKETOOL = 100; //TODO: remove this obvs

Tool dragTool = null;


////////////////////////////////////////
// BEINGS
////////////////////////////////////////

/**
 * Central canvas for building levels/tracks
 * Holds information for vector field
 * Has inside bounding box
 * Responsible for placing tools into grid
 */
class Canvas extends MassedBeing {
  
	Cell[][] _grid;
	Group<Tool> _toolGroup;

  Canvas() {
    super(new Rectangle(new PVector(canvasLeftX, containerTopY), new PVector(canvasWidth, containerHeight), PApplet.CORNER),
          new PVector(0,0), Float.POSITIVE_INFINITY, 1);
    _grid = new Cell[canvasNumCellsX][canvasNumCellsY];
    _toolGroup = new Group<Tool>(world);
    initialize();
  }
  
  void initialize() {
    for(int i=0; i<canvasNumCellsX; i++) {
     for(int j=0; j<canvasNumCellsY; j++) {
	   _grid[i][j] = new Cell(new PVector(canvasLeftX + i*cellSideLength, containerTopY + j*cellSideLength));
           world.registerBeing(_grid[i][j], false);
     } 
    }
  }

	//TODO Add cell randomizer
  //TODO: does this even need toget drawn?
  void draw() {

  }

  /**
   * Checks if mouse is currently in canvas
   * If the user has selected a tool, place the tool in the location of the mouse
   */
  void handleMouseMessage(MouseMessage m) {
	int x = m.getX();
	int y = m.getY();
	x -= canvasLeftX;
	y -= containerTopY;
        int i = x / cellSideLength;
	int j = y / cellSideLength;
	// add the tool to the appropriate cell
	Cell in = _grid[i][j];
	
	int action = m.getAction();

	if(action == PostOffice.MOUSE_RELEASED) { 
          if(dragTool != null) { //tool is being dropped into a cell
          //NOTE: dragTool's CENTER is at the mouse location
	        // remove the tool at that cell if necessary
		if(in.hasTool()) {
                  Tool toRemove = in.getTool();
                  in.setTool(null);
		  world.removeBeingFromAllGroups(toRemove);
		}
		dragTool.setPosition(new PVector(canvasLeftX+(i*cellSideLength), containerTopY+(j*cellSideLength)));
                in.setTool(dragTool);
		_toolGroup.add(dragTool);
                
                //clean up global vars
                dragTool = null;
		//TODO how to account for multi-cell objects? What about the baton (which doesn't actually take up a cell?)
	  }
	} else if(action == PostOffice.MOUSE_PRESSED) {
          //check if pressed on cell containing tool
          if(in.hasTool()) {
           dragTool = in.getTool();//set dragTool to the tool therein
           in.setTool(null);
          }	
	} else if(action == PostOffice.MOUSE_DRAGGED) {
          if(dragTool!=null) { //TODO: this code is identical in 3 places, probably a better way to do this
            dragTool.setPosition(new PVector(m.getX()-cellSideLength/2, m.getY()-cellSideLength/2));
          }
		
	}
  }
}

/**
 * The ToolBox contains the available tools for level-buidling
 */
class ToolBox extends Being {
  
  Cell[][] _grid;
  
  //keep track of where the selector tools are
  FakeTool _fakeTool;
  int _fakeTooli = 1;
  int _fakeToolj = 1;
  
  ToolBox() {
    super(new Rectangle(new PVector(toolBoxLeftX, containerTopY), new PVector(toolBoxWidth, containerHeight), PApplet.CORNER));
    _grid = new Cell[toolBoxNumCellsX][toolBoxNumCellsY];
    initialize();
  }
  
  void initialize() {
    
     //make all the cells 
     for(int i=0; i<toolBoxNumCellsX; i++) {
       for(int j=0; j<toolBoxNumCellsY; j++) {
	   _grid[i][j] = new Cell(new PVector(toolBoxLeftX + i*cellSideLength, containerTopY + j*cellSideLength));
           world.registerBeing(_grid[i][j], false);
       } 
     }
     
     //TODO: replace with real tools
     //make a fake tool for testing
     _fakeTool = new FakeTool(new PVector(toolBoxLeftX + _fakeTooli*cellSideLength, 
                                          containerTopY + _fakeToolj*cellSideLength));
     _grid[_fakeTooli][_fakeToolj].setTool(_fakeTool);
  }
  
  /**
   * Handles a mousemessage within the toolbox boundaries
   */
  void handleMouseMessage(MouseMessage m) {
   
    //checks if it was a mouse pressed
    if(m.getAction() == PostOffice.MOUSE_PRESSED) {
      //get pixel location of mouse press in frame
      int x = m.getX();
      int y = m.getY();
      //get pixel location of mouse press relative to toolbox topleft corner
      x -= toolBoxLeftX;
      y -= containerTopY;
      //get i,j indices of cell containing mouse press
      int i = x / cellSideLength;
      int j = y / cellSideLength;
      // if that cell contains a tool, set toolMode to that tool 
      if(_grid[i][j].hasTool()) {
        toolMode = _grid[i][j].getTool().getToolCode();
      }
    } else if(m.getAction() == PostOffice.MOUSE_DRAGGED) {
      if(dragTool!=null) { //already dragging a tool
        dragTool.setPosition(new PVector(m.getX()-cellSideLength/2, m.getY()-cellSideLength/2));
      } else if(toolMode!=0) { // toolMode already set but no new tool created yet
        //instantiate new version of that tool 
        //TODO: make static method in tool to return a new instance of that tool (taking toolcode and pos)
        dragTool = makeTool(toolMode, new PVector(m.getX()-cellSideLength/2, m.getY()-cellSideLength/2));
      }
    } else {
     //TODO: fill in 
    }
    
  }


  void draw() {
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
      stroke(255, 0, 0);
      rect(haloi*cellSideLength, haloj*cellSideLength, cellSideLength, cellSideLength);
    }
  }
  
}

/**
 * Helper class for Canvas, ToolBox, defines a cell in the vector field
 * Location is defined by which cell of the 2D array they are stored in inside Canvas, ToolBox
 */
class Cell extends Being {
 
  PVector _flowDirection; //Any normalized vector
  float _flowStrength; //Cannot be negative or greater than flowMax
  Tool _tool;
  
  Cell(PVector cellTopLeft) {
    super(new Rectangle(cellTopLeft, new PVector(cellSideLength, cellSideLength), PApplet.CORNER));
    _flowDirection = new PVector(0,1);
    _flowStrength = 1;
    _tool = null;
  }
  
  void setFlowDir(PVector direction) {
    _flowDirection = direction; 
  }

  void setFlowStrength(float strength) {
    _flowStrength = strength;
  }
	
  boolean hasTool() {
		return _tool != null;
	}
	
	void setTool(Tool tool) {
		_tool = tool;
	}

  Tool getTool() {
   return _tool; 
  }

  void draw() {
   noFill();
   stroke(255);
   strokeWeight(2);
   rect(0, 0, cellSideLength, cellSideLength);
   if(_tool != null) {
     _tool.draw();
   }
  }
 }
 
 
/**
 *
 */
abstract class Tool extends Being {
  int _toolCode;
 Tool(Shape shp, int toolCode) {
  super(shp); 
  _toolCode = toolCode;
  world.registerBeing(this, false);
 }

 int getToolCode() {return _toolCode;}
}

Tool makeTool(int toolCode, PVector position) {
   Tool toReturn = null;
   switch(toolMode) {
     case FAKETOOL: toReturn = new FakeTool(position); 
                    break;
     default:       println("Error in makeTool: toolCode did not match any tools");
                    break;   
   } 
   return toReturn; 
 }

/**
 *
 */
class FakeTool extends Tool {
 
 FakeTool(PVector position) {
   super(new Rectangle(position, new PVector(cellSideLength, cellSideLength), PApplet.CORNER), FAKETOOL);
 } 
  
 void draw() {
   fill(0);
   rect(0, 0, cellSideLength, cellSideLength);
   
 }

  
}

/**
 *
 */
class MouseHandler implements MouseSubscriber {
	
	Canvas _c;
	ToolBox _b;
	boolean _mousePressed;
	
	MouseHandler(Canvas c, ToolBox b) {
		_c = c;
		_b = b;
		_mousePressed = false;
	}
	
        void handleMouseMessage(MouseMessage m) {
         int x = m.getX();
         int y = m.getY();
         
         if(canvasLeftX<x && x<canvasRightX && containerTopY<y && y<containerBottomY) {// in canvas
           _c.handleMouseMessage(m); 
         } else if(toolBoxLeftX<x && x<toolBoxRightX && containerTopY<y && y<containerBottomY) { // in toolbox
           _b.handleMouseMessage(m);
         } else { // not in container
           notInAContainer(m); 
         } 
        }

	void notInAContainer(MouseMessage m) {
	  int action = m.getAction();
	  if(action == PostOffice.MOUSE_RELEASED) {
	     dragTool = null; //Q: is drag tool in the group? Make sure you remove it when you pick it up!
	  }
          if(action == PostOffice.MOUSE_DRAGGED) {
            if(dragTool!=null) { // currently dragging a tool
	      //Update location of tool being dragged
              dragTool.setPosition(new PVector(m.getX()-cellSideLength/2, m.getY()-cellSideLength/2));
            }
	  }
		
	}
     
}

///////////////////////////////////////////////////
// GROUPS
///////////////////////////////////////////////////

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
  mode = BUILD;
  
  Canvas canvas = new Canvas();
  world.registerBeing(canvas, false);
  ToolBox toolBox = new ToolBox();
  world.registerBeing(toolBox, false);
  
  //TODO: make the ball, bubbles, set modes, make inside massed collider
  
  //make the mousehandler and register subscriptions with the postoffice
  MouseHandler mouseHandler = new MouseHandler(canvas, toolBox);
  po.registerMouseSubscription(mouseHandler, PostOffice.LEFT_BUTTON);
  
  smooth();

  world.start(); // gets the World thread running
}


void draw() {
    background(110);
    
    cam.draw(); // Camera object handles drawing all the appropriate Beings

}
