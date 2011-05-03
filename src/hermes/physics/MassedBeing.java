package src.hermes.physics;

import java.util.LinkedList;

import processing.core.*;
import src.hermes.*;
import src.hermes.physics.*;
import src.hermes.shape.Shape;
import static src.hermes.HermesMath.*;

/**
 * an extension of being representing a body with mass
 * @author Sam
 *
 */
public abstract class MassedBeing extends Being {

	protected float _mass;	// the being's mass
	private float 	_elasticity;   // the elasticity (bounciness) of the body
	
	private PVector _force; // used to calculate the force being applied to this being
	private PVector _impulse; // used to calculate the impulse being applied to this being
	private PVector _displacement; // used to accumulate an instantaneous displacement on this being
	
	protected LinkedList<ImpulseCollision> _collisions; // keeps track of all collisions in this step 
	
	/**
	 * Instantiates a new MassedBeing with given mass and elasticity. Elasticity determies
	 * 	bounciness of collisions, a collision between beings of elasticity 1 will be perfectly
	 *  elastic, and a collision between beings of mass 0 will be perfectly inelastic, ie they
	 *  will lose all velocity parallel to the collision axis. If elasticity is greater than 1, 
	 *  they will gain speed from collisions, which may produce unrealistic results 
	 * @param mass
	 * @param elasticity
	 */
	public MassedBeing(Shape shape, PVector velocity,
			float mass, float elasticity) {
		super(shape, velocity);
		
		assert mass > 0 : "MassedBeing constructor: must have positive mass";
		assert elasticity >= 0 : "MassedBeing constructor: elasticity cannot be negative";
		
		_mass = mass;
		_elasticity = elasticity;
		
		_force = zeroVector();
		_impulse = zeroVector();
		_displacement = zeroVector();
		
		_collisions = new LinkedList<ImpulseCollision>();
	}
	
	/**
	 * gets the being's mass
	 * @return	the being's mass
	 */
	public float getMass() {
		return _mass;
	}
	
	/**
	 * sets the being's mass
	 * @param mass	the mass to set (must be positive)
	 */
	public void setMass(float mass) {
		assert mass > 0 : "MassedBeing.setMass: Objects must have a positive mass";
		
		_mass = mass;
	}
	
	/**
	 * adds mass to the being
	 * @param mass	the mass of the being
	 */
	public void addMass(float mass) throws NonPositiveMassException {
		_mass += mass;
		if(_mass <= 0)
			throw new NonPositiveMassException(this);
	}
	
	/**
	 * Will add a mass to the being, unless this would cuase the beings mass to become
	 * 	zero or negative, in which case it has no effect.
	 * While convenient because you don't have to catch an exception, be careful as this
	 * 	may make it harder to find bugs in your code that would have cause a non-positive mass.
	 * @param mass	the mass to add
	 */
	public void addMassSafe(float mass) {
		if(_mass + mass > 0)
			_mass += mass;
	}
	
	/**
	 * the being's elasticity
	 * @return the being's elasticity
	 */
	public float getElasticity() {
		return _elasticity;
	}
	
	/**
	 * gets the current impulse on the being (note that this will be non-zero only after impulses have been applied, before updates)
	 * this is a reference, if you manipulate the returned vector it will change the impulse
	 * @return	the impulse
	 */
	public PVector getImpulse() {
		return _impulse;
	}
	
	/**
	 * gets the current force on the being (note that this will be non-zero only after forces have been applied, before updates)
	 * this is a reference, if you manipulate the returned vector it will change the force
	 * @return	the force
	 */
	public PVector getForce() {
		return _force;
	}
	
