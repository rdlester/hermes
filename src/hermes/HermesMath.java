package src.hermes;

import processing.core.*;

public class HermesMath {

	public static final float INFINITY = Float.POSITIVE_INFINITY;
	public static final float MINUS_INFINITY = Float.NEGATIVE_INFINITY;
	
	/**
	 * Rotates vector counter-clockwise by an angle theta
	 * Mutates the vector and returns it
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
	 * Rotates vector counter-clockwise by an angle theta
	 * Returns an entirely new vector (does not mutate)
	 * @param vector
	 * @param theta
	 * @return
	 */
	public static PVector getRotate(PVector vector, double theta) {
		float x = (float) (vector.x * Math.cos(theta) - vector.y * Math.sin(theta));
		float y = (float) (vector.x * Math.sin(theta) + vector.y * Math.cos(theta));
		return new PVector(x,y);
	}
	
	/**
	 * reverses the direction of a PVector in the coordinate system,
	 *  so the signs of each component are inverted
	 * @param vector	the vector to invert
	 * @return			the vector (not a new vector, merely a reference to the vector passed in)
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
	 * instantiates a new vector that is a carbon copy of a vector
	 * @param vector	the vector the copy
	 * @return			the new copy
	 */
	public static PVector cloneVector(PVector vector) {
		return new PVector(vector.x, vector.y, vector.z);
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

	/**
	 * returns the angle of the vector
	 * (1,0) is 0
	 * (0,1) is PI/2, etc.
	 * @param dir
	 * @return
	 */
	public static float angle(PVector dir) {
		float angle = (float) Math.atan2(dir.y, dir.x);
		if(angle < 0) {
			angle += Math.PI * 2;
			if( angle == Math.PI * 2) angle = 0;
			return angle;
		} 
		else {
			return angle;
		}
	}
	
	/**
	 * Determines if a point is inside a circle
	 * @param x - x location of point
	 * @param y - y location of point
	 * @param cirX - x location of center of circle
	 * @param cirY - y location of center of circle
	 * @param radius - radius of circle
	 * @return true if point is in circle, false otherwise
	 */
	public static boolean inCircle(float x, float y, float cirX, float cirY, float radius) {
		float distX = x - cirX;
		float distY = y - cirY;
		return distX*distX + distY*distY <= radius*radius;
	}
	
	/**
	 * Determines if a point is inside a circle
	 * @param point - location of point
	 * @param circleCenter - location of center of circle
	 * @param radius - radius of circle
	 * @return true if point is in circle, false otherwise
	 */
	public static boolean inCircle(PVector point, PVector circleCenter, float radius) {
		float distX = point.x - circleCenter.x;
		float distY = point.y - circleCenter.y;
		return distX*distX + distY*distY <= radius*radius;
	}
}
