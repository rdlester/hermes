package src.hermes;

import java.util.Collection;
import java.util.Iterator;
import src.hermes.postoffice.*;

/**
 * Defines a generic "group" of beings that wraps a collection of beings.
 * The primary purpose of grouping is to allow creation and removal of beings from updates
 * without threading issues. However, groups are also often used to store data about or provide
 * access to the contained beings. 
 * 
 * @author Sam
 *
 * @param <A>	the type of the beings in the group
 * @param <B>	the type of underlying collection used
 */
public class GenericGroup<A extends HObject, B extends Collection<A>> 
							implements KeySubscriber, MouseSubscriber, MouseWheelSubscriber, OscSubscriber {

	private B _objects;		// the underlying collection
	private World _world;	// the world containing the groups
	
	/**
	 * instantiates a group storing beings in a given collection
	 * 	@param beings	the collection beings will be stored in
	 */
	public GenericGroup(B objects, World world) {
		_objects = objects;
		_world = world;
	}
	
	/**
	 * returns the underlying collection containing all beings in the group
	 * WARNING -- DO NOT ADD TO OR REMOVE FROM THIS COLLECTION DIRECTLY DURING THE UPDATE LOOP
	 * @return	the beings
	 */
	public B getObjects() {
		return _objects;
	}
	
	/**
	 * an iterator over the underlying collection
	 * WARNING -- DO NOT REMOVE BEINGS USING Iterator.remove()
	 * @return	an iterator
	 */
	public Iterator<A> iterator() {
		return getObjects().iterator();
	}
	
	/**
	 * performs an update on the group
	 */
	public void update() {}

	/**
	 * adds a being to a group at the end of the next update loop
	 * @param being		the being to add
	 * @return			the added being
	 */
	public A add(A being) {
		_world.addToGroup(being, this);
		return being;
	}
	
	/**
	 * removes a being from the group at the end of the next update loop
	 * @param being		the being to remove
	 * @return			the removed being
	 */
	public A remove(A being) {
		_world.removeFromGroup(being, this);
		return being;
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
			_world.removeFromGroup(iter.next(), this);
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
