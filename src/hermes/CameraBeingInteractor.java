package src.hermes;

/**
 * primarily for internal purposes -- you do not need to understand this class
 * 
 * adds beings to the camera's draw list if they intersect with the camera's bounding box
 * 
 * @author Sam
 *
 */
public class CameraBeingInteractor extends BoundingBoxCollider<Camera, Being> {

	//detect has been implemented in BoundingBoxCollider
	public boolean handle(Camera being1, Being being2) {
		being1.addBeing(being2);
		return true;
	}


}
