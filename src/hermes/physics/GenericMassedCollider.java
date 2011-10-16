package src.hermes.physics;

import processing.core.PVector;
import src.hermes.*;

/**
 * <p>
 * This is a collision handler for <code>MassedBeing</code> and its subclasses which handles collisions
 * using both projection (instantly separating the bodies) and impulse (changing their velocities).
 * <p>
 * Use <code>GenericMassedCollider</code>, as opposed to <code>MassedCollider</code>, only if you intend to override the behavior
 * and methods specific to a subclass of <code>MassedBeing</code>.
 *
 * @param <A>	the first type of MassedBeing
 * @param <B>	the second type of MassedBeing
 */
public class GenericMassedCollider<A extends MassedBeing, B extends MassedBeing> extends Interactor<A,B> {

	private Float _elasticity = null;
	
	/**
	 * <p>
	 * Default <code>MassedCollider</code> constructor. In this case, collision elasticity will be the average of the colliding being elasticities.
	 */
	public GenericMassedCollider() {
		super(false, true);
	}
	
	/**
	 * Creates a <code>MassedCollider</code> with specified collision elasticity.
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

	public void handle(A being1, B being2) {
		ImpulseCollision collision = being1.getImpulseCollisionWith(being2);
		collision.applyImpulses();
		collision.applyDisplacement();
	}

	
}
