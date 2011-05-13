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

/**
Notes:
- may want to make toolbox into more columns to fit all the tools -- maybe even add an area for "currently selected tool" 
  or just add some length to the deal -- need odd number of tiles high
- may not need to register the canvas, toolbox with world (do not need to get drawn, updated) 
- could we add a sort of map and filter functionality to group? since it's parametrized,  it might
  be doable (maybe using a class .... i dont know)
- ask sam about multi-sampling
- at some point ... levels, menus, more tools, handles for rotating by mouse arbitrary angles


//TODO:


Bugs:




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
int frameHeight = 590;
int bgColor = color(122, 131, 139);

//groups
Group<Ball> ballGroup = null;
Group<Goal> goalGroup = null;
Group<Canvas> canvasGroup = null;
Group<Tool> toolGroup = null;
Group<Bubble> bubbleGroup = null;

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
      selectedTool = null;
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
    selectedTool = null;
    
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
  toolGroup = new Group(world);
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
  po.registerKeySubscription(runButton,PostOffice.R);
  RandomButton randomButton = new RandomButton(canvas);
  world.registerBeing(randomButton,false);
  po.registerKeySubscription(randomButton,PostOffice.SPACE);
  
  //key for SelectedToolAttributeSwitcher
  SelectedToolAttributeSwitcher selectedToolAttributeSwitcher = new SelectedToolAttributeSwitcher();
  po.registerKeySubscription(selectedToolAttributeSwitcher,PostOffice.E);
  po.registerKeySubscription(selectedToolAttributeSwitcher,PostOffice.W);
  
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
