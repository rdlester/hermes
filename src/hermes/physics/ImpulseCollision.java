package src.hermes.physics;

import processing.core.*;
import static src.hermes.HermesMath.*;

/**
 * this class is used to store the data for an impulse-based collision between two beings
 * 	intended for internal use, you do not need to understand or use this class!
 * it will accumulate an impulse for a collision between two beings, and apply it equally to each
 *  when the collision is resolved. 
 * @author Sam
 *
 */
public class ImpulseCollision {

	private MassedBeing _being1, _being2; 	// the two beings colliding
	private PVector _projection; 			// the projection vector from being1 to being2
	private PVector _impulse; 				// the impulse on _being2 from _being1
	private float _elasticity; 				// the elasticity of the collision
	
	/**
	 * sets up a collision between beings
	 * @param being1		the first being (impulses and projections are from being1 to being2)
	 * @param being2		the second being
	 * @param projection	the projection vector from being1 to being2
	 */
	public ImpulseCollision(MassedBeing being1, MassedBeing being2, 
			PVector projection, float elasticity) {
		assert being1 != null : "ImpulseCollision contructor: being1 must be a valid being";
		assert being2 != null : "ImpulseCollision contructor: being2 must be a valid being";
		
		_being1 = being1;
		_being2 = being2;
		_projection = projection;
		_elasticity = elasticity;
	}
	
	/**
	 * the projection vector from being1 to being2
	 * @return	the projection vector
	 */
	public PVector getProjection() {
		return _projection;
	}
	
	/**
	 * sets the projection vector for the collision
	 * @param projection	the projection vector
	 */
	public void setProjection(PVector projection) {
		_projection = projection;
	}
	
	/**
	 * add an impulse to the collision
	 * @param impulse	the impulse to add
	 * @param origin	the origin of the impulse (should be being1 or being2)
	 */
	public void addImpulse(PVector impulse, MassedBeing origin) {
		assert impulse != null : "ImpulseCollision.addImpulse: impulse must be a valid PVector";
		
		if(origin == _being1) 		// if the impulse is from being1
			_impulse.add(impulse); 	// add it
		else if(origin == _being2) 	// if its from being2
			_impulse.sub(impulse); 	// subtract it
		else
			assert false : "ImpulseCollision.addImpulse: origin of collision force must be being1 or being2";
	}
	
	/**
	 * add an impulse to the beings, calculated between them, based on their current mass and velocity, to the beings
	 */
	public void addImpulse() {
		addImpulse(Physics.calculateImpulse(_being1, _being2, _elasticity, _projection), _being1);
	}
	
	/**
	 * applies the stored impulse to each being
	 * clears the impulse vector
	 */
	public void applyImpulses() {
		_being1.addImpulse(reverse(_impulse));
		_being2.addImpulse(_impulse);
		_impulse.set(0, 0, 0);
	}
	
}