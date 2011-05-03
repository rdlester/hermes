package src.hermes;

import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Collection;
import java.util.ListIterator;

import processing.core.*;
import src.hermes.postoffice.PostOffice;


/**
 * Defines a 'game state'
 * Examples include: Levels, menu screens
 * Subclassed by user to create individual worlds
 * User creates the necessary Beings, Interactors, and Optimizers in setup
 * The other functions are implemented by us; we handle the running and drawing of the world
 */
public class World extends Thread {
	
	private PApplet _parentApplet; //active PApplet sketch
	private PostOffice _postOffice; //post office

	// these hold add and delete operations until the end of the update
	private LinkedList<Pair<Being,GenericGroup<?,?>>> _addQueue;
	private LinkedList<Pair<Being,GenericGroup<?,?>>> _removeQueue;
	private LinkedList<Being> _removeFromAllGroupsQueue;
	
	private Group<Being> _masterGroup; //this is the group used by the camera
	private Group<Being> _updateGroup;
	
	private Camera _camera; // the camera
	private Group<Camera> _cameraGroup; // a Group with only one member: _camera (required to register an Interaction)
	private boolean _active = false; // whether the world is currently running - 
	
	@SuppressWarnings("rawtypes")
	private List<Interaction> _interactions; // used to hold all the interactions we need to check
	private LinkedList<GenericGroup<?,?>> _groupsToUpdate; //used to hold all the being groups to be updated individually
	
	private long _updateLength = 0;
	
	@SuppressWarnings("rawtypes")
	public World(PostOffice postOffice, Camera view) {
		
		assert postOffice != null : "World constructor: postOffice must be a valid PostOffice";
		assert view != null : "World constructor: camera must be a valid Camera";
		
		//set the World's PApplet to the one set in Hermes
		_parentApplet = Hermes.getPApplet();
		_postOffice = postOffice;
		_camera = view;
		
		_interactions = new LinkedList<Interaction>();
		_addQueue = new LinkedList<Pair<Being,GenericGroup<?,?>>>();
		_removeQueue = new LinkedList<Pair<Being,GenericGroup<?,?>>>();
		_removeFromAllGroupsQueue = new LinkedList<Being>();
		_groupsToUpdate = new LinkedList<GenericGroup<?,?>>();
		
		_masterGroup = new Group<Being>(this);
		_updateGroup = new Group<Being>(this);
		
		//initialize the Camera
		registerBeing(view, false);
		_cameraGroup = new Group<Camera>(this);//make _cameraGroup
		_cameraGroup.add(_camera);//add _camera to _cameraGroup
		//register an Interaction between _cameraGroup and _masterGroup
		this.registerInteraction(_cameraGroup, _masterGroup, new CameraBeingInteractor(), true);

		lockUpdateRate(60); // lock the update rate to 60 updates/sec by default
	}
	
	/**
	 * @return	whether the world is currently running
	 */
	public boolean isActive() {
		return _active;
	}
	
	/**
	 * tells the world to stop running
	 * you should always use this to terminate the world (not world.stop(),
	 *	which is inherited from Thread)
	 */
	public void deActivate() {
		_active = false;
	}

	/**
	 * registers a being with the world, making it be drawn when it is on camera,
	 *   its update() method will be called by the loop if update is true
	 * @param being		the being to register
	 * @param update	whether or not to update the being during the update loop
	 * @return 			the registered being
	 */
	public Being registerBeing(Being being, boolean update) {
		addBeing(being, _masterGroup);
		if(update)
			addBeing(being, _updateGroup);
		return being;
	}
	
	/**
	 * queues a being to be added to a group at the end of an update
	 * @param being		the being to add
	 * @param group		the group to add the being to
	 */
	public void addBeing(Being being, GenericGroup<?,?> group) {
		_addQueue.addLast(new Pair<Being,GenericGroup<?,?>>(being, group));
	}
	
	/**
	 * queues a being to be removed from a group at the end of an update
	 * @param being		the being to remove
	 * @param group		the group to add the being to
	 */
	public void removeBeing(Being being, GenericGroup<?,?> group) {
		_removeQueue.addLast(new Pair<Being,GenericGroup<?,?>>(being, group));
	}
	
	/**
	 * queues a being to be removed from all of the groups it is in at the end of an update
	 * @param being
	 */
	public void removeBeingFromAllGroups(Being being) {
		_removeFromAllGroupsQueue.addLast(being);
	}
	
