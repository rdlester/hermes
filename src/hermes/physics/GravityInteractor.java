package src.hermes.physics;

import processing.core.PVector;
import src.hermes.Interactor;
import static src.hermes.HermesMath.*;

/**
 * an interactor for gravitational attractions using the standard coloumb force model
 * F = G * m1 * m2 / r ^ 2
 * maximum range can be set for efficiency
 * 
 * @author Sam
 *
 */
public class GravityInteractor implements Interactor<MassedBeing, MassedBeing> {
	
	private float _maxRangeSquared;	// the maximum interaction range
	private float _G;			 	// the gravity constant
	
	/**
	 * set up the gravity interactor with a maximum interaction range
	 * @param gravityConstant	the gravity constant G
	 * @param maxRange			the maximum range of gravitational interactions
	 */
	public GravityInteractor(float gravityConstant, float maxRange) {
		_G = gravityConstant;
		_maxRangeSquared = maxRange * maxRange;
	}
	
	/**
	 * sets up a gravity interactor with no range limit
	 * @param gravityConstant	the gravity constant G
	 */
	public GravityInteractor(float gravityConstant) {
		_G = gravityConstant;
		_maxRangeSquared = Float.POSITIVE_INFINITY;
	}
	
	@Override
	public boolean detect(MassedBeing being1, MassedBeing being2) {
		PVector r = PVector.sub(being1.getPosition(), being2.getPosition());
		float d_squared = r.dot(r);
		return d_squared <= _maxRangeSquared && d_squared != 0;
	}

	@Override
	public boolean handle(MassedBeing being1, MassedBeing being2) {
		PVector r = PVector.sub(being1.getPosition(), being2.getPosition());
		float d_squared = r.dot(r);
		float F = _G * being1.getMass() * being2.getMass() / d_squared;
		r.normalize();
		PVector force = PVector.mult(r, F);
		being2.addForce(force);
		being1.addForce(reverse(force));
		return !being1.needsMoreSamples() && !being2.needsMoreSamples();
	}

}
