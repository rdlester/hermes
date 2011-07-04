package src.hermes.physics;

import processing.core.PVector;
import src.hermes.Hermes;
import src.hermes.hshape.*;
import static src.hermes.HermesMath.*;

/**
 * this extension of MassedBeing provides motion multisampling support for more
 * 	accurate motion integration and collision detection
 * 
 * @author Sam
 *
 */
public abstract class MultisampledMassedBeing extends MassedBeing {

	private static final int DEFAULT_SAMPLES = 10;
	
	private float _sampleLength; // the max length the being can travel per sample
	private int _maxSamples;	 // the maximum number of samples per update
	
	private int _samples = 0;	// samples taken on the current update
	private boolean _moreSamples = false;	// whether more samples are needed
	
	/**
	 * creates a new MultisampledMassedBeing, same as MassedBeing constructor but for last two arguments
	 * @param shape			the being's collision shape
	 * @param velocity		the being's velocity
	 * @param mass			the being's mass (must be positive)
	 * @param elasticity	the being's elasticive (should be in [0,1])
	 * @param sampleLength	the length of the motion sample, ie how for the being has to travel
	 * 							before more samples are needed. The being's shortest spanning length
	 * 							is a reasonable value
	 * @param maxSamples	the maximum number of samples allowed. If the being can reach a very high 
	 * 							speed, this must be very high for motion sampling to work, but this reduces
	 * 							performance. Increasing the sample length allows lower maxSamples values, but
	 * 							decreases accuracy.
	 */
	public MultisampledMassedBeing(HShape shape, PVector velocity, float mass,
			float elasticity, float sampleLength, int maxSamples) {
		super(shape, velocity, mass, elasticity);
		
		_sampleLength = sampleLength;
		_maxSamples = maxSamples;
	}
	
	/**
	 * creates a new MultisampledMassedBeing, same as MassedBeing constructor but for last two arguments
	 * 	uses the default value of 10 for sample length.
	 * @param shape			the being's collision shape
	 * @param velocity		the being's velocity
	 * @param mass			the being's mass (must be positive)
	 * @param elasticity	the being's elasticive (should be in [0,1])
	 * @param sampleLength	the length of the motion sample, ie how for the being has to travel
	 * 							before more samples are needed. The being's shortest spanning length
	 * 							is a reasonable value
	 */

	public MultisampledMassedBeing(HShape shape, PVector velocity, float mass,
			float elasticity, float sampleLength) {
		super(shape, velocity, mass, elasticity);
		
		_sampleLength = sampleLength;
		_maxSamples = DEFAULT_SAMPLES;
	}
	
	@Override
	public void step() {
		// get a new time and save state
		long t0 = _time;
		double dt = ((double)updateTime()) / 1e9 * Hermes.timeScale;
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
