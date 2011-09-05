package src.hermes;

import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedList;

import src.hermes.postoffice.*;

/**
 * Defines a generic "group" of beings that wraps a collection of <code>HObject</code>s.
 * Interactions are registered with the world between groups. Objects can be added to or removed
 * from groups while the loop is running, but these operations will not be applied until the
 * end of the current update.
 * <p>
 * The primary purpose of grouping is to allow addition and removal of objects from updates
 * without threading issues. However, groups can also be used to store data about or provide
 * access to the contained objects.
 *
 * @param <A>	the type of the objects in the group
 * @param <B>	the type of underlying collection used
 */
public class GenericGroup<A extends HObject, B extends Collection<A>> 
							implements KeySubscriber, MouseSubscriber, MouseWheelSubscriber, OscSubscriber {

	private B _objects;		// the underlying collection
	private World _world;	// the world containing the groups
	private LinkedList<A> _needsMoreSamples;	// keeps track of any beings that need 
													// more samples this update
	
	/**
	 * Instantiates a group storing object in a given collection.
	 * 	@param objects	the collection objects will be stored in
	 *  @param world	the world where the group will be used
	 */
	public GenericGroup(B objects, World world) {
		_objects = objects;
		_world = world;
		_needsMoreSamples = new LinkedList<A>();
	}
	
	/**
	 * Returns the underlying collection containing all objects in the group.
	 * WARNING -- DO NOT ADD TO OR REMOVE FROM THIS COLLECTION DIRECTLY
	 * @return	the data structure containing all objects in the group
	 */
	public B getObjects() {
		return _objects;
	}
	
	/**
	 * An iterator over the underlying collection.
	 * WARNING -- DO NOT REMOVE BEINGS USING Iterator.remove()
	 * @return	an iterator over all elements in the group
	 */
	public Iterator<A> iterator() {
		return getObjects().iterator();
	}
	
	/**
	 * Performs an update on the group. Override to use.
	 */
	public void update() {}

	/**
	 * Adds an object to a group at the end of the next update loop.
	 * @param object	the object to add
	 * @return			the added object
	 */
	public A add(A being) {
		_world.addToGroup(being, this);
		return being;
	}
	
	/**
	 * Removes a object from the group at the end of the next update loop.
	 * @param object	the object to remove
	 * @return			the removed object
	 */
	public A remove(A object) {
		_world.removeFromGroup(object, this);
		if(hasNeedsMoreSamples() && object.needsMoreSamples()) {
			_needsMoreSamples.remove(object);
		}
		return object;
	}
	
	/**
	 * adds the contents of another group to this group
	 * will always be O(n) regardless of the underlying collection
	 * @param group		the beings to add
	 */
	public void addAll(GenericGroup<A,?> group) {
		for(Iterator<A> iter = group.iterator(); iter.hasNext(); ) {
			_world.addToGroup(iter.next(), this);
		}
	}
	
	/**
	 * removes the contents of a group from this group
	 * @param group		the beings to remove
	 */
	public void removeAll(GenericGroup<A,?> group) {
		for(Iterator<A> iter = group.iterator(); iter.hasNext(); ) {
			A object = iter.next();
			if(hasNeedsMoreSamples() && object.needsMoreSamples()) {
				_needsMoreSamples.remove(object);
			}
			_world.removeFromGroup(object, this);
		}
	}
	
	/**
	 * clears everything from the group at the end of the update
	 * this will always be O(n), regardless of the underlying collection
	 */
	public void clear() {
		for(Iterator<A> iter = iterator(); iter.hasNext(); ){
			_world.removeFromGroup(iter.next(), this);
		}
		_needsMoreSamples.clear();
	}
	
	/**
	 * deletes everything in the group from the world at the end of the update
	 * note: this means the group and its beings are totally destroyed!
	 * they will be removed from any other groups they are in
	 * this will always be O(n), regardless of the underlying collection
	 */
	public void destroy() {
		for(Iterator<A> iter = iterator(); iter.hasNext(); ) {
			_world.deleteFromGroups(iter.next());
		}
		_needsMoreSamples.clear();
	}
	
	/**
	 * @return	the number of beings contained
	 */
	public int size() {
		return _objects.size();
	}
	
	public void setWorld(World world) {
		this._world = world;
	}

	public World getWorld() {
		return _world;
	}

	void addNeedsMoreSamples(A object) {
		_needsMoreSamples.addLast(object);
	}
	
	Iterator<A> getNeedsMoreSamples() {
		return _needsMoreSamples.iterator();
	}
	
	/**
	 * Whether the group contains objects that need more samples on this update.
	 * @return	true if objects within the group need more samples, false if no objects do
	 */
	public boolean hasNeedsMoreSamples() {
		return !_needsMoreSamples.isEmpty();
	}
	
	void clearNeedsMoreSamples() {
		_needsMoreSamples.clear();
	}
	
	//Methods for receiving methods from PostOffice, defined in subscriber interfaces
	//Left blank here, must be overrided by user to add functionality
	public void handleOscMessage(OscMessage m) {
		//VOID
	}

	public void handleMouseWheelMessage(MouseWheelMessage m) {
		//VOID
	}

	public void handleMouseMessage(MouseMessage m) {
		//VOID
	}

	public void handleKeyMessage(KeyMessage m) {
		//VOID
	}
	
}
