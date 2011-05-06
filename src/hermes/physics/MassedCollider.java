package src.hermes.physics;

public class MassedCollider extends GenericMassedCollider<MassedBeing, MassedBeing> {
	
	public MassedCollider() {
		super();
	}
	
	public MassedCollider(float elasticity) {
		super(elasticity);
	}
}
