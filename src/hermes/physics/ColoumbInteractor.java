package src.hermes.physics;

import static src.hermes.HermesMath.reverse;
import processing.core.PVector;
import src.hermes.*;

/**
 * <p>
 * A general coloumb inverse square-law force interactor.
 *
 */
public abstract class ColoumbInteractor extends Interactor<MassedBeing, MassedBeing> {

	private float _maxRangeSquared;	// the maximum interaction range
	private float _k;			 	// the gravity constant
	
	/**
	 * the sets up a coloumb interactor with a range limite
	 * @param factor	the force contant factor
	 * @param maxRange	the maximum range of interactions
	 */
	public ColoumbInteractor(float factor, float maxRange) {
		_k = factor;
		_maxRangeSquared = maxRange * maxRange;
	}
	
	/**
	 * sets up a coloumb interactor with no range limit
	 * @param factor	the force constant
	 */
	public ColoumbInteractor(float factor) {
		_k = factor;
		_maxRangeSquared = Float.POSITIVE_INFINITY;
	}
	
	public boolean detect(MassedBeing being1, MassedBeing being2) {
		if(being1 == being2) // no self-interaction
			return false;
		PVector r = PVector.sub(being1.getPosition(), being2.getPosition());
		float d_squared = r.dot(r);
		// check if the distance is within the maximum range
		return d_squared <= _maxRangeSquared && d_squared != 0;
	}

	public void handle(MassedBeing being1, MassedBeing being2) {
		// F = k * q1 * q2 / r^2
		PVector r = PVector.sub(being2.getPosition(), being1.getPosition());
		double d_squared = (double)r.dot(r);
		double F = _k * beingFactor(being1) * beingFactor(being2) / d_squared;
		r.normalize();
		PVector force = PVector.mult(r, (float)F);
		being2.addForce(force);
		being1.addForce(reverse(force));
	}
	
	/**
	 * the factor from each being used in the numerator of the Coloumb equation
	 * for example, charge for an electric force or mass for gravity
	 * @param being		the being
	 * @return			the being's factor
	 */
	abstract protected float beingFactor(MassedBeing being);
	
}
