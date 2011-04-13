package src.hermes.shape;

import processing.core.PVector;

public class Circle extends Shape {

	PVector _center;
	float _radius;
	
	/**
	 * Constructor defining center of circle
	 * to be a certain distance away from the position
	 * @param position
	 * @param center
	 * @param radius
	 */
	public Circle(PVector position, PVector center, float radius) {
		super(position);
		_center = center;
		_radius = radius;
	}
	
	/**
	 * Constructor defining center of circle
	 * as position of object
	 * @param position
	 * @param radius
	 */
	public Circle(PVector position, float radius) {
		super(position);
		_radius = radius;
	}

	@Override
	public boolean collide(Shape other) {
		// TODO Auto-generated method stub
		return false;
	}

}
