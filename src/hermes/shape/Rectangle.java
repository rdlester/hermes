package src.hermes.shape;

import processing.core.PVector;

/**
 * represents an axis-aligned bounding rectangle
 * @author Sam
 *
 */
public class Rectangle extends Shape {

	private PVector _min, _max;
	
	/**
	 * creates a new Rectangle defined by a position and two point coordinates
	 * note that position, min and max will be stored as references, so changing them later will change the rectangle
	 * @param position	the position of the rectangle
	 * @param min		the position of the corner with the lowest x,y values
	 * @param max		the position of the corner with the highest x,y values
	 */
	public Rectangle(PVector position, PVector min, PVector max) {
		super(position);
		
		assert min != null : "In Rectangle constructor: min must be a valid PVector";
		assert max != null : "In Rectangle constructor: max must be a valid PVector";
		assert min.x < max.x && min.y < max.y : "In Rectangle contructor: min must have a lower x,y position than max";
			
		_min = min; 
		_max = max;
	}
	
	/**
	 * creates a Rectangle defined by a position, representing its center, and a width a height
	 * note: position will be stored as a reference, so changing it will move the rectangle
	 * @param position	the center position of the rectangle
	 * @param width		the width of the rectangle
	 * @param height	the height of the rectangle
	 */
	public Rectangle(PVector position, float width, float height) {
		super(position);
		_min = new PVector(-width / 2, -height / 2);
		_max = new PVector(width / 2, height / 2);
	}
	
	/**
	 * Getter for position of corner with lowest x,y values
	 * @return
	 */
	public PVector getMin() {
		return _min;
	}
	
	/**
	 * Getter for position of corner with highest x,y values
	 * @return
	 */
	public PVector getMax() {
		return _max;
	}
	/**
	 * scales the rectangle's width and height about its position
	 * @param xScale	the x-axis scale factor
	 * @param yScale	the y-axis scale factor
	 */
	public void scale(float xScale, float yScale) {
		assert xScale > 0 : "scale: xScale must be greater than zero";
		assert yScale > 0 : "scale: yScale must be greater than zero";
		
		_min.x *= xScale;
		_max.x *= xScale;
		_min.y *= yScale;
		_min.y *= yScale;
	}
	
	/**
	 * general collision of a rectangle with another shape for double dispatch
	 */
	@Override
	public boolean collide(Shape other) {
		return other.collide(this);
	}
	
	/**
	 * rectangle-rectangle collision
	 * @param other		the rectangle to be collided with
	 * @return			whether there was a collision
	 */
	public boolean collide(Rectangle other) {
		// calculate the absolute corner positions
		PVector min1 = PVector.add(_position, _min);
		PVector max1 = PVector.add(_position, _max);
		PVector min2 = PVector.add(other._position, other._min);
		PVector max2 = PVector.add(other._position, other._max);
		// calculate the distance between farthest-out points
		float xDist = Math.max(Math.abs(max1.x - min2.x), Math.abs(max2.x - min1.x)); 
		float yDist = Math.max(Math.abs(max1.y - min2.y), Math.abs(max2.y - min1.y)); 
		// they collide if they overlap on both axes
		boolean xOverlap = xDist <= max1.x - min1.x + max2.x - min2.x;
		boolean yOverlap = yDist <= max1.y - min1.y + max2.y - min2.y;
		return xOverlap && yOverlap;
	}
	

}
