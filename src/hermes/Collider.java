package src.hermes;

/**
 * Following  to interact two beings
 * detect method determines if two bodies should interact
 * handle "interacts" the two beings by updating them
 */
public abstract class Collider<A extends Being, B extends Being> implements Interactor{

	// returns true if A and B collide
	@Override
	public boolean detect(A body1, B body2) {
		Shape.collide(body1.getShape(), body2.getShape());
	}

	// handles an interaction between A and B
	abstract void handleCollision(A being1, B being2);

}

