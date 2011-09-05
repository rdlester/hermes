package src.hermes;

/**
 *
 * Used by World. Adds Beings to the Camera's draw list if they are on screen.
 * 
 */
class CameraBeingInteractor extends BoundingBoxCollider<HCamera, Being> {
	
	public void handle(HCamera being1, Being being2) {
		being1.addBeing(being2);
	}


}
