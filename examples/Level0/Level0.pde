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
- handle special case -- no putting tool on ball or goal
- fix colours!!
- make run/build button better
- ask sam about multisampling -- need here?
- make cell arrows draw
- make cell arrow "randomizer"


Bugs:
- when circle collides it looks like 2*radius or something (maybe corner vs centre)




**/

///////////////////////////////////////////////////
// GLOBAL VARS AND CONSTANSTS
///////////////////////////////////////////////////

World world;
Camera cam;
PostOffice po;


final int BUILD = 0;
final int RUN = 1;
int mode = BUILD; // 0 is setup; 1 is run


//Frame size
int frameWidth = 700;
int frameHeight = 630;

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
float flowMax = 10;
int cellSideLength = 40; //gives us 9 across, 12 down in canvas ; 3 across, 12 down in toolbox
int canvasNumCellsX = canvasWidth / cellSideLength;
int canvasNumCellsY = containerHeight / cellSideLength;
int toolBoxNumCellsX = toolBoxWidth / cellSideLength;
int toolBoxNumCellsY = containerHeight / cellSideLength;

//run button
int runButtonWidth = 100;
int runButtonHeight = 60;
int runButtonLeftX = canvasLeftX;
int runButtonTopY = containerTopY-80;
int runButtonRightX = runButtonLeftX+runButtonWidth;
int runButtonBottomY = runButtonTopY+runButtonHeight;

//Constants defining the tools
final int NOTOOL = 0;
final int PUNCHER = 1;
final int BATON = 2;
final int FUSE = 3;
final int SQUARE = 4;
final int CIRCLE = 5;
final int FAKETOOL = 100; //TODO: remove this obvs
//Tool stored by dragging, used for placing tools on the board
int toolMode = NOTOOL;
Tool dragTool = null;

//ball
Ball ball = null;
int balli = 0; //index in canvas
int ballj = 0;
int ballRadius = 20;
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
Group<Tool> toolGroup = null;



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
  
  Cell[][] getGrid() {
   return _grid; 
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

	if(action == PostOffice.MOUSE_RELEASED && mode == BUILD) { 
          if(dragTool != null) { //tool is being dropped into a cell
          //NOTE: dragTool's CENTER is at the mouse location
	        // remove the tool at that cell if necessary
		if(in.hasTool()) {
                  Tool toRemove = in.getTool();
                  in.setTool(null);
		  world.deleteBeing(toRemove);
		}
		dragTool.setPosition(new PVector(canvasLeftX+(i*cellSideLength), containerTopY+(j*cellSideLength)));
                in.setTool(dragTool);
		_toolGroup.add(dragTool);
                
                //clean up global vars
                dragTool = null;
		//TODO how to account for multi-cell objects? What about the baton (which doesn't actually take up a cell?)
	  }

	} else if(action == PostOffice.MOUSE_PRESSED && mode == BUILD) {
          //check if pressed on cell containing tool
          if(in.hasTool()) {
           dragTool = in.getTool();//set dragTool to the tool therein
           in.setTool(null);
          } else if(toolMode!=NOTOOL) { //cell has no tool and toolMode is set to something
            Tool newTool = makeTool(toolMode, new PVector(canvasLeftX+i*cellSideLength, containerTopY+j*cellSideLength));
            in.setTool(newTool);
            _toolGroup.add(newTool);
          }
          
	} else if(action == PostOffice.MOUSE_DRAGGED && mode == BUILD) {
          if(dragTool!=null) { //TODO: this code is identical in 3 places, probably a better way to do this
            dragTool.setPosition(new PVector(m.getX()-cellSideLength/2, m.getY()-cellSideLength/2));
          } else if(toolMode!=NOTOOL) {
      	    // remove the tool at that cell if necessary
	    if(in.hasTool()) {
              Tool toRemove = in.getTool();
              in.setTool(null);
              world.deleteBeing(toRemove);
            }      
            Tool newTool = makeTool(toolMode, new PVector(canvasLeftX+i*cellSideLength, containerTopY+j*cellSideLength));
            in.setTool(newTool);
            _toolGroup.add(newTool); 
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
	   _grid[i][j] = new Cell(new PVector(toolBoxLeftX + i*cellSideLength, containerTopY + j*cellSideLength));
           world.registerBeing(_grid[i][j], false);
       } 
     }
     
     //add the zero
     zero = new Zero();
     
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
      // if that cell contains a tool, set toolMode to that tool 
      if(_grid[i][j].hasTool()) {
        toolMode = _grid[i][j].getTool().getToolCode();
      }
    } else if(m.getAction() == PostOffice.MOUSE_DRAGGED && mode == BUILD) {
      if(dragTool!=null) { //already dragging a tool
        dragTool.setPosition(new PVector(m.getX()-cellSideLength/2, m.getY()-cellSideLength/2));
      } else if(toolMode!=0) { // toolMode already set but no new tool created yet
        //instantiate new version of that tool 
        //TODO: make static method in tool to return a new instance of that tool (taking toolcode and pos)
        dragTool = makeTool(toolMode, new PVector(m.getX()-cellSideLength/2, m.getY()-cellSideLength/2));
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
  
  PVector getFlowDirection() {
   return _flowDirection; 
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
   if(mode == BUILD) { // in BUILD mode
     if(hasTool()) { // the cell contains a tool
       _tool.draw();
     } else { // draw the arrow
       stroke(0,0,255,70);
       line(cellSideLength/2, cellSideLength/4, cellSideLength/2, 3*cellSideLength/4);//TODO: make actual arrow, for now just line
       //TODO: idea: init flow to -1 and don't draw if <0, set flows for canvas in its initialize()
     }
   } else if(mode == RUN) { // in RUN mode
     //TODO: fill in
   }
   

  }
 }
 
 
/**
 *
 */
abstract class Tool extends MassedBeing {
  int _toolCode;
 Tool(Shape shp, PVector velocity, float mass, float elasticity, int toolCode) {
  super(shp, velocity, mass, elasticity); 
  _toolCode = toolCode;
  world.registerBeing(this, true);
  world.addBeing(this, toolGroup);
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
   super(new Rectangle(position, new PVector(cellSideLength, cellSideLength), PApplet.CORNER), 
         new PVector(0, 0), Float.POSITIVE_INFINITY, 1, FAKETOOL);
 } 
  
 void draw() {
   fill(0);
   stroke(255);
   strokeWeight(2);
   rect(0, 0, cellSideLength, cellSideLength);
   
 }

  
}

/**
 * The user pushes the RunButton to run the simulation, changing mode to RUN
 */
class RunButton extends Being {

  RunButton() {
    super(new Rectangle(new PVector(runButtonLeftX, runButtonTopY), new PVector(runButtonWidth, runButtonHeight), PApplet.CORNER), new PVector(0,0));
  }
  
  void handleMouseMessage(MouseMessage m) {
    if(m.getAction() == PostOffice.MOUSE_PRESSED) {
      //switch modes
      if(mode == BUILD) {
        setMode(RUN); 
      } else if(mode == RUN) {
        setMode(BUILD); 
      }
    }
  }
  
  void draw() {
   if(mode == BUILD) {
     fill(50, 255, 50);
   } else if(mode == RUN) {
     fill(255, 50, 50); 
   }
   noStroke();
   rect(0, 0, runButtonWidth, runButtonHeight); 
  }
  
}

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
    Cell[][] grid = canvas.getGrid();
    Cell in = grid[i][j];  
    if(!in.hasTool()) { //appply the flow if the cell has no tool within
     setVelocity(PVector.add(getVelocity(), in.getFlowDirection()));
    } 
    
  }
  
  void draw() {
    fill(189, 0, 0);
    noStroke();
    ellipse(0,0,ballRadius,ballRadius);
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
  strokeWeight(2);
  stroke(189, 0, 0);
  line(10,10,cellSideLength-10,cellSideLength-10); //    \
  line(cellSideLength-10, 10, 10, cellSideLength-10); //  /
 } 
}

