package src.hermes;

import java.util.Iterator;
import java.util.LinkedList;
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
	
	@SuppressWarnings("rawtypes")
	private List<Interaction> interactions;
	
	@SuppressWarnings("rawtypes")
	public World() {
		interactions = new LinkedList<Interaction>();
	}
	
	/**
	 * register an interaction to be handled on the update loop
	 * @param A					the first interacting group
	 * @param B					the second interacting group
	 * @param inter				the interaction handler
	 * @param applyImmediate	whether to apply the interaction immediately
	 * 								upon detection or later
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void registerInteraction(Collection A, Collection B, Interactor inter, 
			boolean applyImmediate) {
		interactions.add(new Interaction(A, B, inter, applyImmediate, null));
	}
	
	/**
	 * register an interaction to be handled on the update loop
	 * @param A			the first interacting group
	 * @param B			the second interacting group
	 * @param inter		the interaction handler
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public void registerInteraction(Collection A, Collection B, Interactor inter, 
			boolean applyImmediate, Optimizer optimizer) {
		interactions.add(new Interaction(A, B, inter, applyImmediate, optimizer));
	}

	/**
	 * runs the update loop
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public void run() {
		// go through the registered interaction in order
		for(Iterator<Interaction> iter = interactions.iterator(); iter.hasNext(); ) {
			Interaction interaction = iter.next();
			Collection A = interaction.getA();
			Collection B = interaction.getB();
			// perform the O(n^2) calculation on all the groups
			for(Iterator iterA = A.iterator(); iterA.hasNext(); ) {
				for(Iterator iterB = B.iterator(); iterB.hasNext(); ) {
					Being being1 = (Being)iterA.next();
					Being being2 = (Being)iterB.next();
					// see if an interaction was detected
					if(interaction.getInteractor().detect(being1, being2)) {
						// if so, handle it
						interaction.getInteractor().handle(being1, being2);
					}
				}
			}
		}
	}

	//Basic method to call to know if world is running or not
	public boolean getState() {
		return false;
	}

	//Called by God's draw method to
	public void draw() {}
	
	// locks the update rate to happen no more than once per interval (in seconds)
	public void lockUpdateRate(double interval) {}

	
	
}