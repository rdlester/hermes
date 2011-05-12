package src.hermes.physics;

/**
* this is a collision handler for MassedBeing and its subclasses which handles collisions
 * 	using both projection (instantly separating the bodies) and impulse (changing their velocities)

 * @author Sam
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
