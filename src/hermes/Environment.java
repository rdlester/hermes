package src.hermes;

import processing.core.PVector;
import src.hermes.shape.Shape;

 /**
 * used to update Beings
 */ 
public abstract class Environment extends Being {

	public Environment(Shape shape, PVector velocity) {
		super(shape, velocity);
	}

	public void draw() {}
	
}