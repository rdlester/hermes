package src.hermes.shape;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

import processing.core.PVector;

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
	private LinkedList<PVector> _axes;
	//Stores the vertex points defining the polygon
	private List<PVector> _points;
	
	/**
	 * Constructor for Polygon
	 * List of vertex points must be ordered such that
	 * each point is connected to points before and after it in list
	 * @param position - Reference to Shape's position
	 * @param points - List of vertex points defined relative to position, must be ordered
	 */
	public Polygon(PVector position, List<PVector> points) {
		super(position);
		
		assert points != null : "In Polygon constructor, points must be valid List";
		assert points.size() > 0 : "In Polygon constructor, points must contain at least one point";
		
		_points = points;
		
		//Create the list of lines in the polygon
		_axes = new LinkedList<PVector>();
		Iterator<PVector> pit = _points.iterator();
		PVector first = pit.next();
		PVector pre = first;
		while(pit.hasNext()) {
			PVector p = pit.next();
			addAxis(p, pre);
			pre = p;
		}

		//Make the final line between the first and the last point
		addAxis(first, pre);
	}

	private void addAxis(PVector start, PVector end) {
		PVector axis = PVector.sub(start, end);
		axis.normalize();
		axis.dot(1,-1,0);
		_axes.addLast(axis);
	}
	
	/**
	 * Getter for list of vertex points
	 * @return _points
	 */
	public List<PVector> getPoints() {
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
		_axes.removeLast();
		
		PVector first = _points.get(0);
		PVector last = _points.get(_points.size()-1);
		
		addAxis(first, point);
		addAxis(point, last);
		_points.add(point);
	}
	
	protected LinkedList<PVector> getAxes() {
		return _axes;
	}
	
	@Override
	public boolean collide(Shape other) {
		assert other != null : "Polygon.collide: other must be a valid Shape";
		return other.projectionVector(this) != null;
	}
	
	@Override
	public boolean projectionVector(Shape other) {
		assert other != null : "Polygon.projectionVector: other must be a valid Shape";
		return other.projectionVector(this);
	}
	
	/**
	 * 
	 * @param other
	 * @return
	 */
	public boolean collide(Circle other) {
		Iterator<PVector> points = _points.iterator();
		Iterator<PVector> axes = _axes.iterator();
		
		PVector first = points.next();
		PVector pre2 = first;
		PVector second = points.next();
		PVector pre1 = second;
		
		while(points.hasNext()) {
			PVector curr = points.next();
			
			pre2 = pre1;
			pre1 = curr;
		}
		
		return true;
	}
	
	/**
	 * Collides a circle and a rectangle
	 * by turning the rectangle into a polygon
	 * and using the polygon collide method
	 * @param other
	 * @return
	 */
	public boolean collide(Rectangle other) {
		//Turn Rectangle into a Polygon
		PVector otherPos = other.getPosition();
		PVector min = other.getMin();
		PVector max = other.getMax();
		PVector v2 = new PVector(min.x, max.y);
		PVector v4 = new PVector(max.x, min.y);
		LinkedList<PVector> points = new LinkedList<PVector>();
		points.add(min);
		points.add(v2);
		points.add(max);
		points.add(v4);	
		Polygon rect = new Polygon(otherPos, points);
		
		return collide(rect);
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
		LinkedList<PVector> axes = other.getAxes();
		for(PVector axis : axes) {
			PVector result = checkSepAxis(axis, dist, other);
			if(result == null) return null;
			else resolutionList.add(result);
		}
		
		return true;
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
		float offset = dist.dot(axis);
		project1.add(offset, offset, 0);
		
		//Check if they are separated along axis
		float top = project1.x - project2.y;
		float bottom = project2.x - project1.y;
		if(top > 0 ||  bottom > 0) {
			//Found a separating axis! Not colliding.
			return null;
		}
		
		else {
			if(top > bottom) axis.mult(bottom):
			else axis.mult(top);
			return axis;
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
}
