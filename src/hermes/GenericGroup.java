package src.hermes;

import java.util.Collection;
import java.util.Iterator;
import src.hermes.postoffice.*;

/**
 * defines a generic "group" that wraps a collection of beings
 * @author Sam
 *
 * @param <A>	the type of the beings in the group
 * @param <B>	the type of underlying collection used
 */
public class GenericGroup<A extends Being, B extends Collection<A>> 
							implements KeySubscriber, MouseSubscriber, MouseWheelSubscriber, OscSubscriber {

	private B _beings;		// the underlying collection
	private World _world;	// the world containing the groups
	
	/**
	 * instantiates a group storing beings in a given collection
	 * 	@param beings	the collection beings will be stored in
	 */
	public GenericGroup(B beings, World world) {
		_beings = beings;
		_world = world;
	}
	
	/**
	 * returns the underlying collection containing all beings in the group
	 * WARNING -- DO NOT ADD TO OR REMOVE FROM THIS COLLECTION DIRECTLY DURING THE UPDATE LOOP
	 * @return	the beings
	 */
	public B getBeings() {
		return _beings;
	}
	
	/**
	 * an iterator over the underlying collection
	 * WARNING -- DO NOT REMOVE BEINGS USING Iterator.remove()
	 * @return	an iterator
	 */
	public Iterator<A> iterator() {
		return getBeings().iterator();
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
		_world.addBeing(being, this);
		return being;
	}
	
	/**
	 * removes a being from the group at the end of the next update loop
	 * @param being		the being to remove
	 * @return			the removed being
	 */
	public A remove(A being) {
		_world.removeBeing(being, this);
		return being;
	}
	
	/**
	 * adds the contents of another group to this group
	 * will always be O(n) regardless of the underlying collection
	 * @param group		the beings to add
	 */
	public void addAll(GenericGroup<A,?> group) {
		for(Iterator<A> iter = group.iterator(); iter.hasNext(); ) {
			_world.addBeing(iter.next(), this);
		}
	}
	
	/**
	 * removes the contents of a group from this group
	 * @param group		the beings to remove
	 */
	public void removeAll(GenericGroup<A,?> group) {
		for(Iterator<A> iter = group.iterator(); iter.hasNext(); ) {
			_world.removeBeing(iter.next(), this);
		}
	}
	
	/**
	 * clears everything from the group at the end of the update
	 * this will always be O(n), regardless of the underlying collection
	 */
	public void clear() {
		for(Iterator<A> iter = iterator(); iter.hasNext(); ){
			_world.removeBeing(iter.next(), this);
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
			_world.deleteBeing(iter.next());
		}
	}
	
	/**
	 * @return	the number of beings contained
	 */
	public int size() {
		return _beings.size();
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
/*
class BackedGroup<A extends Being> extends GenericGroup<A, Collection<A>>{

	public BackedGroup(Collection<A> beings) {
		super(beings);
	}
	
}*/