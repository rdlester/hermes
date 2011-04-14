package src.hermes.shape;

import processing.core.*;

/**
 * an abstraction for shape, used for collision detection and response
 * when the shape is linked to a being, position should point to the being's position
 * in order for collision to work, all shapes must know how to collide with all other shapes
 * 
 * @author Sam
 *
 */
public abstract class Shape {
	
	protected PVector _position; // the shape's position
		// all points in the shape are defined relative to the position
	
	/**
	 * creates a new shape
	 * @param position  the shape's position
	 * when position is attached to a being, the shape's position should reference the being's position
	 */
	protected Shape(PVector position) {
		assert position != null : "In Shape constructor: position must be a valid PVector";
		
		_position = position;
	}
	
	/**
	 * detects a collision with another shape
	 * @param other		the shape to collide with
	 * @return			whether the shapes have collided
	 */
	public abstract boolean collide(Shape other);

	/**
	 * @return the shape's position
	 */
	public PVector getPosition() {
		return _position;
	}
	
}

