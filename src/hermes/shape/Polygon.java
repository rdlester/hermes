package src.hermes.shape;

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
		_points = points;
		
		//Create the list of lines in the polygon
		PVector first = null;
		PVector pre = null;
		for(PVector p : _points) {
			if(pre == null) {
				first = p;
				pre = p;
			}
			else {
				PVector axis = calcAxis(pre, p);
				_axes.add(axis);
			}
		}
		//Make the final line between the first and the last point
		PVector axis = calcAxis(first, pre);
		_axes.add(axis);
	}

	private PVector calcAxis(PVector start, PVector end) {
		PVector axis = PVector.sub(start, end);
		axis.normalize();
		axis.dot(1,-1,0);
		return axis;
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
		_axes.remove(_axes.size()-1);
		
		PVector first = _points.get(0);
		PVector last = _points.get(_points.size()-1);
		
		PVector axis1 = calcAxis(first, point);
		PVector axis2 = calcAxis(point, last);
		_axes.add(axis1);
		_axes.add(axis2);
		_points.add(point);
	}
	
	protected LinkedList<PVector> getAxes() {
		return _axes;
	}
	
	@Override
	public boolean collide(Shape other) {
		other.collide(this);
		return false;
	}
	
	public boolean collide(Circle other) {
		
	}
	
	/**
	 * 
	 * @param other
	 * @return
	 */
	public boolean collide(Rectangle other) {
		
	}

	/**
	 * Collides two polygons using SAT
	 * Projects polygons along each axis, and checks projections collide
	 * If polygons do not collide along an axis, escapes check and returns false
	 * @param other
	 * @return
	 */
	public boolean collide(Polygon other) {
		//Get total list of axes
		LinkedList<PVector> axes = other.getAxes();
		axes.addAll(_axes);
		
		//Get distance between polygons
		PVector dist = PVector.sub(_position, other.getPosition());
		
		//Check that polygons collide along all axes
		for(PVector axis : axes) {
			//Project this polygon
			float min1;
			float max1;
			PVector p1 = _points.get(0);
			min1 = p1.dot(axis);
			max1 = min1;
			for(int i = 1; i < _points.size(); i++) {
				PVector point = _points.get(i);
				float project = point.dot(axis);
				if(project < min1) min1 = project;
				if(max1 < project) max1 = project;
			}
			
			//Project other polygon
			float min2;
			float max2;
			List<PVector> otherPoints = other.getPoints();
			PVector p2 = otherPoints.get(0);
			min2 = p2.dot(axis);
			max2 = min2;
			for(int i = 1; i < otherPoints.size(); i++) {
				PVector point = otherPoints.get(i);
				float project = point.dot(axis);
				if(project < min2) min2 = project;
				if(max2 < project) max2 = project;
			}
			
			//Offset projection of this away from other
			float offset = dist.dot(axis);
			min1 += offset;
			max1 += offset;
			
			//Check if they are separated along axis
			if(min1 - max2 > 0 ||  min2 - max1 > 0) {
				//Found a separating axis! Not colliding.
				return false;
			}
		}
		
		return true;
	}
	
	
}
