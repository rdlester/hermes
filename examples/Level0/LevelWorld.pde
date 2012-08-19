public class LevelWorld extends World {
  
  public LevelWorld(int portIn, int portOut) {
    super(portIn, portOut);
  }
  
  public void setup() {
    //instantiate groups
    ballGroup = new Group(world);
    goalGroup = new Group(world);
    toolGroup = new Group(world);
    canvasGroup = new Group(world);
    bubbleGroup = new Group(world);
    
    //containers
    canvas = new Canvas(_postOffice);
    println("canvas created");
    register(canvas, true);
    addToGroup(canvas, canvasGroup);
    _postOffice.subscribe(canvas,Button.NO,canvas.getShape());
    _postOffice.subscribe(canvas,Button.LEFT,canvas.getShape());
    toolBox = new ToolBox(canvas);
    register(toolBox, false);
    _postOffice.subscribe(toolBox,Button.NO);
    _postOffice.subscribe(toolBox,Button.LEFT);
    
    //buttons
    RunButton runButton = new RunButton(_postOffice);
    register(runButton, true);
    _postOffice.subscribe(runButton,R);
    _postOffice.subscribe(runButton,Button.NO,runButton.getShape());
    _postOffice.subscribe(runButton,Button.LEFT,runButton.getShape());
    RandomButton randomButton = new RandomButton(canvas,_postOffice);
    register(randomButton,false);
    _postOffice.subscribe(randomButton,SPACE);
    _postOffice.subscribe(randomButton,Button.NO,randomButton.getShape());
    _postOffice.subscribe(randomButton,Button.LEFT,randomButton.getShape());

    //key for SelectedToolAttributeSwitcher
    SelectedToolAttributeSwitcher selectedToolAttributeSwitcher = new SelectedToolAttributeSwitcher();
    _postOffice.subscribe(selectedToolAttributeSwitcher,E);
    _postOffice.subscribe(selectedToolAttributeSwitcher,W);

    //make the mousehandler and register subscriptions with the postoffice
    /*MouseHandler mouseHandler = new MouseHandler(canvas, toolBox, runButton, randomButton);
    _postOffice.subscribe(mouseHandler, LEFT_BUTTON);
    _postOffice.subscribe(mouseHandler, NO_BUTTON);*/

    //register interactions
    register(canvasGroup, ballGroup, new InsideMassedCollider());
    register(canvasGroup, bubbleGroup, new InsideMassedCollider());
    register(ballGroup, goalGroup, new BallGoalCollider());
    register(toolGroup, ballGroup, new MassedCollider());
    register(toolGroup, bubbleGroup, new MassedCollider());
  }
}

