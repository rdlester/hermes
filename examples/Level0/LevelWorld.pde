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
    registerBeing(canvas, true);
    addToGroup(canvas, canvasGroup);
    _postOffice.registerMouseSubscription(canvas,NO_BUTTON,canvas.getShape());
    _postOffice.registerMouseSubscription(canvas,LEFT_BUTTON,canvas.getShape());
    toolBox = new ToolBox(canvas);
    registerBeing(toolBox, false);
    _postOffice.registerMouseSubscription(toolBox,NO_BUTTON);
    _postOffice.registerMouseSubscription(toolBox,LEFT_BUTTON);
    
    //buttons
    RunButton runButton = new RunButton(_postOffice);
    registerBeing(runButton, true);
    _postOffice.registerKeySubscription(runButton,R);
    _postOffice.registerMouseSubscription(runButton,NO_BUTTON,runButton.getShape());
    _postOffice.registerMouseSubscription(runButton,LEFT_BUTTON,runButton.getShape());
    RandomButton randomButton = new RandomButton(canvas,_postOffice);
    registerBeing(randomButton,false);
    _postOffice.registerKeySubscription(randomButton,SPACE);
    _postOffice.registerMouseSubscription(randomButton,NO_BUTTON,randomButton.getShape());
    _postOffice.registerMouseSubscription(randomButton,LEFT_BUTTON,randomButton.getShape());

    //key for SelectedToolAttributeSwitcher
    SelectedToolAttributeSwitcher selectedToolAttributeSwitcher = new SelectedToolAttributeSwitcher();
    _postOffice.registerKeySubscription(selectedToolAttributeSwitcher,E);
    _postOffice.registerKeySubscription(selectedToolAttributeSwitcher,W);

    //make the mousehandler and register subscriptions with the postoffice
    /*MouseHandler mouseHandler = new MouseHandler(canvas, toolBox, runButton, randomButton);
    _postOffice.registerMouseSubscription(mouseHandler, LEFT_BUTTON);
    _postOffice.registerMouseSubscription(mouseHandler, NO_BUTTON);*/

    //register interactions
    registerInteraction(canvasGroup, ballGroup, new InsideMassedCollider());
    registerInteraction(canvasGroup, bubbleGroup, new InsideMassedCollider());
    registerInteraction(ballGroup, goalGroup, new BallGoalCollider());
    registerInteraction(toolGroup, ballGroup, new MassedCollider());
    registerInteraction(toolGroup, bubbleGroup, new MassedCollider());
  }
}

