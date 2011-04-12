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
	
	LinkedList<GenericGroup<?,?>> groups;
	Shape shape; 
	
	public Being() {
		groups = new LinkedList<GenericGroup<?,?>>();
	}
	
	/**
	 * draws the object to the screen
	 * takes a screen x and y coor
	 * the reason for this is that the being's internal x and y will be screen coordinates, not world coordinates
	 * there may be a better way to do this, with framebuffers, need to look in to this
	 */
	public abstract void draw(int x, int y);
	
	/**
	 * adds the being to the group
	 * @param group		the group to add to
	 */
	@SuppressWarnings("unchecked")
	public void addToGroup(GenericGroup<?,?> group) {
		// need to lock on the group
		synchronized(group) {
			((GenericGroup<Being,?>)group.getBeings()).add(this);
			groups.add(group);
		}
	}
	
	/**
	 * removes the being from this group
	 * @param group		the group to remove from
	 */
	public void removeFromGroup(GenericGroup group) {
		// need to lock on the group
		synchronized(group) {
			group.getBeings().remove(this);
			groups.remove(group);
		}
	}
	
	/**
	 * removes the being from all containing groups
	 */
	public void delete() {
		// go through all the groups, deleting this being
		for(Iterator<GenericGroup<?,?>> iter = groups.iterator(); iter.hasNext(); ) {
			GenericGroup<?,?> group = iter.next();
			// need to lock on the group
			synchronized(group) {
				group.getBeings().remove(this);
				iter.remove();
			}
		}
	}
	
	/**
	 * returns a being's shape
	 */
	public Shape getShape() {
		return shape;
	}
	
	public void update() {}
	

}
