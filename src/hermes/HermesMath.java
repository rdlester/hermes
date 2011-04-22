package src.hermes;

import processing.core.*;

public class HermesMath {

	/**
	 * reverses the direction of a PVector in the coordinate system,
	 *  so the signs of each component are inverted
	 * @param vector	the vector to invert
	 * @return			the vector (this is not a new vector, merely a reference to the vector passed in)
	 * example:
	 * 	<code>
	 * 	PVector v = new PVector(3,-2);
	 *  Math.reverse(v);
	 *  // v.x will now be -3, and v.y will be 2
	 *  </code>
	 */
	public static PVector reverse(PVector vector) {
		vector.x = -vector.x;
		vector.y = -vector.y;
		vector.z = -vector.z;
		return vector;
	}
	
	public static PVector zeroVector() {
		return new PVector(0,0,0);
	}
	
}
