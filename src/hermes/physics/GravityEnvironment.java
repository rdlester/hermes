package src.hermes.physics;

import processing.core.PVector;
import src.hermes.*;
import src.hermes.shape.Shape;
import static src.hermes.HermesMath.*;

public class GravityEnvironment extends Environment {
	
	PVector _acceleration;
	
	public GravityEnvironment(PVector acceleration, Shape shape, PVector velocity) {
		super(shape, velocity);
		
		_acceleration = acceleration;
	}
	
	public GravityEnvironment(PVector acceleration, Shape shape) {
		super(shape, zeroVector());
		
		_acceleration = acceleration;
	}
	
	public PVector getAcceleration() {
		return _acceleration;
	}
	
	public class Interactor extends Collider<GravityEnvironment, MassedBeing> {

		@Override
		public boolean handle(GravityEnvironment enviro, MassedBeing being) {
			being.addForce(PVector.mult(enviro.getAcceleration(), being.getMass()));
			
			return !being.needsMoreSamples();
		}
		
	}
	
}
