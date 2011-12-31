package hermes;

/**
 * Used by World. Adds Beings to the Camera's draw list if they are on screen.
 * <p>s
 * Internal -- you do not need to understand this class!
 */
class CameraBeingInteractor extends BoundingBoxCollider<HCamera, Being> {
	
	public void handle(HCamera being1, Being being2) {
		being1.addBeing(being2);
	}


}
