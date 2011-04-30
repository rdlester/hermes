package src.hermes.physics;

import src.hermes.*;
import processing.core.PVector;

public class MassedCollider implements Interactor<MassedBeing,MassedBeing> {
	
	public boolean detect(MassedBeing being1, MassedBeing being2) {
		// find the projection vector between the beings
		PVector projection = being1.getShape().projectionVector(being2.getShape());
		if(projection == null || being1==being2)
			return false;	// if they aren't colliding
		// store the collision
		MassedBeing.addCollision(being1, being2, projection);
		return true;
	}

	public boolean handle(MassedBeing being1, MassedBeing being2) {
		ImpulseCollision collision = being1.getCollisionWith(being2);
		collision.applyImpulses();
		return true;
	}

}