	/**
	 * Sets the being's elasticity (bounciness). Elasticity cannot be negative, and
	 * 	in general it should be no higher than 1. Collision between beings with elasticity
	 * 	higher than one will result beings gaining velocity when they collide, violating
	 *  conservation of momentum.
	 * @param elasticity	the elasticity, should be in the range [0,1]
	 */
	public void setElasticity(float elasticity) {
		assert _elasticity >= 0 : "MassedBeing.setElasticity: elasticity cannot be negative";
		_elasticity = elasticity;
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
	 * 	since the last step, using Euler-Cromer integration
	 * @param dt	the time elapsed since the last step
	 */
	public void step() {
		double dt = ((double)updateTime()) / 1e9;
		applyImpulse();
		EulerIntegrateVelocity(dt);
		EulerIntegratePosition(dt);
		clearForce();
		clearCollisions();
	}
	
	protected void applyImpulse() {
		_impulse.div(_mass); 	// change in velocity from impulse
		_velocity.add(_impulse); // apply the impulse
		zeroVector(_impulse);
	}
	
	protected void EulerIntegrateVelocity(double dt) {
		// a = F/m
		PVector acceleration = PVector.div(_force, _mass);
		// v = v0 + a*dt
		acceleration.mult((float) dt);
		_velocity.add(acceleration);	
	}
	
	protected void clearCollisions() {
		_collisions.clear();
	}
	
	protected void clearForce() {
		zeroVector(_force);
	}
	
	/**
	 * sets up a collision between two beings, with elasticity equal to the average of
	 * 	the being's elasticity
	 * @param being1		the first being
	 * @param being2		the second being
	 * @param projection	the projection vector from being1 to being2
	 */
	public static ImpulseCollision addImpulseCollision(MassedBeing being1, MassedBeing being2, 
			PVector projection) {
		assert being1 != null : "addCollision: being1 must be a valid being";
		assert being2 != null : "addCollision: being2 must be a valid being";
		assert projection != null : "addCollision: projection must be a valid PVector";
		
		if(being1.getCollisionWith(being2) == null) {
				
			float elasticity = HermesMath.average(being1._elasticity, being2._elasticity);
			ImpulseCollision collision = new ImpulseCollision(being1, being2, 
					projection, elasticity);
			collision.addImpulse();
			being1.addImpulseCollision(collision);
			being2.addImpulseCollision(collision);
			return collision;
		}
		return null;
	}
	
	/**
	 * sets up a collision between two beings, with custom elasticity
	 * @param being1		the first being
	 * @param being2		the second being
	 * @param projection	the projection vector from being1 to being2
	 */
	public static ImpulseCollision addImpulseCollision(MassedBeing being1, MassedBeing being2, 
			PVector projection, float elasticity) {
		assert being1 != null : "addCollision: being1 must be a valid being";
		assert being2 != null : "addCollision: being2 must be a valid being";
		assert projection != null : "addCollision: projection must be a valid PVector";
		assert elasticity > 0 : "addCollision: elasticity must be positive";
		
		if(being1.getCollisionWith(being2) == null) {
			ImpulseCollision collision = new ImpulseCollision(being1, being2, 
					projection, elasticity);
			collision.addImpulse();
			being1.addImpulseCollision(collision);
			being2.addImpulseCollision(collision);
			return collision;
		}
		return null;
	}
	
	/**
	 * returns the collision between this being and another, if such a collision has been added
	 * @param other		the being to check for collision with
	 * @return			the collision
	 */
	public ImpulseCollision getCollisionWith(MassedBeing other) {
		for(ImpulseCollision collision : _collisions) {
			if(collision.hasBeing(other))
				return collision;
		}
		return null;
	}
	
	/**
	 * adds a collision to the being's collision list
	 * @param collision		the collision
	 */
	protected void addImpulseCollision(ImpulseCollision collision) {
		assert collision != null : "MassedBeing.addCollision: collision must be valid";
		
		_collisions.add(collision);
	}
	
	public boolean needsMoreSamples() {
		return false;
	}
	
	public String toString() {
		return super.toString() + " Mass: " + _mass + " Elasticity: " + _elasticity + 
		" Force: " + _force + " Impulse: " + _impulse;
	}
	
}