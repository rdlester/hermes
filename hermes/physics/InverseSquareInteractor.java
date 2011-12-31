package hermes.physics;

import static hermes.HermesMath.reverse;
import hermes.*;
import processing.core.PVector;

/**
 * <p>
 * A general inverse square-law force interactor. 
 * Each being in the interaction will receive an equal and opposite force <b>F = k * q1 * q2 / r^2</b>
 * where <b>k</b> is a factor set in the constructor, <b>q1</b> and <b>q2</b> are determined by <code>beingFactor</code>
 * for the first and second beings respectively, and <b>r</b> is the distance between the beings. It can also be given a maximum range.
 *
 */
public abstract class InverseSquareInteractor extends Interactor<MassedBeing, MassedBeing> {

	private float _maxRangeSquared;	// the maximum interaction range
	private float _k;			 	// the gravity constant
	
	/**
	 * Sets up a <code>ColoumbInteractor</code> with a range limit.
	 * @param factor	the force constant factor (k in the Coloumb equation)
	 * @param maxRange	the maximum range of the interaction. Beings separated by a distance greater than this range will not interact.
	 */
	public InverseSquareInteractor(float factor, float maxRange) {
		_k = factor;
		_maxRangeSquared = maxRange * maxRange;
	}
	
	/**
	* Sets up a <code>ColoumbInteractor</code> with no range limit.
	 * @param factor	the force constant factor (k in the Coloumb equation)
	 */
	public InverseSquareInteractor(float factor) {
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
	 * The factor from each being used in the numerator of the Coloumb equation
	 * for example, charge for an electric force or mass for gravity.
	 * @param being		a being
	 * @return			the being's factor
	 */
	abstract protected float beingFactor(MassedBeing being);
	
}
