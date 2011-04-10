package src.hermes;

/**
 * Contains necessary logic to interact two beings
 * detect method determines if two bodies should interact
 * handle "interacts" the two beings by updating them
 */
 public interface Interactor<A extends Being, B extends Being> {

	// returns true if A and B should interact
	public boolean detect(A being1, B being2);
	// handles an interaction between A and B
	public void handle(A being1, B being2);
}

