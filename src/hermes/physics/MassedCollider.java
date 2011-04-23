package src.hermes.physics;

import src.hermes.*;
import processing.core.PVector;

public class MassedCollider implements Interactor<MassedBeing,MassedBeing> {
	
	@Override
	public boolean detect(MassedBeing being1, MassedBeing being2) {
		// find the projection vector between the beings
		PVector projection = being1.getShape().projectionVector(being2.getShape());
		if(projection == null)
			return false;	// if they aren't colliding
		// store the collision
		MassedBeing.addCollision(being1, being2, projection);
		return true;
	}

	@Override
	public void handle(MassedBeing being1, MassedBeing being2) {
		
	}

}
