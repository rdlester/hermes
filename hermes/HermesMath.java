package hermes;

import processing.core.*;

/**
 * A collection of helpful math utilities.
 * <p>
 * <i>HINT:</i> Use <code>import static hermes.HermesMath.*;</code>
 * to access these methods like you would Processing library functions.
 */
public class HermesMath {

	public static final float INFINITY = Float.POSITIVE_INFINITY;
	public static final float MINUS_INFINITY = Float.NEGATIVE_INFINITY;
	
	/**
	 * Rotates vector counter-clockwise by an angle theta;
	 * mutates the vector and returns it.
	 * @param vector	the vector to rotate
	 * @param theta		the angle to rotate counter-clockwise by
	 * @return			the rotated vector (not a new vector, merely a reference to the vector passed in)
	 */
	public static PVector rotate(PVector vector, double theta) {
		float x = (float) (vector.x * Math.cos(theta) - vector.y * Math.sin(theta));
		float y = (float) (vector.x * Math.sin(theta) + vector.y * Math.cos(theta));
		vector.set(x, y, 0);
		return vector;
	}
	
	/**
	 * Same as rotate() but returns an entirely new vector
	 * (does not mutate).
	 * @param vector	the vector to rotate
	 * @param theta		the angle to rotate counter-clockwise by
	 * @return			the new rotated vector
	 * @see				hermes.HermesMath#rotate(PVector, double)
	 */
	public static PVector getRotate(PVector vector, double theta) {
		float x = (float) (vector.x * Math.cos(theta) - vector.y * Math.sin(theta));
		float y = (float) (vector.x * Math.sin(theta) + vector.y * Math.cos(theta));
		return new PVector(x,y);
	}
	
	/**
	 * Reverses the direction of a PVector in the coordinate system,
	 * so the signs of each component are inverted;
	 * returns a mutated vector.
	 * <p>
	 * Example:
	 * 	<code>
	 * 	PVector v = new PVector(3,-2);
	 *  Math.reverse(v);
	 *  // v.x will now be -3, and v.y will be 2
	 *  </code>
	 * @param vector	the vector to invert
	 * @return			the vector (not a new vector, merely a reference to the vector passed in)
	 */
	public static PVector reverse(PVector vector) {
		vector.x = -vector.x;
		vector.y = -vector.y;
		vector.z = -vector.z;
		return vector;
	}
	
	/**
	 * Same as reverse(), but does not modify vector.
	 * @param vector	the vector to invert
	 * @return			a new vector that points in the opposite direction of vector
	 * @see				hermes.HermesMath#reverse(PVector)
	 */
	public static PVector getReverse(PVector vector) {
		return new PVector(-vector.x, -vector.y, -vector.z);
	}
	
	/**
	 * Creates a new PVector at (0,0,0).
	 * @return zero vector
	 */
	public static PVector zeroVector() {
		return new PVector(0,0,0);
	}
	
	/**
	 * Mutates a vector to the zero vector
	 * @param vector	the vector
	 * @return			the altered vector
	 */
	public static PVector zeroVector(PVector vector) {
		vector.set(0,0,0);
		return vector;
	}
	
	/**
	 * Factory method for creating PVectors
	 * @param x
	 * @param y
	 * @param z
	 * @return PVector
	 */
	public static PVector makeVector(float x, float y, float z) {
		return new PVector(x,y,z);
	}
	
	public static PVector makeVector(float x, float y) {
		return new PVector(x,y,0.0f);
	}
	
	public static PVector makeVector(double x, double y, double z) {
		return new PVector((float)x,(float)y,(float)z);
	}
	
	public static PVector makeVector(double x, double y) {
		return new PVector((float)x,(float)y,0.0f);
	}
	
	/**
	 * Instantiates a new vector that is a carbon copy of a given vector.
	 * @param vector	the vector to copy
	 * @return			the new copy
	 */
	public static PVector cloneVector(PVector vector) {
		return new PVector(vector.x, vector.y, vector.z);
	}
	
	/**
	 * Gets the square of the magnitude of a PVector.
	 * Useful when taking the square root to find the true magnitude is not important,
	 * ie. when trying to identify the largest or smallest PVector in a set
	 * (saves time).
	 * @param 	vector
	 * @return	The square of the magnitude of the vector
	 */
	public static float mag2(PVector vector) {
		return vector.x * vector.x + vector.y * vector.y + vector.z * vector.z; 
	}
	
	/**
	 * Returns the sign of a float, assigns zero a sign of one.
	 * @param x		the float
	 * @return		1 if x is positive or zero, -1 if x is negative
	 */
	public static float sign(float x) {
		return (x < 0 ? -1.0f : 1.0f);
	}
	
	/**
	 * Averages two float values.
	 * @param v1	the first value
	 * @param v2	the second value
	 * @return		the average
	 */
	public static float average(float v1, float v2) {
		return (v1 + v2) / 2.0f;
	}
	
	/**
	 * Averages an array of floats.
	 * @param values	the values to average
	 * @return			the average
	 */
	public static float average(float[] values) {		
		float acc = 0;
		for(int i = 0; i < values.length; i++) 
			acc += values[i];
		return acc / values.length;
	}

	/**
	 * Returns the angle of the vector.
	 * <p>
	 * (1,0) is 0, (0,1) is PI/2, etc.
	 * @param dir	the vector
	 * @return		angle
	 */
	public static float angle(PVector dir) {
		float angle = (float) Math.atan2(dir.y, dir.x);
		return (angle < 0 ? angle + (float)Math.PI * 2 : angle);
	}
	
	/**
	 * Determines if a point is inside a circle.
	 * @param x			x location of point
	 * @param y			y location of point
	 * @param cirX		x location of center of circle
	 * @param cirY		y location of center of circle
	 * @param radius	radius of circle
	 * @return			true if point is in circle, false otherwise
	 */
	public static boolean inCircle(float x, float y, float cirX, float cirY, float radius) {
		float distX = x - cirX;
		float distY = y - cirY;
		return distX*distX + distY*distY <= radius*radius;
	}
	
	/**
	 * Determines if a point is inside a circle.
	 * @param point			location of point
	 * @param circleCenter	location of center of circle
	 * @param radius		radius of circle
	 * @return 				true if point is in circle, false otherwise
	 */
	public static boolean inCircle(PVector point, PVector circleCenter, float radius) {
		float distX = point.x - circleCenter.x;
		float distY = point.y - circleCenter.y;
		return distX*distX + distY*distY <= radius*radius;
	}
}
