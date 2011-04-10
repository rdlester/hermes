package src.hermes;

import java.util.List;
import processing.core.*;

/**
 * used to determine what should be drawn
 */
public class Camera {
	
	Rectangle screen; 	// camera dimensions
	float x, y;		// camera location in the world
	
	List<Being> beings;
	
	// translates from world coordinates to screen coordinates
	Pair<Integer,Integer> worldToScreenCoors(float x, float y) {
		return null;
	}
	
	
}
