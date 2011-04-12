package src.hermes;

/**
 * Following  to interact two beings
 * detect method determines if two bodies should interact
 * handle "interacts" the two beings by updating them
 */
public abstract class Collider<A extends Being, B extends Being> implements Interactor<A, B>{

	// returns true if A and B collide
	public boolean detect(A being1, B being2) {
		Shape.collide(body1.getShape(), body2.getShape());
		return true;
	}

	// handles an interaction between A and B
	public abstract void handleCollision(A being1, B being2);

}

