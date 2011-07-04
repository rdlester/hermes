package src.hermes.shape;

import processing.core.PApplet;
import processing.core.PVector;
import src.hermes.Hermes;
import static src.hermes.HermesMath.*;

/**
 * represents an axis-aligned bounding rectangle
 * @author Sam
 *
 */
public class Rectangle extends HShape {

	private PVector _min, _max;

	public static final int TOP_LEFT = 0;
	public static final int CENTER = 1;
	
	public static int mode = 0;

	/**
	 * Creates a new Rectangle
	 * Constructor Syntax depends on current rectMode
	 * Default - a and b define the upper left corner, and c and d are width and height
	 * see Processing reference on rectMode() for details on other modes
	 * @param position - position of rectangle
	 * @param a
	 * @param b
	 * @param c
	 * @param d
	 */
	public Rectangle(PVector position, float a, float b, float c, float d) {
		super(position);
		int Pmode = Hermes.getPApplet().g.rectMode;
		switch(Pmode) {
		case PApplet.CORNER:
			_min = new PVector(a,b,0);
			_max = new PVector(a+c,b+d,0);
			break;
		case PApplet.CENTER:
			_min = new PVector(a-c/2,b-d/2,0);
			_max = new PVector(a+c/2,b+d/2,0);
			break;
		case PApplet.CORNERS:
			_min = new PVector(a,b,0);
			_max = new PVector(c,d,0);
			break;
		case PApplet.RADIUS:
			_min = new PVector(a-c,b-d,0);
			_max = new PVector(a+c,b+d,0);
			break;
		}
	}
	
	/**
	 * Creates a new Rectangle
	 * Constructor Syntax depends on current rectMode
	 * Default - ab.x and ab.y define the upper left corner, and c and d are width and height
	 * see Processing reference on rectMode() for details on other modes
	 * @param position - position of rectangle
	 * @param ab
	 * @param c
	 * @param d
	 */
	public Rectangle(PVector position, PVector ab, float c, float d) {
		this(position, ab.x, ab.y, c, d);
	}
	
	/**
	 * Creates a new Rectangle
	 * Constructor Syntax depends on current rectMode
	 * Default - ab.x and ab.y define the upper left corner, and cd.x and cd.y are width and height
	 * see Processing reference on rectMode() for details on other modes
	 * @param position - position of rectangle
	 * @param ab
	 * @param cd
	 */
	public Rectangle(PVector position, PVector ab, PVector cd) {
		this(position, ab.x, ab.y, cd.x, cd.y);
	}
	
	
	/**
	 * creates a new Rectangle defined by a position and two point coordinates
	 * note that position, min and max will be stored as references, so changing them later will change the rectangle
	 * @param position	the position of the rectangle
	 * @param min		the position of the corner with the lowest x,y values
	 * @param max		the position of the corner with the highest x,y values
	 */
//	public Rectangle(PVector position, PVector min, PVector max) {
//		super(position);
//
//		assert min != null : "In Rectangle constructor: min must be a valid PVector";
//		assert max != null : "In Rectangle constructor: max must be a valid PVector";
//		assert min.x < max.x && min.y < max.y : "In Rectangle contructor: min must have a lower x,y position than max";
//
//		_min = min; 
//		_max = max;
//	}
//
//	/**
//	 * creates a Rectangle defined by a position, representing its center, and a width a height
//	 * note: position will be stored as a reference, so changing it will move the rectangle
//	 * @param position	the top-left position of the rectangle
//	 * @param width		the width of the rectangle (must be positive)
//	 * @param height	the height of the rectangle (must be positive)
//	 */
//	public Rectangle(PVector position, float width, float height) {
//		this(position, new PVector(width,height,0.0f),PApplet.CORNER);
//	}
//
//
//	/**
//	 * creates a Rectangle defined by a position, representing its center, and a width a height
//	 * note: position will be stored as a reference, so changing it will move the rectangle
//	 * @param x				the x coordinate of the upper left corner of the rectangle
//	 * @param y				the y coordinate of the upper left corner of the rectangle
//	 * @param width		the width of the rectangle (must be positive)
//	 * @param height	the height of the rectangle (must be positive)
//	 */
//	public Rectangle(float x, float y, float width, float height) {
//		this(new PVector(x, y), new PVector(width,height,0.0f),PApplet.CORNER);
//	}
//	
//	
//
//	/**
//	 * creates a Rectangle defined by a position, representing its center, and a width a height
//	 * note: position will be stored as a reference, so changing it will move the rectangle
//	 * @param x				the x coordinate of the upper left corner of the rectangle
//	 * @param y				the y coordinate of the upper left corner of the rectangle
//	 * @param width		the width of the rectangle (must be positive)
//	 * @param height	the height of the rectangle (must be positive)
//	 * @param mode 		the rect mode to use 'CORNER' or 'CENTER' 
//	 */
//	public Rectangle(float x, float y, float width, float height, int mode) {
//		this(new PVector(x, y), new PVector(width,height,0.0f),mode);
//	}
//	
//
//
//	/**
//	 * 
//	 * @param position
//	 * @param width
//	 * @param height
//	 * @param origin
//	 */
//	public Rectangle(PVector position, PVector dimensions, int mode) {
//		super(position);
//
//		float width = dimensions.x;
//		float height = dimensions.y;
//
//		assert width > 0: "Rectangle constructor: width must be positive";
//		assert height > 0: "Rectangle constructor: height must be positive";
//
//		if(mode == PApplet.CORNER) {
//			_min = zeroVector();
//			_max = new PVector(width, height);
//		} else if(mode == PApplet.CENTER) {
//			_min = new PVector(-width / 2, -height / 2);
//			_max = new PVector(width / 2, height / 2);
//		}
//	}
	

