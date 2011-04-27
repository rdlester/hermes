package src.hermes;

public class CameraBeingInteractor extends BoundingBoxCollider<Camera, Being> {

	//detect has been implemented in BoundingBoxCollider
	public boolean handle(Camera being1, Being being2) {
		being1.addBeing(being2);
		return true;
	}


}
