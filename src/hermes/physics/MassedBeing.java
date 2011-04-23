package src.hermes.physics;

import java.util.LinkedList;

import processing.core.*;
import src.hermes.*;
import src.hermes.physics.*;

/**
 * an extension of being representing a body with mass
 * @author Sam
 *
 */
public abstract class MassedBeing extends Being {

	protected float _mass;	// the being's mass
	
	private PVector _force; // used to calculate the force being applied to this being
	private PVector _impulse; // used to calculate the impulse being applied to this being
	private PVector _displacement; // used to accumulate an instantaneous displacement on this being
	
	private LinkedList<ImpulseCollision> _collisions; // keeps track of all collisions in this step 
	
	/**
	 * gets the being's mass
	 * @return	the being's mass
	 */
	public float getMass() {
		return _mass;
	}
	
	/**
	 * sets the being's mass
	 * @param mass	the mass the set
	 */
	public void setMass(float mass) {
		_mass = mass;
	}
	
	/**
	 * adds a force to the being, which will be applied at the next step
	 * @param force		the force the add
	 */
	public void addForce(PVector force) {
		_force.add(force);
	}
	
	public void addImpulse(PVector impulse) {
		_impulse.add(impulse);
	}
	
	public void addDisplacement(PVector displacement) {
		_displacement.add(displacement);
	}
	
	/**
	 * updates the being's position and velocity based on the forces applied
	 * 	since the last step, using Euler's method integration
	 * @param dt	the time elapsed since the last step
	 */
	public void step(float dt) {
		_force.div(_mass); 	// calculate the acceleration from the force
		_force.mult(dt); 	// multiply by the time step
		_velocity.add(_force);	// v = v0 + a*dt
		_impulse.div(_mass); 	// change in velocity from impulse
		_velocity.add(_impulse); // apply the impulse
		// r = x0 + v*dt
		_position.add(PVector.mult(_velocity, dt));
		_position.add(_displacement);
		_force.set(0,0,0);
		_impulse.set(0,0,0);
		_displacement.set(0,0,0);
	}
	
	/**
	 * sets up a collision between two beings
	 * @param being1		the first being
	 * @param being2		the second being
	 * @param projection	the projection vector from being1 to being2
	 */
	public static ImpulseCollision addCollision(MassedBeing being1, MassedBeing being2, PVector projection) {
		ImpulseCollision collision = new ImpulseCollision(being1, being2, projection);
		being1.addCollision(collision);
		being2.addCollision(collision);
		return collision;
	}
	
	/**
	 * adds a collision to the being's collision list
	 * @param collision		the collision
	 */
	protected void addCollision(ImpulseCollision collision) {
		assert collision != null : "MassedBeing.addCollision: collision must be valid";
		
		_collisions.add(collision);
	}
	
	
}
