package src.hermes.physics;

/**
 * an interactor for gravitational attractions using the standard coloumb force model
 * F = G * m1 * m2 / r ^ 2
 * maximum range can be set for efficiency
 * 
 * @author Sam
 *
 */
public class GravityInteractor extends ColoumbInteractor {
	
	/**
	 * set up the gravity interactor with a maximum interaction range
	 * @param gravityConstant	the gravity constant G (should be positive)
	 * @param maxRange			the maximum range of gravitational interactions
	 */
	public GravityInteractor(float gravityConstant, float maxRange) {
		super(-gravityConstant, maxRange);
	}
	
	/**
	 * sets up a gravity interactor with no range limit
	 * @param gravityConstant	the gravity constant G (should be positive)
	 */
	public GravityInteractor(float gravityConstant) {
		super(-gravityConstant);
	}

	protected float beingFactor(MassedBeing being) {
		return being.getMass();
	}

}
