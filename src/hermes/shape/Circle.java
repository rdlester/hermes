package src.hermes.shape;

import processing.core.PVector;
import static src.hermes.HermesMath.*;

/**
 * 
 * @author Ryan
 *
 */
public class Circle extends Shape {

	private PVector _center;
	private float _radius;
	
	/**
	 * Constructor defining center of circle
	 * to be a certain distance away from the position
	 * @param position
	 * @param center
	 * @param radius
	 */
	public Circle(PVector position, PVector center, float radius) {
		super(position);
		
		assert center != null : "In Circle constructor, center must be a valid PVector";
		assert radius >= 0 : "In Circle constructor, radius must be non-negative"; //TODO can radius be 0?
		
		_center = center;
		_radius = radius;
	}
	
	/**
	 * Constructor defining center of circle
	 * as position of object
	 * @param position
	 * @param radius
	 */
	public Circle(PVector position, float radius) {
		super(position);
		
		assert radius >= 0 : "In Circle constructor, radius must be non-negative"; //TODO can radius be 0?
		
		_center = new PVector(0,0);
		_radius = radius;
	}
	
	/**
	 * Getter for center
	 */
	public PVector getCenter() {
		return _center;
	}
	
	/**
	 * Getter for radius
	 */
	public float getRadius() {
		return _radius;
	}
	
	@Override
	public PVector projectionVector(Shape other) {
		assert other != null : "Circle.collide: other must be a valid Shape";
		PVector opposite = other.projectionVector(this);
		return opposite == null ? null : reverse(opposite);
	}

	@Override
	public PVector projectionVector(Polygon other) {
		PVector opposite = other.projectionVector(this);
		return opposite == null ? null : reverse(opposite);
	}
	
	/**
	 * Collides one circle with another
	 * by finding distance between circles
	 * and comparing it to summed radii.
	 * @param other
	 * @return
	 */
	public PVector projectionVector(Circle other) {
		//Get the center of this circle
		PVector worldCenterThis = PVector.add(_position, _center);
		//Get the center of the other circle
		PVector worldCenterOther = PVector.add(other.getPosition(), other.getCenter());
		
		//Circles are colliding if distance between them is less than sum of radii
		PVector dir = PVector.sub(worldCenterOther, worldCenterThis);
		float distance = dir.mag();
		float sumRadii = _radius + other._radius;
		boolean collides = distance <= sumRadii;
		
		//Projection vector is the unit vector pointing from this circle to other scaled by overlap
		if(collides) {
			float magnitude = sumRadii - distance;
			if(dir.x == 0 && dir.y == 0) {
				return new PVector(0,magnitude);
			}
			else {
				dir.normalize();
				dir.mult(magnitude);
				return dir;
			}
		}
		else return null;
	}
	
	/**
	 * Collides a circle with a rectangle
	 * by determining the voronoi region the circle is in
	 * and colliding the circle along the appropriate axis
	 * @param other
	 * @return
	 */
	public PVector projectionVector(Rectangle other) {
		//Get the center of this circle
		PVector worldCenter = PVector.add(_center, _position);
		//Figure out what voronoi region of the rectangle the circle is in
		PVector min = PVector.add(other._position, other.getMin());
		PVector max = PVector.add(other._position, other.getMax());
		if(min.x <= worldCenter.x) {
			if(worldCenter.x <= max.x) {
				//In regions above or below rectangle,
				//compare y projections
				float minProject = worldCenter.y - _radius;
				float maxProject = worldCenter.y + _radius;
				if(min.y <= maxProject && minProject <= max.y) {
					float topCollide = max.y - minProject;
					float bottomCollide = maxProject - min.y;
					return (topCollide >= bottomCollide ?
							new PVector(0,bottomCollide):
							new PVector(0,-topCollide));
					
				}
			}
			else if(min.y <= worldCenter.y) {
				if(worldCenter.y <= max.y) {
					//In region directly to right of rectangle
					//Compare x projections
					float minProject = worldCenter.x - _radius;
					if(minProject <= max.x) {
						return new PVector(minProject - max.x,0);
					}
				}
				else {
					//In region to the right&up of rectangle
					//Get projection of both along up-right vertex (max)
					PVector axis = PVector.sub(max, worldCenter);
					axis.normalize();
					axis.mult(_radius);
					PVector project = PVector.add(worldCenter, axis);
					if(project.x <= max.x && project.y <= max.y) {
						float leftPath = max.x - project.x;
						float downPath = max.y - project.y;
						return (leftPath >= downPath ?
								new PVector(0,-downPath):
								new PVector(-leftPath,0));
					}
					
				}
			}
			else {
				//In region to the right&down of rectangle
				//Get projection of both along bottom-right vertex
				PVector brVertex = new PVector(max.x, min.y);
				PVector axis = PVector.sub(brVertex, worldCenter);
				axis.normalize();
				axis.mult(_radius);
				PVector project = PVector.add(worldCenter, axis);
				if(project.x <= brVertex.x && brVertex.y <= project.y) {
					float leftPath = brVertex.x - project.x;
					float topPath = project.y - brVertex.y;
					return (leftPath >= topPath ?
							new PVector(0,topPath):
							new PVector(-leftPath,0));
				}
			}
		}
		else if(min.y <= worldCenter.y) {
			if(worldCenter.y <= max.y) {
				//In region directly to the left of rectangle
				//Compare x projections
				float maxProject = worldCenter.x + _radius;
				if(min.x <= maxProject) {
					return new PVector(maxProject - min.x,0);
				}
			}
			else {
				//In region to the left&up of rectangle
				//Get projection of both along top-left vertex
				PVector tlVertex = new PVector(min.x, max.y);
				PVector axis = PVector.sub(tlVertex, worldCenter);
				axis.normalize();
				axis.mult(_radius);
				PVector project = PVector.add(worldCenter, axis);
				if(tlVertex.x <= project.x && project.y <= tlVertex.y) {
					float rightPath = project.x - tlVertex.x;
					float downPath = tlVertex.y - project.y;
					return (rightPath >= downPath ?
							new PVector(0,-downPath):
							new PVector(rightPath,0));
				}
			}
		}
		else {
			//In region to the left&down of rectangle
			//Get projection of both along bottom-left vertex (min)
			PVector axis = PVector.sub(min, worldCenter);
			axis.normalize();
			axis.mult(_radius);
			PVector project = PVector.add(worldCenter, axis);
			if(min.x <= project.x && min.y <= project.y) {
				float rightPath = project.x - min.x;
				float upPath = project.y - min.y;
				return (rightPath >= upPath ?
						new PVector(0,upPath):
						new PVector(rightPath,0));
			}
		}
		
		return null;
	}
	
	@Override
	public String toString() {
		return "Position:" + _position + "\nCenter:" + _center + "\nRadius:" + _radius;
	}

	@Override
	public Rectangle getBoundingBox() {
		return new Rectangle(PVector.add(_position, _center), 2*_radius, 2*_radius);
	}

}