///////////////////////////////////////////////////
// INTERACTORS
///////////////////////////////////////////////////

class BallGoalCollider extends Collider<Ball, Goal> {
  public boolean handle(Ball being1, Goal being2) {
    println("ball goal collided");
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
	
	MouseHandler(Canvas c, ToolBox b, RunButton r) {
		_c = c;
		_b = b;
                _r = r;
	}
	
        void handleMouseMessage(MouseMessage m) {
         int x = m.getX();
         int y = m.getY();
         
         if(canvasLeftX<x && x<canvasRightX && containerTopY<y && y<containerBottomY) {// in canvas
           _c.handleMouseMessage(m); 
         } else if(toolBoxLeftX<x && x<toolBoxRightX && containerTopY<y && y<containerBottomY) { // in toolbox
           _b.handleMouseMessage(m);
         } else if(runButtonLeftX<x && x<runButtonRightX && runButtonTopY<y && y<runButtonBottomY) {
           _r.handleMouseMessage(m);
         } else { // not in container
           notInAContainer(m); 
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
              dragTool.setPosition(new PVector(m.getX()-cellSideLength/2, m.getY()-cellSideLength/2));
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
    toolMode = NOTOOL;
    dragTool = null;
    ball = new Ball();    //make the ball
    world.addBeing(ball, ballGroup);
    goal = new Goal();    //make the goal
    world.addBeing(goal, goalGroup);
  }
  
  mode = newMode;
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
  toolGroup = new Group(world);
  canvasGroup = new Group(world);
  
  //containers
  canvas = new Canvas();
  world.registerBeing(canvas, true);
  world.addBeing(canvas, canvasGroup);
  toolBox = new ToolBox();
  world.registerBeing(toolBox, false);
  
  //run button
  RunButton runButton = new RunButton();
  world.registerBeing(runButton, false);
  
  //TODO: make the ball, bubbles, set modes, make inside massed collider
  
  //make the mousehandler and register subscriptions with the postoffice
  MouseHandler mouseHandler = new MouseHandler(canvas, toolBox, runButton);
  po.registerMouseSubscription(mouseHandler, PostOffice.LEFT_BUTTON);
  
  //register interactions
  world.registerInteraction(canvasGroup, ballGroup, new InsideMassedCollider(), true);
  world.registerInteraction(ballGroup, goalGroup, new BallGoalCollider(), true);
  world.registerInteraction(toolGroup, ballGroup, new MassedCollider(), true);
  
  smooth();

  world.start(); // gets the World thread running
}


void draw() {
    background(110);
    
    cam.draw(); // Camera object handles drawing all the appropriate Beings

}
