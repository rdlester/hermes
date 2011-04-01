package hermes;

import java.util.List;
import java.util.Collection;

/**
 * Defines a 'game state'
 * Examples include: Levels, menu screens
 * Subclassed by user to create individual worlds
 * User creates the necessary Beings, Interactors, and Optimizers in setup
 * The other functions are implemented by us; we handle the running and drawing of the world
 */
public abstract class World {

	List<Being> masterList;
	
	Camera camera;
	
	//Setup loop
	//Written by user
	abstract void setup();

	void registerEnvironment(Environment environment) {}

	void registerInteraction(Collection A, Collection B, Interactor inter) {}
	void registerInteraction(Collection A, Collection B, Interactor inter, Optimizer optimizer) {}

	//Creates a new thread and runs the update loop in it
	void run() {}

	//Basic method to call to know if world is running or not
	boolean getState() {
		return false;
	}

	//Called by God's draw method to
	void draw() {}
	
	// locks the update rate to happen no more than once per interval (in seconds)
	void lockUpdateRate(double interval) {}

}