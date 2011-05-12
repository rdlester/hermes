package src.hermes.physics;

import processing.core.PVector;
import src.hermes.*;

public class GenericMassedCollider<A extends MassedBeing, B extends MassedBeing> 
	implements Interactor<A,B> {

	private Float _elasticity = null;
	
	/**
	 * creates a new MassedCollider
	 * in this case, collision elasticity will be the average of the colliding being elasticities
	 */
	public GenericMassedCollider() {
		super();
	}
	
	/**
	 * creates a MassedCollider with specified collision elasticity
	 * @param elasticity	collision elasticity
	 */
	public GenericMassedCollider(float elasticity) {
		super();
		_elasticity = new Float(elasticity);
	}
	
	public boolean detect(A being1, B being2) {
		// find the projection vector between the beings
		PVector projection = being1.getShape().projectionVector(being2.getShape());
		if(projection == null)
			return false;	// if they aren't colliding
		// store the collision
		if(_elasticity == null)
			MassedBeing.addImpulseCollision(being1, being2, projection);
		else
			MassedBeing.addImpulseCollision(being1, being2, projection, _elasticity);
		return true;
	}

	public boolean handle(A being1, B being2) {
		ImpulseCollision collision = being1.getImpulseCollisionWith(being2);
		collision.applyImpulses();
		collision.applyDisplacement();
		return !being1.needsMoreSamples() && !being2.needsMoreSamples();
	}

	
}
