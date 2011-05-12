package src.hermes;

/**
 * basic collision detector, detect will return true if the bounding boxes of the beings overlap
 * @author Sam
 *
 * @param <A>	the first Being type
 * @param <B>	the second Being type
 */
public abstract class BoundingBoxCollider<A extends Being, B extends Being> implements Interactor<A, B> {

	// returns true if A and B collide
	public boolean detect(A being1, B being2) {
		return being1.getBoundingBox().collide(being2.getBoundingBox());
	}

	// handles an interaction between A and B
	public abstract boolean handle(A being1, B being2);
	
}
