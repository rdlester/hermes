package src.hermes;

/**
 * An Interactor for that detects collisions between Beings based on their shape. 
 * A collision will be detected if the HShapes of the Beings overlap. Implementation of <code>handle()</code> (which gets called
 * if a collision is detected) is left to the child class.
 */
public abstract class Collider<A extends Being, B extends Being> extends Interactor<A, B>{
	
	// returns true if A and B collide
	public boolean detect(A being1, B being2) {
		return being1.getShape().collide(being2.getShape());
	}

}

