/**
 * Basic game object class
 * Anything that is getting drawn or interacting with other game objects is a Being
 */
abstract class Being {
	
	abstract double getX();
	abstract double getY();
	abstract double getZ();
	
	//Need to add Shape enum?
	//Also does every Being need a 
	abstract Shape getShape;
	
	List<Group> groups;
	Shape shape;
	
	//TODO: need to add methods for recieving messages?
	//Has to be defined in Being
	
}

/**
 * TODO: Timer class?
 */

/**
 * Contains necessary logic to interact two beings
 * detect method determines if two bodies should interact
 * handle "interacts" the two beings by updating them
 */
interface Interactor<A,B> {
	
	boolean detect(A, B);
	void handle(A, B);
	
}

/**
 * Determines which beings are compared and potentially interacted by Interactor
 * Group B is given as arugment to constructor and organized according to optimizer type
 * Basic optimizer checks all the members of A against all the members of B (order n^2)
 * Sample advanced optimizers include quadtree
 * detect checks body A against the structure formed from Group B
 */
interface Optimizer<A,B> {
	
	public void detect(A body, Interactor i);
	
}

/**
 * TODO: Need Group def?
 */

/**
 * Defines a 'game state'
 * Examples include: Levels, menu screens
 * Subclassed by user to create individual worlds
 * User creates the necessary Beings, Interactors, and Optimizers in setup
 * The other functions are implemented by us; we handle the running and drawing of the world
 */
abstract class World {

	List<Being> masterList;
	
	//Setup loop
	//Written by user
	abstract void setup();
	
	//Is this in the world?
	void registerInteraction(Group A, Group B, Interactor inter, Oprimizer optimizer) {}
	
	//Creates a new thread and runs the update loop in it
	void run() {}
	
	//Basic method to call to know if world is running or not
	boolean getState {}
	
	//Called by God's draw method to 
	void draw() {}

}

/**
 * TODO: Need God def?
 * Another note: way to draw smooth transitions between screens?
 */

/**
 * Handles communication between game and outside world
 * Detects key events, mouse events, and osc messages
 * Beings filter passed messages internally
 */
class PostOffice {
	
	//Fields containing subscribing Beings
	ArrayList<Being> keySubscribed;
	ArrayList<Being> mouseSubscribed;
	ArrayList<Being> oscSubscribed;
	
	//Constructor
	PostOffice() {}
	
	//Runs Post Office
	//Waits for events, and adds them to queue for handling
	//Does not handle events while a world update loop is running
	void run() {}
	
	//Sends key presses to subscribing Beings
	void handleKeyPress(char keyPressed) {}
	
	//Sends mouse clicks to subscribing Beings
	void handleMouseClick(Point clickLocation) {}
	
	//Sends osc messages to subscribing Beings
	//Q: how will we internally represent OSC messages?
	void handleOSC(Message recievedMessage) {}
	
	//Registers Being for keyboard subscription
	void registerKeySubscribe(Being b) {}
	
	//Registers Being for mouse subscription
	void registerMouseSubscribe(Being b) {}
	
	//Registers Being for osc subscription
	void registerOSCSubscribe(Being b) {}
}