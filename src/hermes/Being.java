package src.hermes;

import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Collection;


/**
 * Basic game object class
 * Anything that is getting drawn or interacting with other game objects is a Being
 */
public abstract class Being {

	public abstract float getX();
	public abstract float getY();
	public abstract float getZ();

	public Being() {
		groups = new LinkedList<Collection<Being>>();
	}
	
	/**
	 * draws the object to the screen
	 * takes a screen x and y coor
	 * the reason for this is that the being's internal x and y will be screen coordinates, not world coordinates
	 * there may be a better way to do this, with framebuffers, need to look in to this
	 */
	public abstract void draw(int x, int y);
	
	List<Collection<Being>> groups;
	Shape shape; 
	
	/**
	 * adds the being to the group
	 * @param group		the group to add to
	 */
	public void addToGroup(Collection<Being> group) {
		// need to lock on the group
		synchronized(group) {
			group.add(this);
			groups.add(group);
		}
	}
	
	/**
	 * removes the being from this group
	 * @param group		the group to remove from
	 */
	public void removeFromGroup(Collection<Being> group) {
		// need to lock on the group
		synchronized(group) {
			group.remove(this);
			groups.remove(group);
		}
	}
	
	/**
	 * removes the being from all containing groups
	 */
	public void delete() {
		// go through all the groups, deleting this being
		for(Iterator<Collection<Being>> iter = groups.iterator(); iter.hasNext(); ) {
			Collection<Being> group = iter.next();
			// need to lock on the group
			synchronized(group) {
				group.remove(this);
				iter.remove();
			}
		}
	}
	
	public void update() {}
	

}
