package src.hermes.hshape;

import processing.core.*;

/**
 * An abstraction for a 2D shape, used for collision detection and response. 
 * When the shape is linked to a being, position should be a reference to the being's position.
 * In order for collision to work, all shapes must know how to collide with all other shapes.
 *
 */
public abstract class HShape {
	
	protected PVector _position; // the shape's position
		// all points in the shape are defined relative to the position
		// when a shape represents a Being's collision area, 
		// 	this should be a reference to the Being's position
	
	/**
	 * Creates a new shape
	 * @param position  the shape's position
	 * When the shape represents a Being's collision area, the shape's position should reference the being's position.
	 */
	protected HShape(PVector position) {
		assert position != null : "In HShape constructor: position must be a valid PVector";
		
		_position = position;
	}
	
	/**
	 * Detects a collision with another shape
	 * @param other		the shape to collide with
	 * @return			whether the shapes have collided
	 */
	public boolean collide(HShape other) {
		assert other != null : "HShape.collide: other must be a valid HShape";
		return projectionVector(other) != null;
	}

	/**
	 * Finds the projection vector for a collision with another shape. 
	 * The projection vector is the vector by which one body could be displaced such that
	 *  it no longer intersects the other body, by the shortest possible distance.
	 * @param other		the shape to collide with
	 * @return			the projection vector from this body to other, or null if they aren't colliding
	 */
	public abstract PVector projectionVector(HShape other);
	public abstract PVector projectionVector(Rectangle other);
	public abstract PVector projectionVector(Circle other);
	public abstract PVector projectionVector(Polygon other);
	
	/**
	 * whether the Shape contains the given point coordinates (boundary is inclusive)
	 * @param point     the point vector
	 * @return          true if (x,y) lies within the Shape
	 */
	public abstract boolean contains(PVector point);
	
	/**
	 * whether the Shape contains the given point coordinates (boundary is inclusive)
	 * @param x         the x coordinate
	 * @param y         the y coordinate
	 * @return          true if (x,y) lies within the Shape
	 */
	public abstract boolean contains(float x, float y);
	
	/**
	 * finds the smallest Rectangle that encloses the shape
	 * @return	the bounding box
	 */
	public abstract Rectangle getBoundingBox();
	
	/**
	 * Returns the shape's position. 
	 * Note, this is a reference, if you change this vector it will move the shape.
	 * @return the shape's position
	 */
	public PVector getPosition() {
		return _position;
	}
	
	/**
	 * Shortcut method for drawing the shape on screen
	 */
	public abstract void draw();
	
}

