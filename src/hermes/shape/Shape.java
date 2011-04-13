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
	
	protected PVector _position; 
	
	public Shape(PVector position) {
		_position = position;
	}
	                        
	public abstract boolean collide(Shape other);
	
	boolean between(float sample, float min, float max) {
		return sample >= min && sample <= max;
	}

	/**
	 * @return the shape's position
	 */
	public PVector getPosition() {
		return _position;
	}
	
}

