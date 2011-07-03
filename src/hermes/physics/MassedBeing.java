package src.hermes.physics;

import java.util.Iterator;
import java.util.LinkedList;

import processing.core.*;
import src.hermes.*;
import src.hermes.shape.HShape;
import static src.hermes.HermesMath.*;

/**
 * an extension of being representing a body with mass and elasticity
 *
 */
public abstract class MassedBeing extends Being {

	protected float _mass;	// the being's mass
	private float 	_elasticity;   // the elasticity (bounciness) of the body
	
	private PVector _force; // used to calculate the force being applied to this being
	private PVector _impulse; // used to calculate the impulse being applied to this being
	private PVector _displacement; // used to accumulate an instantaneous displacement on this being
	
	private LinkedList<ImpulseCollision> _impulseCollisions; 	// keeps track of all collisions in this step 
	private LinkedList<MassedBeing> _mergeCollisions;			// keeps track of all beings in a merge collision with this one
	
	/**
	 * Instantiates a new MassedBeing with given mass and elasticity. Elasticity determies
	 * 	bounciness of collisions, a collision between beings of elasticity 1 will be perfectly
	 *  elastic, and a collision between beings of mass 0 will be perfectly inelastic, ie they
	 *  will lose all velocity parallel to the collision axis. If elasticity is greater than 1, 
	 *  they will gain speed from collisions, which may produce unrealistic results 
	 * @param mass
	 * @param elasticity
	 */
	public MassedBeing(HShape shape, PVector velocity,
			float mass, float elasticity) {
		super(shape, velocity);
		
		assert mass > 0 : "MassedBeing constructor: must have positive mass";
		assert elasticity >= 0 : "MassedBeing constructor: elasticity cannot be negative";
		
		_mass = mass;
		_elasticity = elasticity;
		
		_force = zeroVector();
		_impulse = zeroVector();
		_displacement = zeroVector();
		
		_impulseCollisions = new LinkedList<ImpulseCollision>();
		_mergeCollisions = new LinkedList<MassedBeing>();
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
	public void addMass(float mass) {
		_mass += mass;
		assert mass > 0 : "MassedBeing.addMass: being mass has become non-positive";
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
	 * Gets the current impulse on the being (note that this will be non-zero only after impulses have been applied, before updates).
	 * This is a reference, if you manipulate the returned vector it will change the impulse.
	 * @return	the impulse
	 */
	public PVector getImpulse() {
		return _impulse;
	}
	
	/**
	 * Gets the current displacement on the being (note that this will be non-zero only after displacements have been applied, before updates).
	 * This is a reference, if you manipulate the returned vector it will change the displacement.
	 * @return	the displacement
	 */
	public PVector getDisplacement() {
		return _displacement;
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
	
	/**
	 * adds an impulse to the being, which will be applied at the next step
	 * @param impulse	the impulse to add
	 */
	public void addImpulse(PVector impulse) {
		_impulse.add(impulse);
	}
	
	/**
	 * adds a displacement to the being, which will be applied at the next step
	 * @param displacement	the displacement to add
	 */
	public void addDisplacement(PVector displacement) {
		_displacement.add(displacement);
	}
	
	/**
	 * updates the being's position and velocity based on the forces applied
	 * 	since the last step, using Euler-Cromer integration
	 * @param dt	the time elapsed since the last step
	 */
	public void step() {
		double dt = ((double)updateTime()) / 1e9 * Hermes.timeScale;
		applyImpulse();
		applyDisplacement();
		EulerIntegrateVelocity(dt);
		EulerIntegratePosition(dt);
		clearForce();
		clearCollisions();
	}
	
	/**
	 * applies the currently acccumulated impulse and clears it
	 */
	protected void applyImpulse() {
		_impulse.div(_mass); 	// change in velocity from impulse
		_velocity.add(_impulse); // apply the impulse
		zeroVector(_impulse);
	}
	
	/**
	 * applies the accumulated displacement and clears it
	 */
	protected void applyDisplacement() {
		_position.add(_displacement);
		zeroVector(_displacement);
	}
	
	/**
	 * integrates velocity on acceleration using Euler-Cromer
	 * @param dt	the time step
	 */
	protected void EulerIntegrateVelocity(double dt) {
		// a = F/m
		PVector acceleration = PVector.div(_force, _mass);
		// v = v0 + a*dt
		acceleration.mult((float) dt);
		_velocity.add(acceleration);	
	}
	
	/**
	 * clears the collision list
	 */
	protected void clearCollisions() {
		_impulseCollisions.clear();
	}
	
	/**
	 * clears all forces
	 */
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
		
		if(being1.getImpulseCollisionWith(being2) == null) {
				
			float elasticity = HermesMath.average(being1._elasticity, being2._elasticity);
			ImpulseCollision collision = new ImpulseCollision(being1, being2, 
					projection, elasticity);
			collision.addImpulse();
			collision.calculateDisplacement();
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
		assert elasticity >= 0 : "addCollision: elasticity must be positive";
		
		if(being1.getImpulseCollisionWith(being2) == null) {
			ImpulseCollision collision = new ImpulseCollision(being1, being2, 
					projection, elasticity);
			collision.addImpulse();
			collision.calculateDisplacement();
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
	public ImpulseCollision getImpulseCollisionWith(MassedBeing other) {
		for(ImpulseCollision collision : _impulseCollisions) {
			if(collision.hasBeing(other))
				return collision;
		}
		return null;
	}
	
	/**
	 * creates a merge collision between two beings
	 * @param being1	the first being
	 * @param being2	the second being
	 */
	public static void addMergeCollision(MassedBeing being1, MassedBeing being2) {
		assert being1 != null : "addCollision: being1 must be a valid being";
		assert being2 != null : "addCollision: being2 must be a valid being";
		
		if(being1 != being2 && !being1.hasMergeCollisionWith(being2)) {
			being1.addMergeCollisionWith(being2);
			being2.addMergeCollisionWith(being1);
		}
	}
	
	/**
	 * whether the being is merge colliding with another
	 * @param other		the being to check for collision with
	 * @return			true is they are merge colliding, otherwise false
	 */
	public boolean hasMergeCollisionWith(MassedBeing other) {
		for(MassedBeing being : _mergeCollisions) {
			if(being == other)
				return true;
		}
		return false;
	}
	
	/**
	 * clears all merge collisions in a being
	 */
	public void clearMergeCollisions() { 
		_mergeCollisions.clear();
	}
	
	/**
	 * gets an iterator over all merge collisions
	 * @return	the merge collisions
	 */
	public Iterator<MassedBeing> getMergeCollisions() {
		return _mergeCollisions.iterator();
	}
	
	/**
	 * adds an impulse collision to the being's collision list
	 * @param collision		the collision
	 */
	protected void addImpulseCollision(ImpulseCollision collision) {
		assert collision != null : "MassedBeing.addImpulseCollision: collision must be valid";
		
		_impulseCollisions.add(collision);
	}
	
	/**
	 * adds a merge collision to the being's collision list
	 * @param other		the being to merge with
	 */
	protected void addMergeCollisionWith(MassedBeing other) {
		assert other != null : "MassedBeing.addMergeCollisionWith: other must be a valid MassedBeing";
	
		_mergeCollisions.add(other);
	}
	
	/**
	 * whether the being requires more steps on this update -- used for motion multisampling
	 * 	this will always return false, but is overriden by subclasses with multisampling support
	 * @return
	 */
	public boolean needsMoreSamples() {
		return false;
	}
	
	public String toString() {
		return super.toString() + " Mass: " + _mass + " Elasticity: " + _elasticity + 
		" Force: " + _force + " Impulse: " + _impulse;
	}
	
}