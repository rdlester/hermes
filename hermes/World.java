package hermes;

import hermes.postoffice.PostOffice;

import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Collection;



/**
 * <p>The World defines a 'game state': it keeps track of all the Beings,
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
	
	protected PostOffice _postOffice; //post office

	// these hold add and delete operations until the end of the update
	private LinkedList<Pair<HObject,GenericGroup<?,?>>> _addQueue;
	private LinkedList<Pair<HObject,GenericGroup<?,?>>> _removeQueue;
	private LinkedList<HObject> _removeFromAllGroupsQueue;
	
	private Group<Being> _masterGroup; //this is the group used by the camera
	private Group<Being> _updateGroup;
	
	protected HCamera _camera; // the camera
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
		register(_camera, true);
		_cameraGroup = new Group<HCamera>(this);//make _cameraGroup
		_cameraGroup.add(_camera);//add _camera to _cameraGroup
		//register an Interaction between _cameraGroup and _masterGroup
		this.register(_cameraGroup, _masterGroup, new CameraBeingInteractor());

		lockUpdateRate(60); // lock the update rate to 60 updates/sec by default
	}
	
	// Simplified constructors
	
	/**
	 * Constructor that automatically creates PostOffice and HCamera
	 */
	 public World() {
	   this(new PostOffice(), new HCamera());
	 }
	 
	 /**
	  * Constructor that automatically creates PostOffice
	  */
	 public World(HCamera view) {
	   this(new PostOffice(), view);
	 }
	 
	 /**
	  * Constructor that automatically creates PostOffice and HCamera, and sets up OSC
	  */
	  public World(int portIn, int portOut) {
	    this(new PostOffice(portIn, portOut), new HCamera());
	  }
	  
	  /**
	   * Constructor that automatically creates PostOffice and sets up OSC
	   */
	  public World(int portIn, int portOut, HCamera view) {
	    this(new PostOffice(portIn, portOut), view);
	  }
	  
	  /**
	   * Constructor that automatically creates HCamera
	   */
	  public World(PostOffice postOffice) {
	    this(postOffice, new HCamera());
	  }
	
	/**
	 * Returns true after <code>start()</code> has been called.
	 * @return	whether the world is currently running
	 */
	public boolean isActive() {
		return _active;
	}
	
	/**
	 * Tells the world to stop running.
	 * Use this to terminate the world (not the deprecated <code>stop</code> method).
	 */
	public void deactivate() {
		_active = false;
	}
	
	/**
	 * Registers a being with the world, making it be drawn when it is on camera,
	 *   its <code>update</code> method will be called by the loop if update is true.
	 * @param being		the being to register
	 * @param update	whether or not to update the being during the update loop
	 * @return 			the registered being
	 */
	public void register(Being being, boolean update) {
		assert being != null : "World.register: being must be valid.";
		
		addToGroup(being, _masterGroup);
		if(update) {
			addToGroup(being, _updateGroup);
		}
	}
	
	/**
	 * Shortcut for adding Being w/ update
	 * @param being   the being to register
	 */
	public void register(Being being) {
	  register(being, true);
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
	 * Resolves the add, remove, and delete queues, in that order.
	 */
	public void resolveGroupQueues() {
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
		  
		  HObject next = iter.next();
		  _postOffice.removeAllSubscriptions(next);
		  next.delete();
		  iter.remove();
		  /*
			iter.next().delete(); // delete the being
			iter.remove(); // remove from the queue
      */
		}
	}
	
	/**
	 * Register an interaction to be handled on the update loop.
	 * @param A					the first interacting group
	 * @param B					the second interacting group
	 * @param inter				the Interactor that detects and handles this interaction
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public void register(GenericGroup A, GenericGroup B, Interactor inter) {
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
	public void register(GenericGroup A, GenericGroup B, Interactor inter, Optimizer optimizer) {
		_interactions.add(new Interaction(A, B, inter, optimizer));
	}
	
	/**
	 * register an interaction between A and all objects in B
	 * @param A					an HObjects
	 * @param B					a group
	 * @param inter				the Interactor that detects and handles this interaction
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public void register(HObject A, GenericGroup B, Interactor inter) {
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
	public void register(GenericGroup A, HObject B, Interactor inter) {
		Group groupB = new Group(this);
		groupB.add(B);
		_interactions.add(new Interaction(A, groupB, inter, null));
	}
	
	/**
	 * Register an interaction between HOjbects A and B.
	 * @param A					the first object
	 * @param B					the second object
	 * @param inter				the interaction handler
	 * 								upon detection or later
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public void register(HObject A, HObject B, Interactor inter) {
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
	public void register(GenericGroup group) {
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
	 * Will be called once when the world is run, before the update loop.
	 */
	public void setup() {}
	
	/**
	 * Will be called once the world has finished running.
	 */
	public void shutdown() {}
	
	/**
	 * Will be executed on each loop before update is called.
	 */
	public void preUpdate() {}
	
	/**
	 * Will be executed on each loop after update is called.
	 */
	public void postUpdate() {}
	
	/**
	 * Executes the update loop. Should only be called manually if <code>start</code> has not been called
	 * and threading is not desired.
	 */
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public void update() {

		long time = System.currentTimeMillis();
		
		// 1. handle the message queue from the post office if post office is defined
		_postOffice.checkMail();
		  
		// 2. go through the registered interactions in order
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
					interactor.handle(being1, being2);
				}
			}
		}
		
		// 3. go through the registered groups and update them
		for(Iterator<GenericGroup<?,?>> iter = _groupsToUpdate.iterator(); iter.hasNext(); ) {
			GenericGroup group = iter.next();
			group.update();
		}
		
		resolveGroupQueues();
		
		// 4. apply being updates
		List<Being> unresolvedUpdates = updateHelper(_updateGroup.getObjects());
		
		// deal with anything unresolved
		while(!unresolvedUpdates.isEmpty()) {
	
			// handle unresolved interactions
			detectedInteractionsQ = new LinkedList<DetectedInteraction>();
			for(Iterator<Interaction> iter = _interactions.iterator(); iter.hasNext(); ) {
				Interaction interaction = iter.next();
				// we only do an interaction if we need to
				if(!interaction.getInteractor().multisampled() || 
						(!interaction.getA().hasNeedsMoreSamples() && !interaction.getB().hasNeedsMoreSamples()))
					continue;
				
				InteractionHandler handler = new InteractionHandler(interaction, detectedInteractionsQ);
				
				if(interaction.getOptimizer() == null) { // if this is a non-optimized interaction
					for(Iterator iterA = interaction.getA().getNeedsMoreSamples(); iterA.hasNext(); ) {
						HObject object1 = (HObject)iterA.next();
						if(!object1.needsMoreSamples()) {
							// if A is done updating, remove it
							iterA.remove();
							continue;
						}
						for(Iterator iterB = interaction.getB().iterator(); iterB.hasNext(); ) {
							HObject object2 = (HObject)iterB.next();
							handler.interactionHandler(object1, object2);
						}
					}
					for(Iterator iterB = interaction.getB().getNeedsMoreSamples(); iterB.hasNext(); ) {
						HObject object2 = (HObject)iterB.next();
						if(!object2.needsMoreSamples()) {
							// if A is done updating, remove it
							iterB.remove();
							continue;
						}
						for(Iterator iterA = interaction.getA().iterator(); iterA.hasNext(); ) {
							HObject object1 = (HObject)iterA.next();
							if(object1.needsMoreSamples()) // if obj1 is multisampled its already been checked with obj2
								continue;
							handler.interactionHandler(object1, object2);
						}
					}
				} else { // if this is an optimized interaction
					Optimizer optimizer = interaction.getOptimizer();
					optimizer.detect(interaction.getA(), interaction.getB(), handler);
				}
				
				//handle all detected interactions here (for not immediate interactions)
				for(Iterator<DetectedInteraction> diIter = detectedInteractionsQ.iterator(); diIter.hasNext();) {
					DetectedInteraction di = diIter.next();
					Interactor interactor = di.get_interactor();
					HObject being1 = di.get_being1();
					HObject being2 = di.get_being2();
					synchronized(being1) {
						synchronized(being2) {
							interactor.handle(being1, being2);
						}
					}
				}
				
			}
			
			resolveGroupQueues();
			
			// perform updates
			unresolvedUpdates = updateHelper(unresolvedUpdates);
			
		}
		
		// make sure there's nothing list in the needsMoreSamples lists
		for(Iterator<Interaction> iter = _interactions.iterator(); iter.hasNext(); ) {
			Interaction interaction = iter.next();
			// we only do an interaction if we need to
			if(interaction.getA().hasNeedsMoreSamples())
				interaction.getA().clearNeedsMoreSamples();
			if(interaction.getB().hasNeedsMoreSamples())
				interaction.getB().clearNeedsMoreSamples();
		}
		
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
	
	public void draw() {
		if(_active) {
			_camera.draw();
		}
	}
	
}

	