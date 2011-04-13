package src.hermes.shape;

import processing.core.PVector;

public class Rectangle extends Shape {

	PVector _min, _max;
	
	/**
	 * creates a new Rectangle defined by a position and two coordinates
	 * @param position	the position of the rectangle
	 * @param min		the position of the corner with the lowest x,y values
	 * @param max		the position of the corner with the highest x,y values
	 */
	public Rectangle(PVector position, PVector min, PVector max) {
		super(position);
		_min = min;
		_max = max;
	}
	
	/**
	 * creates a Rectangle defined by a position, representing its center, and a width a height
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
		PVector min1 = PVector.add(_position, _min);
		PVector max1 = PVector.add(_position, _max);
		PVector min2 = PVector.add(other._position, other._min);
		PVector max2 = PVector.add(other._position, other._max);
		boolean xOverlap = between(min1.x,min2.x,max2.x) || between(max1.x,min2.x,max2.x) 
		|| between(min2.x,min1.x,max1.x) || between(max2.x, min1.x, max2.x);
		boolean yOverlap = between(min1.y,min2.y,max2.y) || between(max1.y,min2.y,max2.y)
		|| between(min2.y,min1.y,max1.y) || between(max2.y, min1.y, max2.y);
		return xOverlap && yOverlap;
	}

}
