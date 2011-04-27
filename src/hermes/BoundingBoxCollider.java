package src.hermes;

public abstract class BoundingBoxCollider<A extends Being, B extends Being> implements Interactor<A, B> {

	// returns true if A and B collide
	public boolean detect(A being1, B being2) {
		return being1.getBoundingBox().collide(being2.getBoundingBox());
	}

	// handles an interaction between A and B
	public abstract void handle(A being1, B being2);
	
}
