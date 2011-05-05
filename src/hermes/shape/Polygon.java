package src.hermes.shape;

import java.util.ArrayList;
import java.util.Iterator;

import processing.core.PVector;
import src.hermes.HermesMath;
import static src.hermes.HermesMath.*;

/**
 * Represents an arbitrary convex polygon
 * Position represents 'center'
 * 
 * Vertex Points are positioned relative center
 * Each point is assumed to be next to points before and after it in list
 * Make sure your List of points is ordered correctly!
 * 
 * A Polygon must be convex,
 * Concave polygons will break collision detection.
 * CompoundShape must be used for concave polygons.
 * @author Ryan
 *
 */
public class Polygon extends Shape {
	
	//Stores unit vectors representing direction of axes normal to edges of polygon
	//Used for collision detection (SAT)
	private ArrayList<PVector> _axes;
	//Stores the vertex points defining the polygon
	private ArrayList<PVector> _points;
	
	/**
	 * Constructor for Polygon
	 * List of vertex points must be ordered such that
	 * each point is connected to points before and after it in list
	 * @param position - Reference to Shape's position
	 * @param points - List of vertex points defined relative to position, must be ordered
	 */
	public Polygon(PVector position, ArrayList<PVector> points) {
		super(position);
		
		assert points != null : "In Polygon constructor, points must be valid List";
		assert points.size() > 2 : "In Polygon constructor, points must contain at least three point";
		
		_points = points;
		
		//Create the list of lines in the polygon
		_axes = new ArrayList<PVector>();
		Iterator<PVector> pit = _points.iterator();
		PVector first = pit.next();
		PVector pre2 = first;
		PVector second = pit.next();
		PVector pre = second;
		while(pit.hasNext()) {
			PVector p = pit.next();
			addAxis(p, pre, pre2);
			pre2 = pre;
			pre = p;
		}

		//Make the final lines between the first and the last point and first and second points
		addAxis(first, pre, second);
		addAxis(second,first,pre);
	}
	
	/**
	 * Given two points, finds the 'axis' normal to the line between them
	 * and adds it to an internal list
	 * @param start
	 * @param end
	 * @param preStart - the extra point used to correctly orient axis
	 */
	private void addAxis(PVector start, PVector end, PVector preStart) {
		PVector axis = PVector.sub(start, end);
		axis.normalize();
		axis = HermesMath.rotate(axis,Math.PI/2);
		float project1 = axis.dot(start);
		float projectpre = axis.dot(preStart);
		assert project1 != projectpre : "Polygon must be convex!";
		if(project1 < projectpre) {
			reverse(axis);
		}
		_axes.add(axis);
	}
	
	/**
	 * Getter for list of vertex points
	 * @return _points
	 */
	public ArrayList<PVector> getPoints() {
		return _points;
	}
	
	/**
	 * Adds a point to the polygon
	 * Point is assumed to be connected to the last point added
	 * and the first point added
	 * @param point - point to be added
	 */
	public void addPoint(PVector point) {
		//Remove the axis for the edge between the current first and last points
		_axes.remove(_axes.size());
		
		PVector first = _points.get(0);
		PVector last = _points.get(_points.size()-1);
		
		addAxis(first, point, last);
		addAxis(point, last, first);
		_points.add(point);
	}
	
	/**
	 * Getter for axes list - only for internal use within shape classes
	 * @return _axes
	 */
	protected ArrayList<PVector> getAxes() {
		return _axes;
	}
	
	/**
	 * Rotates polygon counter-clockwise around polygon's position ((0,0) in polygon coordinates)
	 * @param theta
	 */
	public void rotate(double theta) {
		for(PVector p : _points) {
			HermesMath.rotate(p,theta);
		}
	}
	
	/**
	 * Rotates polygon counter-clockwise around given position in polygon coordinates (same coordinates defining location of points)
	 * @param position
	 * @param theta
	 */
	public void rotate(PVector position, double theta) {
		for(PVector p : _points) {
			//translate points into coordinates where position is now (0,0)
			PVector translatedP = PVector.sub(p, position);
			HermesMath.rotate(translatedP, theta);
			//translate back
			p.add(position);
		}
	}
	
	/**
	 * Rotates polygon counter-clockwise around given position in world coordinates
	 */
	public void rotateInWorld(PVector position, double theta) {
		//map given world location into polygon coordinates
		PVector polyLoc = PVector.sub(_position, position);
		rotate(polyLoc,theta);
	}
	
	@Override
	public boolean collide(Shape other) {
		assert other != null : "Polygon.collide: other must be a valid Shape";
		return other.projectionVector(this) != null;
	}
	
	public boolean collide(Rectangle other) {
		return projectionVector(other) != null;
	}
	public boolean collide(Circle other) {
		return projectionVector(other) != null;
	}
	public boolean collide(Polygon other) {
		return projectionVector(other) != null;
	}
	
