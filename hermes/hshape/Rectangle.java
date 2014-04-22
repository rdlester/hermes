package hermes.hshape;

import hermes.Hermes;
import processing.core.PApplet;
import processing.core.PVector;
import static hermes.HermesMath.*;

/**
 * Represents an axis-aligned bounding rectangle.
 */
public class Rectangle extends HShape {

	private PVector _min, _max;

	public static int mode = 0;

	/**
	 * Creates a new Rectangle based on current rectMode.
	 * <p>
	 * Default - a and b define the upper left corner, and c and d are width and height,
	 * see Processing reference on rectMode() for details on other modes.
	 * @param a
	 * @param b
	 * @param c
	 * @param d
	 */
	public Rectangle(float a, float b, float c, float d) {
		super(new PVector(a,b,0));
		PApplet p = Hermes.getPApplet();
		if(p != null) {
			switch(p.g.rectMode) {
			case PApplet.CORNER:
				_min = zeroVector();
				_max = new PVector(c,d);
				break;
			case PApplet.CENTER:
				_min = new PVector(-c/2,-d/2);
				_max = new PVector(c/2,d/2);
				break;
			case PApplet.CORNERS:
				_min = zeroVector();
				_max = new PVector(c-a,d-b);
				break;
			case PApplet.RADIUS:
				_min = new PVector(-c,-d,0);
				_max = new PVector(c,d,0);
				break;
			}
		} else {
			_min = zeroVector();
			_max = new PVector(c,d);
		}
	}
	
	/**
	 * Creates a new Rectangle based on current rectMode.
	 * <p>
	 * Default - ab.x and ab.y define the upper left corner, and c and d are width and height,
	 * see Processing reference on rectMode() for details on other modes.
	 * @param ab
	 * @param c
	 * @param d
	 */
	public Rectangle(PVector ab, float c, float d) {
		this(ab.x, ab.y, c, d);
	}
	
	/**
	 * Creates a new Rectangle based on current rectMode.
	 * <p>
	 * Default - ab.x and ab.y define the upper left corner, and cd.x and cd.y are width and height
	 * see Processing reference on rectMode() for details on other modes
	 * @param ab
	 * @param cd
	 */
	public Rectangle(PVector ab, PVector cd) {
		this(ab.x, ab.y, cd.x, cd.y);
	}
	
	/**
	 * Creates a new Rectangle.
	 * <p>
	 * Directly assigns fields, does not link with rectMode.
	 * @param position - position of rectangle
	 * @param min - location of top left corner in relation to position
	 * @param max - location of bottom right corner in relation to position
	 */
	public Rectangle(PVector position, PVector min, PVector max) {
		super(position);
		_min = min;
		_max = max;
	}

	/** 
	 * @return Position of corner with lowest x,y values in Rectangle coordinates (shape's position is (0,0)).
	 */
	public PVector getMin() {
		return _min;
	}

	/**
	 * @return Position of corner with highest x,y values in Rectangle coordinates (shape's position is (0,0)).
	 */
	public PVector getMax() {
		return _max;
	}

	/**
	 * @return Position of corner with lowest x,y values in world coordinates.
	 */
	public PVector getAbsMin() {
		return PVector.add(_min, _position);
	}
	
	/** 
	 * @return Position of corner with highest x,y values in world coordinates.
	 */
	public PVector getAbsMax() {
		return PVector.add(_max, _position);
	}
	
	public float getWidth() {
		return _max.x - _min.x;
	}
	
	public float getHeight() {
		return _max.y - _min.y;
	}
	
	/**
	 * @return	The absolute position of the rectangle's geometric center. 
	 */
	public PVector getCenter() {
		PVector center = PVector.add(_max, _min); 
		center.mult(0.5f);
		center.add(_position);
		return center;
	}

	/**
	 * Scales the rectangle's width and height about its position.
	 * @param xScale	the x-axis scale factor
	 * @param yScale	the y-axis scale factor
	 */
	public void scale(float xScale, float yScale) {
		assert xScale > 0 : "scale: xScale must be greater than zero";
		assert yScale > 0 : "scale: yScale must be greater than zero";

		_min.x *= xScale;
		_max.x *= xScale;
		_min.y *= yScale;
		_max.y *= yScale;
	}

	@Override
	public PVector projectionVector(HShape other) {
		assert other != null : "Rectangle.projectionVector: other must be a valid rectangle";
		PVector opposite = other.projectionVector(this);
		return opposite == null ? null : reverse(opposite);
	}

	@Override
	public PVector projectionVector(Circle other) {
		PVector opposite = other.projectionVector(this);
		return opposite == null ? null : reverse(opposite);
	}

	@Override
	public PVector projectionVector(Polygon other) {
		PVector opposite = other.projectionVector(this);
		return opposite == null ? null : reverse(opposite);
	}

	@Override
	public PVector projectionVector(Rectangle other) {
		if(other == this)	// no self-projection
			return null;
		// calculate the distance between rect centers
		PVector center1 = getCenter();
		PVector center2 = other.getCenter();
		float xDist = center1.x - center2.x;
		float yDist = center1.y - center2.y;
		// the projection is distance minus combined side length
		float xProject = Math.abs(xDist) - (_max.x - _min.x + other._max.x - other._min.x)/2;
		float yProject = Math.abs(yDist) - (_max.y - _min.y + other._max.y - other._min.y)/2;
		// they collide if they overlap on both axes
		if( xProject > 0 || yProject > 0)
			return null;
		// the projection vector is the smallest projection, in direction opposite the distance vector
		return (xProject > yProject ? 
				new PVector(xProject * sign(xDist), 0.0f) : 
					new PVector(0.0f, yProject * sign(yDist))); 
	}	

	@Override
	public Rectangle getBoundingBox() {
		return this;
	}
	
	/**
	 * Whether this rectangle completely encloses another 
	 * (no part of other protrudes from this).
	 * @param other		the other rectangle
	 * @return			whether it is completely contained
	 */
	public boolean contains(Rectangle other) {
		float minX1 = getAbsMin().x;
		float minY1 = getAbsMin().y;
		float maxX1 = getAbsMax().x;
		float maxY1 = getAbsMax().y;
		float minX2 = other.getAbsMin().x;
		float minY2 = other.getAbsMin().y;
		float maxX2 = other.getAbsMax().x;
		float maxY2 = other.getAbsMax().y;
		
		return minX1 <= minX2 && minY1 <= minY2 &&
				maxX1 >= maxX2 && maxY1 >= maxY2;
	}

	@Override
	public boolean contains(float x, float y) {
		return x >= getAbsMin().x && y >= getAbsMin().y && x <= getAbsMax().x && y <= getAbsMax().y;
	}
	
	@Override
	public boolean contains(PVector point) {
		return contains(point.x, point.y);
	}
	
	@Override
	public void draw() {
		Hermes.getPApplet().rect(_min.x,_min.y,_max.x-_min.x,_max.y-_min.y);
	}

	@Override
	public String toString() {
		return "Position:" + _position + "\nMin:" + _min + "\nMax:" + _max;
	}
}
