package hermes;

import java.util.List;

/**
 * used to determine what should be drawn
 */
public class Camera {

	Rectangle screen; 	// camera dimensions
	double x, y;		// camera location in the world
	
	List<Being> beings;
	
	// translates from world coordinates to screen coordinates
	Pair<Integer,Integer> worldToScreenCoors(double x, double y) {
		return null;
	} 
	
}
