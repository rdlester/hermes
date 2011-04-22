package src.hermes;

import processing.core.*;

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
	
}
