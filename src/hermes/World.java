package src.hermes;

import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Collection;
import java.util.ListIterator;

import src.hermes.postoffice.PostOffice;


/**
 * <p>The World defines a 'game state', it keeps track of all the Beings,
 * 	Groups, and their interaction. This is done through registration, HObjects and 
 * 	Interactors must be registered with the World in order to be drawn or updated.</p>
 * <p>The World is a <code>Thread</code>. When <code>start</code> is called, the World
 * will automatically update all registered objects and apply all Interactors between
 * them. This runs on the World's thread, which is separate from the Processing's draw
 * thread. This multithreading can be bypassed by not calling <code>start</code>,
 * and instead calling <code>update</code> within Processing's <code>draw</code> method.
 * By default to update rate is locked to 60Hz. You can change this, or unlock the rate,
 * by calling <code>lockUpdateRate</code> and <code>unlockUpdateRate</code>.</p>
 * <p>There are two basic ways of working with a World. One is to set up all of your
 * objects and Interactors outside of the World, and register them in Processing's <code>setup</code>.
 * The other is to create a subclass of World, declare many variables inside this class,
 * and override the empty World <code>setup</code> and <code>shutdown</code> methods. This allows for
 * more control as additional computations can be done in the <code>preUpdate</code> and <code>postUpdate</code>
 * methods, called by the thread before and after <code>update</code>, respectively.
 */
public class World extends Thread {
	
	private PostOffice _postOffice; //post office

	// these hold add and delete operations until the end of the update
	private LinkedList<Pair<HObject,GenericGroup<?,?>>> _addQueue;
	private LinkedList<Pair<HObject,GenericGroup<?,?>>> _removeQueue;
	private LinkedList<HObject> _removeFromAllGroupsQueue;
	
	private Group<Being> _masterGroup; //this is the group used by the camera
	private Group<Being> _updateGroup;
	
	private HCamera _camera; // the camera
	private Group<HCamera> _cameraGroup; // a Group with only one member: _camera (required to register an Interaction)
	private boolean _active = false; // whether the world is currently running - 
	
	@SuppressWarnings("rawtypes")
	private List<Interaction> _interactions; // used to hold all the interactions we need to check
	private LinkedList<GenericGroup<?,?>> _groupsToUpdate; //used to hold all the being groups to be updated individually
	
	private long _updateLength = 0;
	
