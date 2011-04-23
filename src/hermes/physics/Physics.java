package src.hermes.physics;

import processing.core.PVector;

public class Physics {
	
	/**
	 * calculates the impulse from a collision between objects, without accounting for rotation
	 * @param v1			the velocity of the first object
	 * @param v2			the velocity of the second object
	 * @param m1			the mass of the first object
	 * @param m2			the mass of the second object
	 * @param elasticity	the elasticity of collision, 1.0 is perfectly elastic 
	 * 		(objects will bounce, all energy is conserved), 0.0 is completely inelastic 
	 * 		(they will stop, no conservation of kinetic energy)
	 * @param normal	vector pointing from body 1 into body 2 along the axis of collision
	 * 						does NOT need to be of unit length (use the projection vector)
	 * @return			the impulse from body 1 on body 2 (impulse from 2 on 1 is merely the reverse of this)
	 *
	 * this is calculated by the equation: 
	 * <p>
	 *              -(1-e)(<b>v2</b> - <b>v1</b>) . <b>n</b> <br />
	 * <b>j</b> =   -----------------------------------		 <br />
	 *              <b>n</b> . <b>n</b>(1/m1 + 1/m2)		 <br />
	 *</p>
	 *
	 *	where e is elasticity and n is the normal
	 *
	 */
	public static PVector calculateImpulse(PVector v1, PVector v2, 
			float m1, float m2, float elasticity, PVector normal) {
		
		PVector numerator = PVector.sub(v2, v1); // calculate relative velocity
		numerator.mult(-1 - elasticity); 		 // factor by elasticity
		float result = numerator.dot(normal); 	 // find normal component
		result /= normal.dot(normal);			 // normalize
		result /= (1 / m1 + 1 / m2);			 // factor in mass
		
		return PVector.mult(normal, result);
	}
	
	/**
	 * calculates the impulse from a collision between Massed Beings, without accounting for rotation
	 * @param being1		the first being
	 * @param being2		the second being
	 * @param elasticity	the elasticity of collision, 1.0 is perfectly elastic 
	 * 		(objects will bounce, all energy is conserved), 0.0 is completely inelastic 
	 * 		(they will stop, no conservation of kinetic energy)
	 * @param normal		vector pointing from being1 to being2 along the axis of collision
	 * 							(use the projection vector between their shapes)
	 * @return				impulse from being1 on being2
	 */
	public static PVector calculateImpulse(MassedBeing being1, MassedBeing being2, 
			float elasticity, PVector normal) {
		return calculateImpulse(being1.getVelocity(), being2.getVelocity(), 
				being1.getMass(), being2.getMass(), elasticity, normal);
	}
	
}
