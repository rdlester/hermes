///////////////////////////////////////////////////
// GLOBAL VARS AND CONSTANSTS
///////////////////////////////////////////////////

World world;
PostOffice po;


final int BUILD = 0;
final int RUN = 1;
final int COMPLETED = 2;
int mode = BUILD; // 0 is setup; 1 is run

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

int cellSideLength = 40; //gives us 9 across, 12 down in canvas ; 3 across, 12 down in toolbox

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
// Button constants
///////////////////////////////////////////////////

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

///////////////////////////////////////////////////
// Container constants
///////////////////////////////////////////////////

//Cell constants
static final PVector INIT_DIR = new PVector(0,1);
static final float INIT_STR = 1;
float flowMax = 10;
int canvasNumCellsX = canvasWidth / cellSideLength;
int canvasNumCellsY = containerHeight / cellSideLength;
int toolBoxNumCellsX = toolBoxWidth / cellSideLength;
int toolBoxNumCellsY = containerHeight / cellSideLength;

///////////////////////////////////////////////////
// Ball and Goal constants
///////////////////////////////////////////////////

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

///////////////////////////////////////////////////
// Tool constants
///////////////////////////////////////////////////

//Constants defining the tools
final int NOTOOL = 0;
final int QUADRANGLE = 1;
final int TRIANGLE = 2;
final int HEXAGON = 3;
final int CIRCLETOOL = 4;
final int WEDGE = 5;
final int PUNCHER = 6; //to be added
final int BATON = 7; //to be added
final int FUSE = 8; //to be added
//Tool stored by dragging, used for placing tools on the board
Tool templateTool = null;
Tool dragTool = null;
Tool selectedTool = null;
int dragIniti = -1; // set to -1 when from toolbox,
int dragInitj = -1; // real values when from canvas

//tool elasticity
final float SPRINGY = 1.5; //TODO: ??????set?
final float PERFECT = 1;
final float STICKY = 0.5;

//cilia
int ciliaNum = 16; //number of silia
int csize = 3; //size of the silia


