/**
 * Basic game object class
 * Anything that is getting drawn or interacting with other game objects is a Being
 */
abstract class Being {

	abstract double getX();
	abstract double getY();
	abstract double getZ();

	/**
	 * draws the object to the screen
	 * takes a screen x and y coor
	 * the reason for this is that the being's internal x and y will be screen coordinates, not world coordinates
	 * there may be a better way to do this, with framebuffers, need to look in to this
	 */
	abstract void draw(x, y);

	//Need to add Shape enum?
	//Also does every Being need a
	abstract Shape getShape;

	List<Group> groups;
	Shape shape; // do beings necessarily need this? -- sam
	
	void update() {}
	
	//TODO: need to add methods for recieving messages?
	//Has to be defined in Being

}

/**
 * used to group Beings
 */
class Group<A extends Being> implements Collection<A> {}

/**
 * used to update Beings
 */ 
abstract class Environment<A extends Being> extends Group<A> {
	
	// updates the contained beings based on the environmental physics and the time since the last update
	abstract void update(double elapsedTime);
	
}

/**
 * an environment with a containing boundary (for example a pool of water)
 */
abstract class BoundedEnvironment<A extends Being> entends Environment<A> {

	Shape boundary;

	/**
	 * expels the contained beings which lie outside the boundary, and returns
	 */
	Group<A> cull() {}

	/**
	 * adds beings if they lie within the boudary
	 */
	void add(Group<A> beings) {}
}

/**
 * TODO: Timer class?
 */

/**
 * Contains necessary logic to interact two beings
 * detect method determines if two bodies should interact
 * handle "interacts" the two beings by updating them
 */
interface Interactor<A extends Body, B extends Body> {

	// returns true if A and B should interact
	boolean detect(A, B);
	// handles an interaction between A and B
	void handle(A, B);
}

/**
 * pre-written, shape-based collision detection
 */
abstract class Collider<A extends Body, B extends Body> implements Interactor<A,B> {
	
	boolean detect(A body1, B body2) {
		Shape.collide(body1.getShape, body2.getShape());
	}
	
}

/**
 * used to add mass to a being
 */
interface Massed { double getMass(); }

/**
 * a pre-written implementation of Collider using a phyics-based collision response algorithm with variable elasticity
 */ 
class MassedCollider<A extends Body implements Massed, B extends Body implements Massed> extends Collider<A,B> {

	// creates a collider, elasticity should be between 0 (inelastic) and 1 (elastic)
	MassedCollider(double elasticiy) {}
	
	void handle(A, B) {}

}

/**
 * Determines which beings are compared and potentially interacted by Interactor
 * Group B is given as arugment to constructor and organized according to optimizer type
 * Basic optimizer checks all the members of A against all the members of B (order n^2)
 * Sample advanced optimizers include quadtree
 * detect checks body A against the structure formed from Group B
 */
interface Optimizer<A,B> {

	// returns all B that body interacts with
	Iterator<B> detect(A body, Interactor i);

	// used in the case of an optimization that can check faster than O(n), for example check mutual interaction
	//  only between beings in the same room
	Iterator<Pair<A,B>> detectAll(Interactor i);
	
}

/**
 * Defines a 'game state'
 * Examples include: Levels, menu screens
 * Subclassed by user to create individual worlds
 * User creates the necessary Beings, Interactors, and Optimizers in setup
 * The other functions are implemented by us; we handle the running and drawing of the world
 */
abstract class World {

	Group<Being> masterList;
	List<Being> masterList;
	Group<Being> camera;

	//Setup loop
	//Written by user
	abstract void setup();

	//Is this in the world?
	void registerInteraction(Group A, Group B, Interactor inter, Optimizer optimizer) {}

	//Creates a new thread and runs the update loop in it
	void run() {}

	//Basic method to call to know if world is running or not
	boolean getState {}

	//Called by God's draw method to
	void draw() {}
	
	// locks the update rate to happen no more than once per interval (in seconds)
	void lockUpdateRate(double interval) {}

}

/**
 * the fundamental game obeject that runs the world and does drawing
 */
class God {
	
	void setWorld(World world);
	
	World getWorld();
	
	// draws the world state to the screen, must be called within user's Processing draw loop
	void draw();
	
	// adds a post graphics effect at the end of the world draw, for things like global fades, glows, etc
	void addGraphicsEffect(GraphicsEffect fx);

}

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
	
	// I'd rather we didn't have direct subscription to key presses and mouse clicks, but rather to general messages
	// the whole point of the post office is to abstract away things like key presses and mouse click -- sam
	
	//Sends key presses to subscribing Beings
	void handleKeyPress(char keyPressed) {}

	//Sends mouse clicks to subscribing Beings
	void handleMouseClick(Point clickLocation) {}

	//Sends osc messages to subscribing Beings
	//Q: how will we internally represent OSC messages?
	void handleOSC(Message recievedMessage) {}

	//Registers Group of Being for keyboard subscription
	void registerKeySubscribe(Group g) {}

	//Registers Group of Being for mouse subscription
	void registerMouseSubscribe(Group g) {}

	//Registers Group of Being for osc subscription
	void registerOSCSubscribe(Group g) {}
}

/**
 * an animated sprite based on an image sequence
 */
class Sprite {

	//Used to store each frame of an animation
	PImage[] frames;

	// loads a Sprite by importing a single image and splitting it into a tiles with given width and height
	Sprite(String filename, int width, int height);
	
	// loads a Sprite from an image sequence in format name.#.ext
	Sprite(String name, String extension, int end, int start = 0);
	
	// creates a playable animation between frames start_frame and end_frame 
	void addAnimation(int key, int start_frame, int end_frame);
	
	// plays the animation denoted by the given keys, will loop indefinitely if loop is true
	void play(int key, boolean loop = false);
	
	// draws the sprite next animation frame at the given screen position
	//  advances frame count by given value
	void draw(double x, double y, int advanceFrame = 1);

	//Helper utility for splitting image into respective tiles
	PImage[] parseTileMap(PImage map, int rows, int cols);

	//Access to individual frames such that the user can do pixel level changes to a sprite's graphic
	PImage[] getFrames(); 

	//allows user to change the frames of an animation
	setFrames(PImage[] newFrames); 
}

/**
 * this interface is used to implement a callback method for applying an effect globally to a block of pixels
 */
interface graphicsEffect {

	// applies an effect to some Processing image (should this be PGraphics instead?)
	void apply(PImage buffer);

}

// a pre-written fade effect
class Fade implements graphicsEffect {}

