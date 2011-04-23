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
	
	/**
	 * as reverse(), but does not modify vector, instead returns a new vector that is opposite vector
	 * @param vector	the vector to find the reverse of
	 * @return			a new vector that points in the opposite direction of vector
	 */
	public static PVector getReverse(PVector vector) {
		return new PVector(-vector.x, -vector.y, -vector.z);
	}
	
	/**
	 * creates a new PVector at (0,0,0)
	 * @return
	 */
	public static PVector zeroVector() {
		return new PVector(0,0,0);
	}
	
	/**
	 * sets a vector to the zero vector
	 * @param vector	the vector
	 * @return			the vector 
	 */
	public static PVector zeroVector(PVector vector) {
		vector.set(0,0,0);
		return vector;
	}
	
	/**
	 * Gets the square of the magnitude of a PVector
	 * Useful when taking the square root to find the true magnitude is not important
	 * (saves time)
	 * @param vector
	 * @return
	 */
	public static float mag2(PVector vector) {
		return vector.x * vector.x + vector.y * vector.y + vector.z * vector.z; 
	}
	
	/**
	 * returns the sign of a float, assigns zero a sign of one
	 * @param x		the float
	 * @return		1 if x is positive or zero, -1 if x is negative
	 */
	public static float sign(float x) {
		return (x < 0 ? -1.0f : 1.0f);
	}
	
	/**
	 * averages two float values
	 * @param v1	the first value
	 * @param v2	the second value
	 * @return		the average
	 */
	public static float average(float v1, float v2) {
		return (v1 + v2) / 2.0f;
	}
	
	/**
	 * averages an array of floats
	 * @param values	the values to average
	 * @return			the average
	 */
	public static float average(float[] values) {		
		float acc = 0;
		for(int i = 0; i < values.length; i++) 
			acc += values[i];
		return acc / values.length;
	}
	
}