	/**
	 * resolves the add, remove, and delete queues, in that order
	 */
	private void resolveGroupQueues() {
		// resolve the add queue first
		for(Iterator<Pair<Being,GenericGroup<?,?>>> iter = _addQueue.iterator(); iter.hasNext(); ) {
			Pair<Being,GenericGroup<?,?>> pair = iter.next();
			pair.first.addToGroup(pair.second); // add being to the group
			iter.remove(); // remove the add from the queue
		}
		// resolve the remove queue 
		for(Iterator<Pair<Being,GenericGroup<?,?>>> iter = _removeQueue.iterator(); iter.hasNext(); ) {
			Pair<Being,GenericGroup<?,?>> pair = iter.next();
			pair.first.removeFromGroup(pair.second); // add being to the group
			iter.remove(); // remove from the queue
		}
		// resolve the removeFromAllGroups queue
		for(Iterator<Being> iter = _removeFromAllGroupsQueue.iterator(); iter.hasNext(); ) {
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
	public void registerInteraction(GenericGroup A, GenericGroup B, Interactor inter, 
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
	public void registerInteraction(GenericGroup A, GenericGroup B, Interactor inter, 
			boolean applyImmediate, Optimizer optimizer) {
		_interactions.add(new Interaction(A, B, inter, applyImmediate, optimizer));
	}
	
	/**
	 * register a group to have all its beings updated in the loop
	 * @param grp		the group that contains the beings whose interactions
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public void registerGroupUpdate(GenericGroup grp) {
		_groupsToUpdate.add(grp);
	}

	/**
	 * runs the update loop
	 */
	public void run() {
		setup();
		resolveGroupQueues();
		_active = true;
		while(_active) {
			preUpdate();
			update();
			postUpdate();
		}
		shutdown();
	}
	
	/**
	 * will be called once when the world is run, before the update loop
	 */
	public void setup() {}
	
	/**
	 * will be called once the world has finished running
	 */
	public void shutdown() {}
	
	/**
	 * will be executed on each loop before update is called
	 */
	public void preUpdate() {}
	
	/**
	 * will be executed on each loop after update is called
	 */
	public void postUpdate() {}
	
	/**
	 * executes the update loop
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public void update() {

		long time = System.currentTimeMillis();
		
		// 1. handle the message queue from the post office
		_postOffice.checkMail();
		
		// 2. go through the registered groups to update beings individually
		for(Iterator<GenericGroup<?,?>> iter = _groupsToUpdate.iterator(); iter.hasNext(); ) {
			GenericGroup group = iter.next();
			group.update();
		}
		
		LinkedList<DetectedInteraction> unresolvedInteractions = new LinkedList<DetectedInteraction>();
				
		// 3. apply being updates
		List<Being> unresolvedUpdates = updateHelper(_updateGroup.getBeings());
		
		// 3. go through the registered interactions in order
		LinkedList<DetectedInteraction> detectedInteractionsQ = new LinkedList<DetectedInteraction>();
		for(Iterator<Interaction> iter = _interactions.iterator(); iter.hasNext(); ) {
			Interaction interaction = iter.next();
			
			if(interaction.getA().equals(_cameraGroup)) {
				_camera.collisionsReset();
			} 
			
			Collection A = interaction.getA().getBeings();
			Collection B = interaction.getB().getBeings();			
			if(interaction.getOptimizer() == null) { // if this is a non-optimized interaction
				// perform the O(n^2) calculation on all the groups
				for(Iterator iterA = A.iterator(); iterA.hasNext(); ) {
					Being being1 = (Being)iterA.next();
					for(Iterator iterB = B.iterator(); iterB.hasNext(); ) {
						Being being2 = (Being)iterB.next();
						this.interactionHelper(being1, being2, interaction, detectedInteractionsQ);
					}
				} 
			} else { // if this is an optimized interaction
				Optimizer optimizer = interaction.getOptimizer();
				if(optimizer.isDetectAll()) { //get back all pairs of interacting beings
					for(Iterator<Pair> iterPairs = optimizer.detectAll(interaction.getInteractor()); iterPairs.hasNext(); ) {
						Pair p = iterPairs.next();
						Being being1 = (Being)p.getFirst();
						Being being2 = (Being)p.getSecond();
						this.interactionHelper(being1, being2, interaction, detectedInteractionsQ);
					}
				} else { //run through all beings in group A, get back all relevant members in group B
					for(Iterator iterA = A.iterator(); iterA.hasNext(); ) {
						Being being1 = (Being)iterA.next();
						for(Iterator iterB = optimizer.detect(being1, interaction.getInteractor()); iterB.hasNext(); ) {
							Being being2 = (Being)iterB.next();
							this.interactionHelper(being1, being2, interaction, detectedInteractionsQ);
						}
					}
				}
			}
			
			if(interaction.getA().equals(_cameraGroup)) {
				_camera.collisionsComplete();
			}
		}
		//handle all detected interactions here (for not immediate interactions)
		for(Iterator<DetectedInteraction> iter = detectedInteractionsQ.iterator(); iter.hasNext();) {
			DetectedInteraction di = iter.next();
			Interactor interactor = di.get_interactor();
			Being being1 = di.get_being1();
			Being being2 = di.get_being2();
			synchronized(being1) {
				synchronized(being2) {
					if(!interactor.handle(being1, being2))
							unresolvedInteractions.add(di);
				}
			}
		}
		
		// deal with anything unresolved
		while(!unresolvedInteractions.isEmpty() && !unresolvedUpdates.isEmpty()) {
			// TODO: deal with optimization
			// perform updates
			unresolvedUpdates = updateHelper(unresolvedUpdates);
			// check for new interactions
			for(ListIterator<DetectedInteraction> iter = unresolvedInteractions.listIterator(); iter.hasNext(); ) {
				// go through all unresolved interactions
				DetectedInteraction inter = iter.next();
				GenericGroup groupA = inter.getInteraction().getA();
				GenericGroup groupB = inter.getInteraction().getB();
				Being A = inter.get_being1();
				Being B = inter.get_being2();
				// check A against all members of groupB for new interactions
				for(Iterator<Being> iterB = groupB.iterator(); iterB.hasNext(); ) {
					Being beingB = iterB.next();
					if(inter.get_interactor().detect(A, beingB)) // if we find a new one, add it
						iter.add(new DetectedInteraction(A, beingB, inter.getInteraction()));
				}
				// check B against all members of groupA for new interactions
				for(Iterator<Being> iterA = groupA.iterator(); iterA.hasNext(); ) {
					Being beingA = iterA.next(); 
					if(inter.get_interactor().detect(B, beingA))
						iter.add(new DetectedInteraction(B, beingA, inter.getInteraction()));
				}
			}
			// try to resolve everything
			for(ListIterator<DetectedInteraction> iter = unresolvedInteractions.listIterator(); iter.hasNext(); ) {
				// go through all unresolved interactions
				DetectedInteraction inter = iter.next();
				GenericGroup groupA = inter.getInteraction().getA();
				GenericGroup groupB = inter.getInteraction().getB();
				Being A = inter.get_being1();
				Being B = inter.get_being2();
				// try to resolve the interaction
				if(inter.get_interactor().handle(A, B))
					iter.remove(); // if it is resolved, get rid of it
			}
		}
		
		resolveGroupQueues();
		
		long elapsed = System.currentTimeMillis() - time;
		if(elapsed < _updateLength) {
			try {
				sleep(_updateLength - elapsed);
			} catch (InterruptedException e) {}
		}

	}
	
	/**
	 * checks if an interaction is detected between being1 and being2; if the interaciton
	 * is immediate, synchronizes on the beings and handles the interaction, otherwise
	 * adds a new DetectedInteraction object to the detectedInteractionsQ
	 * @param being1				the first interacting Being
	 * @param being2				the second interacting Being
	 * @param interaction			the interaction to detect, handle
	 * @param detectedInteractionsQ	the aggregation of all detected interactions to be handled
	 * 								later
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	private void interactionHelper(Being being1, Being being2, Interaction interaction, 
			LinkedList<DetectedInteraction> detectedInteractionsQ) {
		// see if an interaction was detected
		if(being1 != being2 && interaction.getInteractor().detect(being1, being2)) {
			if(interaction.isImmediate()) { // if immediate, handle it now
					synchronized(being1) {
						synchronized(being2) {
							interaction.getInteractor().handle(being1, being2);
						}
					}
			} else {//if not immediate, queue detection to handle later
				detectedInteractionsQ.add(new DetectedInteraction<Being, Being>(being1, being2, interaction));
			}
		}
	}

	private List<Being> updateHelper(List<Being> beings) {
		LinkedList<Being> unresolvedUpdates = new LinkedList<Being>();
		for(Iterator<Being> iter = beings.iterator(); iter.hasNext(); ) {
			// iterate through the beings
			Being being = iter.next();
			// apply the update
			synchronized(being) {
				if(!being.processUpdate()) {
					// if the update is unresolved, add it to the unresolved queue
					unresolvedUpdates.add(being);
				}
			}
		}
		return unresolvedUpdates;
	}
	
	//Called by God's draw method to
	public void draw() {}
	
	// locks the update rate to happen no more than rate times per second
	public void lockUpdateRate(int rate) {
		assert rate > 0 : "World.lockUpdateRate: rate must be greater than zero";
		
		_updateLength = (long)(1.0f / ((float)rate) * 1000.0f);
	}

	// unlocks the update rate (the rate is set to 60 by default)
	public void unlockUpdateRate() {
		_updateLength = 0;
	}
	
	//to be used in the _detectedInteractions queue
	private class DetectedInteraction<A extends Being, B extends Being> {
		A _being1;
		B _being2;
		Interaction<A, B> _interaction;
		
		DetectedInteraction(A b1, B b2, Interaction<A,B> interaction) {
			_being1 =b1;
			_being2 =b2;
			_interaction = interaction;
		}
		
		public A get_being1() {
			return _being1;
		}
		public B get_being2() {
			return _being2;
		}
		public Interactor<A, B> get_interactor() {
			return _interaction.getInteractor();
		}
		
		public Interaction<A,B> getInteraction() {
			return _interaction;
		}
	}
	
	
}

	