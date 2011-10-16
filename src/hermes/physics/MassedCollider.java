package src.hermes.physics;

/**
 * This is a collision handler for <code>MassedBeing</code> which handles collisions
 * 	using both projection (instantly separating the bodies) and impulse (changing their velocities).
 *
 */
public class MassedCollider extends GenericMassedCollider<MassedBeing, MassedBeing> {
	
	public MassedCollider() {
		super();
	}
	
	public MassedCollider(float elasticity) {
		super(elasticity);
	}
}
