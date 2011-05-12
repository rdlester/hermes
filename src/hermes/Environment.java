package src.hermes;

import processing.core.PVector;
import src.hermes.shape.Shape;

 /**
 * a Being with no draw -- used to update Beings based on their location
 */ 
public abstract class Environment extends Being {

	public Environment(Shape shape, PVector velocity) {
		super(shape, velocity);
	}

	public Environment(Shape shape) {
		super(shape);
	}
	
	public void draw() {}
	
}