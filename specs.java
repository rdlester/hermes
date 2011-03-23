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
	
}

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
 * Need Group def?
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
 * Need God def?
 */