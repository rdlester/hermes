package src.hermes.physics;

import static src.hermes.HermesMath.reverse;
import processing.core.PVector;
import src.hermes.*;

public abstract class ColoumbInteractor implements Interactor<MassedBeing, MassedBeing> {

	private float _maxRangeSquared;	// the maximum interaction range
	private float _k;			 	// the gravity constant
	
	public ColoumbInteractor(float factor, float maxRange) {
		_k = factor;
		_maxRangeSquared = maxRange * maxRange;
	}
	
	/**
	 * sets up a gravity interactor with no range limit
	 * @param gravityConstant	the gravity constant G
	 */
	public ColoumbInteractor(float factor) {
		_k = factor;
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
		PVector r = PVector.sub(being2.getPosition(), being1.getPosition());
		float d_squared = r.dot(r);
		float F = _k * beingFactor(being1) * beingFactor(being2) / d_squared;
		r.normalize();
		PVector force = PVector.mult(r, F);
		being2.addForce(force);
		being1.addForce(reverse(force));
		return !being1.needsMoreSamples() && !being2.needsMoreSamples();
	}
	
	abstract protected float beingFactor(MassedBeing being);
	
}
