package src.hermes.physics;

import processing.core.PVector;
import src.hermes.*;
import src.hermes.shape.HShape;
import static src.hermes.HermesMath.*;

/**
 * this Environment accelerates all objects intersecting with its shape with a specific acceleration
 * @author Sam
 *
 */
public class GravityEnvironment extends Being {
	
	PVector _acceleration;
	
	/**
	 * creates a new GravityEnvironment applying given acceleration, with given shape, moving with given velocity
	 * @param acceleration	the acceleration
	 * @param shape			the shape, objects intersecting with this shape will be accelerated
	 * @param velocity		the velocity of the environment
	 */
	public GravityEnvironment(PVector acceleration, HShape shape, PVector velocity) {
		super(shape, velocity);
		
		_acceleration = acceleration;
	}
	
	/**
	 * creates a new GravityEnvironment applying given acceleration, with given shape
	 * @param acceleration	the acceleration
	 * @param shape			the shape, objects intersecting with this shape will be accelerated
	 */
	public GravityEnvironment(PVector acceleration, HShape shape) {
		super(shape, zeroVector());
		
		_acceleration = acceleration;
	}
	
	public PVector getAcceleration() {
		return _acceleration;
	}
	
	public static Group<GravityEnvironment> makeGravityGroup(PVector acceleration, HShape shape, World world) {
		Group<GravityEnvironment> group = new Group<GravityEnvironment>(world);
		group.add(new GravityEnvironment(acceleration, shape));
		return group;
	}
	
	/**
	 * creates a new GravityInteractor
	 * @return	a new GravityInteractor
	 */
	public static Interactor makeGravityInteractor() {
		return new Interactor();
	}
	
	/**
	 * an Interactor that applies gravity to MassedBeings
	 * this accelerates MassedBeings by applying a force to them
	 * note that MassedBeings of infinite mass will not be accelerated
	 * @author Sam
	 *
	 */
	public static class Interactor extends Collider<GravityEnvironment, MassedBeing> {

		public boolean handle(GravityEnvironment enviro, MassedBeing being) {
			being.addForce(PVector.mult(enviro.getAcceleration(), being.getMass()));
			
			return !being.needsMoreSamples();
		}
		
	}
	
}
