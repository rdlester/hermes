package src.hermes;

public class CameraBeingInteractor extends BoundingBoxCollider<Camera, Being> {

	//detect has been implemented in BoundingBoxCollider
	public void handle(Camera being1, Being being2) {
		being1.addBeing(being2);
	}


}
