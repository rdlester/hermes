package src.hermes.shape;

import processing.core.PVector;

public class Rectangle extends Shape {

	PVector _min, _max;
	
	public Rectangle(PVector position, PVector min, PVector max) {
		super(position);
		_min = min;
		_max = max;
	}

	@Override
	public boolean collide(Shape other) {
		return other.collide(this);
	}
	
	public boolean collide(Rectangle other) {
		PVector min1 = PVector.add(_position, _min);
		PVector max1 = PVector.add(_position, _max);
		PVector min2 = PVector.add(other._position, other._min);
		PVector max2 = PVector.add(other._position, other._max);
		boolean xOverlap = between(min1.x,min2.x,max2.x) || between(max1.x,min2.x,max2.x);
		boolean yOverlap = between(min1.y,min2.y,max2.y) || between(max1.y,min2.y,max2.y);
		return xOverlap && yOverlap;
	}

}
