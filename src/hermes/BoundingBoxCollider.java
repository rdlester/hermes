package src.hermes;

/**
 * A basic collision detector. <code>detect</code> will return true if the bounding boxes of the beings overlap.
 * The implementation of <code>handle</code> is left to the child classes.
 */
public abstract class BoundingBoxCollider<A extends Being, B extends Being> extends Interactor<A, B> {

	// returns true if the bounding boxes of A and B collide
	public boolean detect(A being1, B being2) {
		return being1.getBoundingBox().collide(being2.getBoundingBox());
	}

}
