package src.hermes.physics;

import processing.core.PVector;
import src.hermes.Interactor;
import static src.hermes.HermesMath.*;

public class GravityInteractor implements Interactor<MassedBeing, MassedBeing> {
	
	private float _maxRangeSquared;	// the maximum interaction range
	private float _G;			 	// the gravity constant
	
	public GravityInteractor(float gravityConstant, float maxRange) {
		_G = gravityConstant;
		_maxRangeSquared = maxRange * maxRange;
	}
	
	@Override
	public boolean detect(MassedBeing being1, MassedBeing being2) {
		PVector r = PVector.sub(being1.getPosition(), being2.getPosition());
		float d_squared = r.dot(r);
		return d_squared <= _maxRangeSquared;
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
