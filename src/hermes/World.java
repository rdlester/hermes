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

	// these hold add and delete operations until the end of the update
	private LinkedList<Pair<Being,Collection<Being>>> _addQueue;
	private LinkedList<Pair<Being,Collection<Being>>> _removeQueue;
	private LinkedList<Being> _deleteQueue;
	
	Camera _camera; // the camera
	
	@SuppressWarnings("rawtypes")
	private List<Interaction> _interactions; // used to hold all the interactions we need to check
	private List<Collection<Being>> _groupsToUpdate; //used to hold all the being groups to be updated individually
	
	@SuppressWarnings("rawtypes")
	public World() {
		_interactions = new LinkedList<Interaction>();
		_addQueue = new LinkedList<Pair<Being,Collection<Being>>>();
		_removeQueue = new LinkedList<Pair<Being,Collection<Being>>>();
		_deleteQueue = new LinkedList<Being>();
		_groupsToUpdate = new LinkedList<Collection<Being>>();
	}
	
	/**
	 * queues a being to be added to a group at the end of an update
	 * @param being		the being to add
	 * @param group		the group to add the being to
	 */
	public void addBeing(Being being, Collection<Being> group) {
		_addQueue.addLast(new Pair<Being,Collection<Being>>(being, group));
	}
	
	/**
	 * queues a being to be removed from a group at the end of an update
	 * @param being		the being to remove
	 * @param group		the group to add the being to
	 */
	public void removeBeing(Being being, Collection<Being> group) {
		_removeQueue.addLast(new Pair<Being,Collection<Being>>(being, group));
	}
	
	/**
	 * queues a being to be deleted (removed from all groups) at the end of an update
	 * @param being
	 */
	public void deleteBeing(Being being) {
		_deleteQueue.addLast(being);
	}
	
	/**
	 * resolves the add, remove, and delete queues, in that order
	 */
	private void resolveGroupQueues() {
		// resolve the add queue first
		for(Iterator<Pair<Being,Collection<Being>>> iter = _addQueue.iterator(); iter.hasNext(); ) {
			Pair<Being,Collection<Being>> pair = iter.next();
			pair.first.addToGroup(pair.second); // add being to the group
			iter.remove(); // remove the add from the queue
		}
		// resolve the remove queue 
		for(Iterator<Pair<Being,Collection<Being>>> iter = _removeQueue.iterator(); iter.hasNext(); ) {
			Pair<Being,Collection<Being>> pair = iter.next();
			pair.first.removeFromGroup(pair.second); // add being to the group
			iter.remove(); // remove from the queue
		}
		// resolve the delete queue
		for(Iterator<Being> iter = _deleteQueue.iterator(); iter.hasNext(); ) {
			iter.next().delete(); // delete the being
			iter.remove(); // remove from the queue
		}
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
		_interactions.add(new Interaction(A, B, inter, applyImmediate, null));
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
		_interactions.add(new Interaction(A, B, inter, applyImmediate, optimizer));
	}
	
	/**
	 * register a group to have all its beings updated in the loop
	 * @param grp		the group that contains the beings whose interactions
	 */
	public void registerUpdate(Collection<Being> grp) {
		_groupsToUpdate.add(grp);
	}

	/**
	 * runs the update loop
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public void run() {
		 // the update loop proceeds in 3 steps:
		
		// 1. handle the message queue from the post office
		// TODO: do this
		
		// 2. go through the registered interaction in order
		for(Iterator<Interaction> iter = _interactions.iterator(); iter.hasNext(); ) {
			Interaction interaction = iter.next();
			Collection A = interaction.getA();
			Collection B = interaction.getB();
			if(interaction.getOptimizer() == null) {
				// if this is a non-optimized interaction
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
			} else {
				// if this is an optimized interaction
				Optimizer optimizer = interaction.getOptimizer();
				if(optimizer.isDetectAll()) 
					optimizer.detectAll(interaction.getInteractor());
				else {
					for(Iterator iterA = A.iterator(); iterA.hasNext(); ) {
						optimizer.detect((Being)iterA.next(), interaction.getInteractor());
					}
				}
			}
		}
		
		// 3. go through the registered groups to update beings individually
		for(Iterator<Collection<Being>> iter = _groupsToUpdate.iterator(); iter.hasNext(); ) {
			Collection<Being> grp = iter.next();
			for(Iterator<Being> iterGrp = grp.iterator(); iterGrp.hasNext(); ) {
				Being bng = iterGrp.next();
				bng.update();
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
