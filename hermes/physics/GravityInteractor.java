package hermes.physics;

/**
 * An interactor for gravitational attractions using the standard inverse-square force model.
 * <b>F = G * m1 * m2 / r ^ 2<b>
 *
 */
public class GravityInteractor extends InverseSquareInteractor {
	
	/**
	 * Sets up the gravity interactor with a maximum interaction range.
	 * @param gravityConstant	the gravity constant G (should be positive)
	 * @param maxRange			the maximum range of gravitational interactions
	 */
	public GravityInteractor(float gravityConstant, float maxRange) {
		super(-gravityConstant, maxRange);
	}
	
	/**
	 * Sets up a gravity interactor with no range limit.
	 * @param gravityConstant	the gravity constant G (should be positive)
	 */
	public GravityInteractor(float gravityConstant) {
		super(-gravityConstant);
	}

	protected float beingFactor(MassedBeing being) {
		return being.getMass();
	}

}
