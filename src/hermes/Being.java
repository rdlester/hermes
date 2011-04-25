package src.hermes;

import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;
import java.util.Collection;

import src.hermes.shape.Rectangle;
import src.hermes.shape.Shape;
import processing.core.*;

/**
 * Basic game object class
 * Anything that is getting drawn or interacting with other game objects is a Being
 */
public abstract class Being {

	protected PVector _position; // the being's position
	protected PVector _velocity; // the being's velocity
	
	protected Shape _shape; 		 // the being's shape
	
	private LinkedList<GenericGroup<?,?>> groups;
	
	public Being() {
		groups = new LinkedList<GenericGroup<?,?>>();
	}
	
	/**
	 * draws the object to the screen
	 */
	public abstract void draw();
	
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
		return _shape;
	}
	
	public PVector getPosition() {
		return _position;
	}
	
	public void setPosition(PVector position) {
		_position = position;
	}
	
	public PVector getVelocity() {
		return _velocity;
	}
	
	public void setVelocity(PVector velocity) {
		_velocity = velocity;
	}

	
	public Rectangle getBoundingBox() {
		return _shape.getBoundingBox();
	}
	
	public void update() {}
	

}