	/**
	 * Instantiates the world with a PostOffice to handle I/O and a Camera to handle drawing.
	 * @param postOffice	the PostOffice that will handle mouse, keyboard and OSC I/O
	 * @param view			the camera that will be used for drawing
	 */
	@SuppressWarnings("rawtypes")
	public World(PostOffice postOffice, HCamera view) {
		
		assert postOffice != null : "World constructor: postOffice must be a valid PostOffice";
		assert view != null : "World constructor: camera must be a valid Camera";
		
		//set the World's PApplet to the one set in Hermes
		_postOffice = postOffice;
		_camera = view;
		
		_interactions = new LinkedList<Interaction>();
		_addQueue = new LinkedList<Pair<HObject,GenericGroup<?,?>>>();
		_removeQueue = new LinkedList<Pair<HObject,GenericGroup<?,?>>>();
		_removeFromAllGroupsQueue = new LinkedList<HObject>();
		_groupsToUpdate = new LinkedList<GenericGroup<?,?>>();
		
		_masterGroup = new Group<Being>(this);
		_updateGroup = new Group<Being>(this);
		
		//initialize the Camera
		registerBeing(_camera, true);
		_cameraGroup = new Group<HCamera>(this);//make _cameraGroup
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
	 * Tells the world to stop running.
	 * Use this to terminate the world (not the deprecated <code>stop</code> method).
	 */
	public void deActivate() {
		_active = false;
	}
	
	/**
	 * Registers a being with the world, making it be drawn when it is on camera,
	 *   its <code>update</code> method will be called by the loop if update is true.
	 * @param being		the being to register
	 * @param update	whether or not to update the being during the update loop
	 * @return 			the registered being
	 */
	public Being registerBeing(Being being, boolean update) {
		assert being != null : "World.registerBeing: being must be valid.";
		
		addToGroup(being, _masterGroup);
		if(update)
			addToGroup(being, _updateGroup);
		return being;
	}
	
	/**
	 * Queues an HObject to be added to a group at the end of the current update.
	 * @param object	the object to add
	 * @param group		the group to add the object to
	 */
	public void addToGroup(HObject object, GenericGroup<?,?> group) {
		_addQueue.addLast(new Pair<HObject,GenericGroup<?,?>>(object, group));
	}
	
	/**
	 * Queues an HObject to be removed from a group at the end of the current update.
	 * @param object		the object to remove
	 * @param group			the group to add the object to
	 */
	public void removeFromGroup(HObject object, GenericGroup<?,?> group) {
		_removeQueue.addLast(new Pair<HObject,GenericGroup<?,?>>(object, group));
	}
	
	/**
	 * Queues an HObject to be removed from all of the groups it is in at the end of the current update.
	 * @param object	the object to delete
	 */
	public void deleteFromGroups(HObject object) {
		_removeFromAllGroupsQueue.addLast(object);
	}
	
	/**
	 * resolves the add, remove, and delete queues, in that order
	 */
	private void resolveGroupQueues() {
		// resolve the add queue first
		for(Iterator<Pair<HObject,GenericGroup<?,?>>> iter = _addQueue.iterator(); iter.hasNext(); ) {
			Pair<HObject,GenericGroup<?,?>> pair = iter.next();
			pair.first.addToGroup(pair.second); // add being to the group
			iter.remove(); // remove the add from the queue
		}
		// resolve the remove queue 
		for(Iterator<Pair<HObject,GenericGroup<?,?>>> iter = _removeQueue.iterator(); iter.hasNext(); ) {
			Pair<HObject,GenericGroup<?,?>> pair = iter.next();
			pair.first.removeFromGroup(pair.second); // add being to the group
			iter.remove(); // remove from the queue
		}
		// resolve the removeFromAllGroups queue
		for(Iterator<HObject> iter = _removeFromAllGroupsQueue.iterator(); iter.hasNext(); ) {
			iter.next().delete(); // delete the being
			iter.remove(); // remove from the queue
		}
	}
	
	/**
	 * Register an interaction to be handled on the update loop.
	 * @param A					the first interacting group
	 * @param B					the second interacting group
	 * @param inter				the Interactor that detects and handles this interaction
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void registerInteraction(GenericGroup A, GenericGroup B, Interactor inter) {
		_interactions.add(new Interaction(A, B, inter, null));
	}
	
	/**
	 * Register an interaction to be handled on the update loop.
	 * @param A			the first interacting group
	 * @param B			the second interacting group
	 * @param inter		the Interactor that detects and handles this interaction
	 * @param optimizer	optimizer to use for the interaction
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public void registerInteraction(GenericGroup A, GenericGroup B, Interactor inter, Optimizer optimizer) {
		_interactions.add(new Interaction(A, B, inter, optimizer));
	}
	
	/**
	 * register an interaction between A and all objects in B
	 * @param A					an HObjects
	 * @param B					a group
	 * @param inter				the Interactor that detects and handles this interaction
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public void registerInteraction(HObject A, GenericGroup B, Interactor inter) {
		Group groupA = new Group(this);
		groupA.add(A);
		_interactions.add(new Interaction(groupA, B, inter, null));
	}
	
	/**
	 * register an interaction between B and all objects in A
	 * @param A					a group
	 * @param B					a being
	 * @param inter				the Interactor that detects and handles this interaction
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public void registerInteraction(GenericGroup A, HObject B, Interactor inter) {
		Group groupB = new Group(this);
		groupB.add(B);
		_interactions.add(new Interaction(A, groupB, inter, null));
	}
	
	/**
	 * Register an interaction between HOjbects A and B.
	 * @param A					the first object
	 * @param B					the second object
	 * @param inter				the interaction handler
	 * @param applyImmediate	whether to apply the interaction immediately
	 * 								upon detection or later
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public void registerInteraction(HObject A, HObject B, Interactor inter) {
		Group groupA = new Group(this);
		groupA.add(A);
		Group groupB = new Group(this);
		groupB.add(B);
		_interactions.add(new Interaction(groupA, groupB, inter, null));
	}
	
	/**
	 * register a group to have its update called in the update loop
	 * @param group		the group to update
	 */
	@SuppressWarnings("rawtypes")
	public void registerGroupUpdate(GenericGroup group) {
		_groupsToUpdate.add(group);
	}

	/**
	 * DO NOT CALL THIS METHOD. <br>
	 * This starts the update loop, but this should be done by calling <code>World.start</code> 
	 * 	instead, for threading purposes.
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
	 * Executes the update loop. Should only be called manually if <code>start</code> has not been called
	 * and threading is not desired.
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public void update() {

		long time = System.currentTimeMillis();
		
		// 1. handle the message queue from the post office
		_postOffice.checkMail();
		
		// 2. go through the registered groups and update them
		for(Iterator<GenericGroup<?,?>> iter = _groupsToUpdate.iterator(); iter.hasNext(); ) {
			GenericGroup group = iter.next();
			group.update();
		}
				
		// 3. apply being updates
		List<Being> unresolvedUpdates = updateHelper(_updateGroup.getObjects());
		
		// 4. go through the registered interactions in order
		LinkedList<DetectedInteraction> detectedInteractionsQ = new LinkedList<DetectedInteraction>();
		for(Iterator<Interaction> iter = _interactions.iterator(); iter.hasNext(); ) {
			Interaction interaction = iter.next();
			InteractionHandler handler = new InteractionHandler(interaction, detectedInteractionsQ);
			
			if(interaction.getA().equals(_cameraGroup)) {
				_camera.collisionsReset();
			} 
			
			Collection A = interaction.getA().getObjects();
			Collection B = interaction.getB().getObjects();			
			if(interaction.getOptimizer() == null) { // if this is a non-optimized interaction
				// perform the O(n^2) calculation on all the groups
				for(Iterator iterA = A.iterator(); iterA.hasNext(); ) {
					Being being1 = (Being)iterA.next();
					for(Iterator iterB = B.iterator(); iterB.hasNext(); ) {
						Being being2 = (Being)iterB.next();
						handler.interactionHandler(being1, being2);
					}
				} 
			} else { // if this is an optimized interaction
				Optimizer optimizer = interaction.getOptimizer();
				optimizer.detect(interaction.getA(), interaction.getB(), handler);
			}
			
			if(interaction.getA().equals(_cameraGroup)) {
				_camera.collisionsComplete();
			}
		}
		//handle all detected interactions here (for not immediate interactions)
		for(Iterator<DetectedInteraction> iter = detectedInteractionsQ.iterator(); iter.hasNext();) {
			DetectedInteraction di = iter.next();
			Interactor interactor = di.get_interactor();
			HObject being1 = di.get_being1();
			HObject being2 = di.get_being2();
			synchronized(being1) {
				synchronized(being2) {
					if(!interactor.handle(being1, being2))
							unresolvedInteractions.add(di);
				}
			}
		}
		
		// deal with anything unresolved
		while(!unresolvedInteractions.isEmpty() && !unresolvedUpdates.isEmpty()) {
			// perform updates
			unresolvedUpdates = updateHelper(unresolvedUpdates);
			// check for new interactions
			LinkedList<DetectedInteraction> newInteractions = new LinkedList<DetectedInteraction>();
			for(ListIterator<DetectedInteraction> iter = unresolvedInteractions.listIterator(); iter.hasNext(); ) {
				// go through all unresolved interactions
				DetectedInteraction inter = iter.next();
				GenericGroup groupA = inter.getInteraction().getA();
				GenericGroup groupB = inter.getInteraction().getB();
				HObject A = inter.get_being1();
				HObject B = inter.get_being2();
				// check A against all members of groupB for new interactions
				for(Iterator<Being> iterB = groupB.iterator(); iterB.hasNext(); ) {
					Being beingB = iterB.next();
					if(inter.get_interactor().detect(A, beingB)) // if we find a new one, add it
						newInteractions.add(new DetectedInteraction(A, beingB, inter.getInteraction()));
				}
				// check B against all members of groupA for new interactions
				for(Iterator<Being> iterA = groupA.iterator(); iterA.hasNext(); ) {
					Being beingA = iterA.next(); 
					if(inter.get_interactor().detect(beingA, B) && beingA != A)
						newInteractions.add(new DetectedInteraction(beingA, B, inter.getInteraction()));
				}
			}
			// try to resolve everything
			for(ListIterator<DetectedInteraction> iter = newInteractions.listIterator(); iter.hasNext(); ) {
				// go through all unresolved interactions
				DetectedInteraction inter = iter.next();
				HObject A = inter.get_being1();
				HObject B = inter.get_being2();
				// try to resolve the interaction
				if(inter.get_interactor().handle(A, B))
					iter.remove(); // if it is resolved, get rid of it
			}
			unresolvedInteractions = newInteractions;
		}
		
		resolveGroupQueues();
		
		long elapsed = System.currentTimeMillis() - time;
		if(elapsed < _updateLength) {
			try {
				sleep(_updateLength - elapsed);
			} catch (InterruptedException e) {}
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
	
	/**
	 *  Locks the update rate to happen no more than <code>rate</code> times per second.
	 *  Default value is 60Hz.
	 */
	public void lockUpdateRate(int rate) {
		assert rate > 0 : "World.lockUpdateRate: rate must be greater than zero";
		
		_updateLength = (long)(1.0f / ((float)rate) * 1000.0f);
	}

	/**
	 *  Unlocks the update rate (the rate is set to 60Hz by default). Being velocities are 
	 *  generally constant regardless of the update rate, BUT if the update can be calculated
	 *  quickly enough, objects may freeze because the update is faster than the smallest
	 *  unit of time the computer can record. Use with caution.
	 */
	public void unlockUpdateRate() {
		_updateLength = 0;
	}
	

	
}

	