	public Rectangle getBoundingBox() {
		float xMax = Float.NEGATIVE_INFINITY;
		float xMin = Float.POSITIVE_INFINITY;
		float yMax = Float.NEGATIVE_INFINITY;
		float yMin = Float.POSITIVE_INFINITY;
		for(Iterator<PVector> iter = _points.iterator(); iter.hasNext(); ) {
			PVector point = iter.next();
			if(point.x < xMin)
				xMin = point.x;
			if(point.x > xMax)
				xMin = point.x;
			if(point.y < yMin)
				yMin = point.y;
			if(point.y > yMax)
				yMin = point.y;
		}
		PVector min = makeVector(xMin, yMin);
		PVector max = makeVector(xMax, yMax);
		return new Rectangle(_position, min, max);
	}
	
	@Override
	public PVector projectionVector(Shape other) {
		assert other != null : "Polygon.projectionVector: other must be a valid Shape";
		return reverse(other.projectionVector(this));
	}
	
	/**
	 * Collides a polygon and a rectangle
	 * by turning the rectangle into a polygon
	 * and using the polygon collide method
	 * @param other
	 * @return
	 */
	public PVector projectionVector(Rectangle other) {
		//Turn Rectangle into a Polygon
		PVector otherPos = other.getPosition();
		PVector min = other.getMin();
		PVector max = other.getMax();
		PVector v2 = new PVector(min.x, max.y);
		PVector v4 = new PVector(max.x, min.y);
		ArrayList<PVector> points = new ArrayList<PVector>();
		points.add(min);
		points.add(v2);
		points.add(max);
		points.add(v4);	
		Polygon rect = new Polygon(otherPos, points);
		
		return projectionVector(rect);
	}
	
	public PVector projectionVector(Circle other) {
		//Get distance between shapes
		PVector dist = PVector.sub(_position, other.getPosition());
		ArrayList<PVector> resolutionList = new ArrayList<PVector>();
		
		PVector center = other.getCenter();
		float radius = other.getRadius();
		
		//Check for collision along all axes in this polygon
		for(PVector axis : _axes) {
			PVector result = checkSepAxis(axis, dist, center, radius);
			if(result == null) return null;
			else resolutionList.add(result);
		}
		
		center.sub(dist);
		PVector pre = _points.get(1);
		PVector sidePre = PVector.sub(pre, _points.get(0));
		sidePre.normalize();
		
		int size = _points.size();
		for(int i = 2; i < size + 2; i++) {
			PVector p = _points.get(i % size);
			PVector side = PVector.sub(p, pre);
			side.normalize();
			if(checkEdge(center, pre, sidePre, side)) {
				//Check if distance between center and vertex is less than radius
				PVector axis = PVector.sub(center, pre);
				float overlap = other.getRadius() - axis.mag(); 
				if(overlap >= 0) {
					//Create and return projection vector
					axis.normalize();
					axis.mult(overlap);
					resolutionList.add(axis);
				}
			}
		}
		
		//Figure out which resolution vector is smallest
		float min = Float.MAX_VALUE;
		PVector use = null;
		for(PVector resolution : resolutionList) {
			float temp = mag2(resolution);
			if(temp < min) {
				min = temp;
				use = resolution;
			}
		}
		return use;
	}
	
//	/**
//	 * Gets the projection vector moving a circle out of this polygon
//	 * Returns null if shapes are not colliding
//	 * Uses voronoi region method
//	 * @param other
//	 * @return projection vector moving other out of this
//	 */
//	public PVector projectionVector(Circle other) {
//		
//		//Get position of center of circle and subtract position of polygon from it to move it in range of points
//		PVector otherPos = PVector.add(other.getCenter(), other.getPosition());
//		otherPos.sub(_position);
//		
//		//TODO figure out if circle center is inside polygon
//		
//		//Get initial points and side
//		PVector pre = _points.get(1);
//		PVector sidePre = PVector.sub(pre, _points.get(0));
//		sidePre.normalize();
//		
//		//Iterate through all the sides + verticies of polygon
//		int size = _points.size();
//		for(int i = 2; i < size + 2; i++) {
//			//Get next point and side
//			PVector p = _points.get(i % size);
//			PVector side = PVector.sub(p, pre);
//			side.normalize();
//			
//			//Check if circle is in voronoi region of vertex
//			if(checkEdge(otherPos, pre, sidePre, side)) {
//				//Check if distance between center and vertex is less than radius
//				PVector axis = PVector.sub(otherPos, pre);
//				float overlap = other.getRadius() - axis.mag(); 
//				if(overlap >= 0) {
//					//Create and return projection vector
//					axis.normalize();
//					axis.mult(overlap);
//					return axis;
//				}
//				else return null;
//			}
//			
//			//Check if circle is in voronoi region of side
//			if(check(otherPos, pre, p, side)) {
//				//Get the corresponding axis from internal list
//				PVector axis = _axes.get((i-2) % size);
//				//Project side and circle onto axis, then check if distance is less than radius
//				float radius = other.getRadius();
//				float projP = p.dot(axis);
//				float projPos = otherPos.dot(axis);
//				float overlap = radius - (Math.abs(projPos) - Math.abs(projP));
//				if(overlap >= 0 && overlap <= radius*2) {
//					//Create and return projection vector
//					return PVector.mult(axis, overlap);
//				}
////				else return null;
//			}
//			
//			sidePre = side;
//			pre = p;
//		}
//		
//		//THIS SHOULD NEVER HAPPEN
////		System.err.println("Circle is not in any voronoi region");
//		return null;
//	}