	/**
	 * Getter for position of corner with lowest x,y values
	 * @return
	 */
	public PVector getMin() {
		return _min;
	}

	/**
	 * Getter for position of corner with highest x,y values
	 * @return
	 */
	public PVector getMax() {
		return _max;
	}

	public PVector getAbsMin() {
		return PVector.add(_min, _position);
	}
	
	public PVector getAbsMax() {
		return PVector.add(_max, _position);
	}
	
	public float getRectWidth() {
		return _max.x - _min.x;
	}
	
	public float getRectHeight() {
		return _max.y - _min.y;
	}
	
	/**
	 * @return	the absolute position of the rectangle's geometric center 
	 */
	public PVector getCenter() {
		PVector center = PVector.add(_max, _min); 
		center.mult(0.5f);
		center.add(_position);
		return center;
	}

	/**
	 * scales the rectangle's width and height about its position
	 * @param xScale	the x-axis scale factor
	 * @param yScale	the y-axis scale factor
	 */
	public void scale(float xScale, float yScale) {
		assert xScale > 0 : "scale: xScale must be greater than zero";
		assert yScale > 0 : "scale: yScale must be greater than zero";

		_min.x *= xScale;
		_max.x *= xScale;
		_min.y *= yScale;
		_min.y *= yScale;
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

	public Rectangle getBoundingBox() {
		return this;
	}
	
	/**
	 * whether this rectangle completely encloses another 
	 * (no part of other protrudes from this)
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

	/**
	 * whether the Rectangle contains the given point coordinates (boundary is inclusive)
	 * @param x		the x coordinate
	 * @param y		the y coordinate
	 * @return		true if (x,y) lies within the Rectangle
	 */
	public boolean contains(float x, float y) {
		return x >= getAbsMin().x && y >= getAbsMin().y && x <= getAbsMax().x && y <= getAbsMax().y;
	}
	
	/**
	 * whether the Rectangle contains the given point vector (boundary is inclusive)
	 * @param point		the point vector
	 * @return			true if (x,y) lies within the Rectangle
	 */
	public boolean contains(PVector point) {
		return contains(point.x, point.y);
	}
	
	public void draw() {
		Hermes.getPApplet().rect(_min.x,_min.y,_max.x-_min.x,_max.y-_min.y);
	}

	@Override
	public String toString() {
		return "Position:" + _position + "\nMin:" + _min + "\nMax:" + _max;
	}
}
