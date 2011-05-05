package src.hermes.physics;

import processing.core.PVector;
import src.hermes.shape.*;
import src.hermes.*;
import static src.hermes.HermesMath.*;

public abstract class MultisampledMassedBeing extends MassedBeing {

	private static final int DEFAULT_SAMPLES = 8;
	
	private float _sampleLength; // the max length the being can travel per sample
	private int _maxSamples;
	
	private int _samples = 0;
	private boolean _moreSamples = false;
	
	public MultisampledMassedBeing(Shape shape, PVector velocity, float mass,
			float elasticity, float sampleLength, int maxSamples) {
		super(shape, velocity, mass, elasticity);
		
		_sampleLength = sampleLength;
		_maxSamples = maxSamples;
	}

	public MultisampledMassedBeing(Shape shape, PVector velocity, float mass,
			float elasticity, float sampleLength) {
		super(shape, velocity, mass, elasticity);
		
		_sampleLength = sampleLength;
		_maxSamples = DEFAULT_SAMPLES;
	}
	
	@Override
	public void step() {
		// get a new time and save state
		long t0 = _time;
		double dt = ((double)updateTime()) / 1e9;
		// update everything
		applyImpulse();
		applyDisplacement();
		PVector v0 = cloneVector(_velocity);
		PVector x0 = cloneVector(_position);
		EulerIntegrateVelocity(dt);
		EulerIntegratePosition(dt);
		PVector deltaX = PVector.sub(_position, x0);
		// check if we need to multisample
		float deltaX_sq = mag2(deltaX);
		if(_samples <= _maxSamples && deltaX_sq > _sampleLength*_sampleLength) {
			float dx = (float)Math.sqrt(deltaX_sq);
			_position = x0; // reset position
			_velocity = v0; // reset velocity
			dt *= _sampleLength / dx;
			_time = t0 + (long)(dt * 1e9);
			EulerIntegrateVelocity(dt);
			EulerIntegratePosition(dt);
			_samples++;
			setDone(false); // this will cause us to keep updating
			_moreSamples = true;
		} else {
			_samples = 0;
			_moreSamples = false;
		}
		clearCollisions();
		clearForce();
	}
	
	@Override
	public boolean needsMoreSamples() {
		return _moreSamples;
	}
	
}