	private PVector checkSepAxis(PVector axis, PVector dist, PVector center, float radius) {
		PVector project1 = getProjection(axis, this);
		PVector project2 = getProjection(axis, center, radius);
		
		//Offset projection of this away from other
		float offset = PVector.dot(dist,axis);
		project1.add(offset, offset, 0);
		
		//Check if they are separated along axis
		float top = project1.x - project2.y;
		float bottom = project2.x - project1.y;
		if(top > 0 ||  bottom > 0) {
			//Found a separating axis! Not colliding.
			return null;
		}
		
		else {
			return (Math.abs(top) > Math.abs(bottom) ?
					PVector.mult(axis, -bottom):
					PVector.mult(axis, -top));
		}
	}

	private boolean check(PVector otherPos, PVector pre, PVector p, PVector line) {
		
		float projPos = otherPos.dot(line);
		float projPre = pre.dot(line);
		float projP = p.dot(line);
		
		return (projPos <= projP && projPre <= projPos);
	}

	private boolean checkEdge(PVector otherPos, PVector pre, PVector linePre, PVector line) {
		
		float projPre1 = pre.dot(linePre);
		float projPre2 = pre.dot(line);
		float projPos1 = otherPos.dot(linePre);
		float projPos2 = otherPos.dot(line);
		
		return (projPos1 > projPre1 && projPos2 < projPre2);
	}

	/**
	 * Collides two polygons using SAT
	 * Projects polygons along each axis, and checks projections collide
	 * If polygons do not collide along an axis, escapes check and returns false
	 * @param other
	 * @return
	 */
	public PVector projectionVector(Polygon other) {
		//Get distance between polygons
		PVector dist = PVector.sub(_position, other.getPosition());
		ArrayList<PVector> resolutionList = new ArrayList<PVector>();
		
		//Check for collision along all axes in this polygon
		for(PVector axis : _axes) {
			PVector result = checkSepAxis(axis, dist, other);
			if(result == null) return null;
			else resolutionList.add(result);
		}
		
		//Check for collision along all axes in other polygon
		ArrayList<PVector> axes = other.getAxes();
		for(PVector axis : axes) {
			PVector result = checkSepAxis(axis, dist, other);
			if(result == null) return null;
			else resolutionList.add(result);
		}
		
		//Figure out which resolution vector is smallest
		float min = Float.MAX_VALUE;
		PVector use = null;
		for(PVector resolution : resolutionList) {
			float temp = mag2(resolution);
			if(temp < min) {
				min = temp;
				use = resolution;
			}
		}
		return use;
	}
	
	/**
	 * Checks if this polygon and other polygon collide along given axis
	 * @param axis - axis to check projections on
	 * @param dist - distance between polygons
	 * @param other - the other polygon
	 * @return
	 */
	private PVector checkSepAxis(PVector axis, PVector dist, Polygon other) {
		PVector project1 = getProjection(axis, this);
		PVector project2 = getProjection(axis, other);
		
		//Offset projection of this away from other
		float offset = PVector.dot(dist,axis);
		project1.add(offset, offset, 0);
		
		//Check if they are separated along axis
		float top = project1.x - project2.y;
		float bottom = project2.x - project1.y;
		if(top > 0 ||  bottom > 0) {
			//Found a separating axis! Not colliding.
			return null;
		}
		
		else {
			return (Math.abs(top) > Math.abs(bottom) ?
					PVector.mult(axis, -bottom):
					PVector.mult(axis, -top));
		}
	}
	
	/**
	 * Projects polygon onto given axis
	 * @param axis
	 * @param poly
	 * @return PVector with min as x, max as y 
	 */
	private PVector getProjection(PVector axis, Polygon poly) {
		float min;
		float max;
		
		Iterator<PVector> points = poly.getPoints().iterator();
		PVector pInit = points.next();
		min = pInit.dot(axis);
		max = min;
		
		while(points.hasNext()) {
			PVector p = points.next();
			float project = p.dot(axis);
			if(project < min) min = project;
			if(max < project) max = project;
		}
		
		return new PVector(min,max);
	}
	
	/**
	 * Projects circle onto given axis
	 * @param axis
	 * @param center
	 * @param radius
	 * @return PVector with min as x, max as y
	 */
	private PVector getProjection(PVector axis, PVector center, float radius) {
		float project = center.dot(axis);
		float min = project - radius;
		float max = project + radius;
		return new PVector(min,max);
	}
	
	@Override
	public String toString() {
		String output = "Position:" + _position;
		for(PVector p : _points) {
			output += "\nPoint:" + p;
		}
		return output;
	}
}
