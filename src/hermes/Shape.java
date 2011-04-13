package src.hermes;

import processing.core.*;

public abstract class Shape {
	
	PVector _position;
	
	public Shape(PVector position) {
		_position = position;
	}
	                        
	public abstract boolean collide(Shape other);
	
	boolean between(float sample, float min, float max) {
		return sample >= min && sample <= max;
	}
	
}

