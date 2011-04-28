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
	
	private boolean _done = true;
	protected long _time;
	
	private LinkedList<GenericGroup<?,?>> _groups;
	
	public Being(Shape shape, PVector velocity) {
		assert shape != null : "Being constructor: shape must be a valid Shape";
		assert velocity != null : "Being constructor: velocity must be a valid PVector";
		
		_groups = new LinkedList<GenericGroup<?,?>>();
		_shape = shape;
		_position = shape.getPosition();
		_velocity = velocity;
		_time = System.nanoTime();
	}
	
	protected long updateTime() { 
		long time = System.nanoTime();
		long elapsed = time - _time;
		_time = time;
		return elapsed;
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
	protected void addToGroup(GenericGroup group) {
		// need to lock on the group
		synchronized(group) {
			group.getBeings().add(this);
			_groups.add(group);
		}
	}
	
	/**
	 * removes the being from this group
	 * @param group		the group to remove from
	 */
	protected void removeFromGroup(GenericGroup group) {
		// need to lock on the group
		synchronized(group) {
			group.getBeings().remove(this);
			_groups.remove(group);
		}
	}
	
	/**
	 * removes the being from all containing groups
	 */
	protected void delete() {
		// go through all the groups, deleting this being
		for(Iterator<GenericGroup<?,?>> iter = _groups.iterator(); iter.hasNext(); ) {
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
	
	protected void setDone(boolean done) {
		_done = done;
	}
	
	public boolean processUpdate() {
		if(_done)
			update();
		setDone(true);
		step();
		return _done;
	}
	
	public void update() {}
	
	protected void step() {
		double elapsed = (double)updateTime();
		EulerIntegratePosition(elapsed/1e9);
	}
	
	protected void EulerIntegratePosition(double dt) {
		_position.add(PVector.mult(_velocity, (float)dt));
	}
	
}
