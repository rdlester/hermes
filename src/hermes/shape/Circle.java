package src.hermes.shape;

import processing.core.PVector;

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
	public boolean collide(Shape other) {
		assert other != null : "Rectangle.collide: other must be a valid Shape";
		return other.projectionVector(this) != null;
	}
	
	public boolean collide(Circle other) {
		return projectionVector(other) != null;
	}
	
	public boolean collide(Rectangle other) {
		return projectionVector(other) != null;
	}
	
	@Override
	public PVector projectionVector(Shape other) {
		assert other != null : "Rectangle.projectionVector: other must be a valid Shape";
		return other.projectionVector(this);
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
		PVector positionOther = other._position;
		PVector centerOther = other._center;
		PVector worldCenterOther = PVector.add(positionOther, centerOther);
		
		//Circles are colliding if distance between them is less than sum of radii
		PVector dir = PVector.sub(worldCenterThis, worldCenterOther);
		float distance = dir.mag();
		float sumRadii = _radius + other._radius;
		boolean collides = distance <= sumRadii;
		
		//Projection vector is the unit vector pointing from this circle to other scaled by overlap
		if(collides) {
			float magnitude = sumRadii - distance;
			dir.normalize();
			dir.mult(magnitude);
			return dir;
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
		PVector worldCenter = new PVector(_position.x + _center.x,
										_position.y + _center.y);
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
					return (topCollide > bottomCollide ?
							new PVector(0,topCollide):
							new PVector(0,-bottomCollide));
					
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
					//In region to the right&down of rectangle
					//Get projection of both along bottom-right vertex (max)
					PVector axis = PVector.sub(max, worldCenter);
					axis.normalize();
					axis.mult(_radius);
					PVector project = PVector.add(worldCenter, axis);
					if(project.x <= max.x && project.y <= max.y) {
						float rightPath = max.x - project.x;
						float downPath = max.y - project.y;
						return (rightPath > downPath ?
								new PVector(0,downPath):
								new PVector(rightPath,0));
					}
					
				}
			}
			else {
				//In region to the right&up of rectangle
				//Get projection of both along top-right vertex
				PVector trVertex = new PVector(max.x, min.y);
				PVector axis = PVector.sub(trVertex, worldCenter);
				axis.normalize();
				axis.mult(_radius);
				PVector project = PVector.add(worldCenter, axis);
				if(project.x <= trVertex.x && trVertex.y <= project.y) {
					float rightPath = trVertex.x - project.x;
					float topPath = trVertex.y - project.y;
					return (rightPath > topPath ?
							new PVector(0,topPath):
							new PVector(rightPath,0));
				}
			}
		}
		else if(min.y <= worldCenter.y) {
			if(worldCenter.y <= max.y) {
				//In region directly to the left of rectangle
				//Compare x projections
				float maxProject = worldCenter.x + _radius;
				if(min.x <= maxProject) {
					return new PVector(min.x - maxProject,0);
				}
			}
			else {
				//In region to the left&down of rectangle
				//Get projection of both along bottom-left vertex
				PVector blVertex = new PVector(min.x, max.y);
				PVector axis = PVector.sub(blVertex, worldCenter);
				axis.normalize();
				axis.mult(_radius);
				PVector project = PVector.add(worldCenter, blVertex);
				if(blVertex.x <= project.x && project.y <= blVertex.y) {
					float leftPath = blVertex.x - project.x;
					float downPath = blVertex.y - project.y;
					return (leftPath > downPath ?
							new PVector(0,downPath):
							new PVector(leftPath,0));
				}
			}
		}
		else {
			//In region to the left&up of rectangle
			//Get projection of both along top-left vertex (min)
			PVector axis = PVector.sub(min, worldCenter);
			axis.normalize();
			axis.mult(_radius);
			PVector project = PVector.add(worldCenter, axis);
			if(min.x <= project.x && min.y <= project.y) {
				float leftPath = min.x - project.x;
				float upPath = min.y - project.y;
				return (leftPath > upPath ?
						new PVector(0,upPath):
						new PVector(leftPath,0));
			}
		}
		
		return null;
	}
	
	@Override
	public String toString() {
		return "Position:" + _position + "\nCenter:" + _center + "\nRadius:" + _radius;
	}
}
