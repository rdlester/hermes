package src.hermes.shape;

import processing.core.PVector;

/**
 * 
 * @author Ryan
 *
 */
public class Circle extends Shape {

	PVector _center;
	float _radius;
	
	/**
	 * Constructor defining center of circle
	 * to be a certain distance away from the position
	 * @param position
	 * @param center
	 * @param radius
	 */
	public Circle(PVector position, PVector center, float radius) {
		super(position);
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
		_center = new PVector(0,0);
		_radius = radius;
	}

	@Override
	public boolean collide(Shape other) {
		return other.collide(this);
	}

	/**
	 * Collides one circle with another
	 * by finding distance between circles
	 * and comparing it to summed radii.
	 * @param other
	 * @return
	 */
	public boolean collide(Circle other) {
		//Get the center of this circle
		PVector worldCenterThis = new PVector(_position.x + _center.x,
											_position.y + _center.y);
		//Get the center of the other circle
		PVector positionOther = other._position;
		PVector centerOther = other._center;
		PVector worldCenterOther = new PVector(positionOther.x + centerOther.x,
											positionOther.y + centerOther.y);
		
		float distance = PVector.dist(worldCenterThis, worldCenterOther);
		float sumRadii = _radius + other._radius;
		boolean collides = distance <= sumRadii;
		
		return collides; 
	}
	
	public boolean collide(Rectangle other) {
		boolean collides = false;
		//Get the center of this circle
		PVector worldCenter = new PVector(_position.x + _center.x,
										_position.y + _center.y);
		//Figure out what voronoi region of the rectangle the circle is in
		PVector min = PVector.add(other._position, other._min);
		PVector max = PVector.add(other._position, other._max);
		if(min.x <= worldCenter.x) {
			if(worldCenter.x <= max.x) {
				//In regions above or below rectangle,
				//compare y projections
				float minProject = worldCenter.y - _radius;
				float maxProject = worldCenter.y + _radius;
				if(min.y <= maxProject && minProject <= max.y) {
					collides = true;
				}
			}
			else if(min.y <= worldCenter.y) {
				if(worldCenter.y <= max.y) {
					//In region directly to right of rectangle
					//Compare x projections
					float minProject = worldCenter.x - _radius;
					if(minProject <= max.x) {
						collides = true;
					}
				}
				else {
					//In region to the right&down of rectangle
					//Get projection of both along bottom-right vertex (max)
					PVector axis = PVector.sub(worldCenter, max);
					axis.normalize();
					axis.mult(_radius);
					PVector project = PVector.add(worldCenter, axis);
					if(project.x <= max.x && project.y <= max.y) {
						collides = true;
					}
					
				}
			}
			else {
				//In region to the right&up of rectangle
				//Get projection of both along top-right vertex
				PVector trVertex = new PVector(max.x, min.y);
				PVector axis = PVector.sub(worldCenter, trVertex);
				axis.normalize();
				axis.mult(_radius);
				PVector project = PVector.add(worldCenter, axis);
				if(project.x <= trVertex.x && trVertex.y <= project.y) {
					collides = true;
				}
			}
		}
		else if(min.y <= worldCenter.y) {
			if(worldCenter.y <= max.y) {
				//In region directly to the left of rectangle
				//Compare x projections
				float maxProject = worldCenter.x + _radius;
				if(min.x <= maxProject) {
					collides = true;
				}
			}
			else {
				//In region to the left&down of rectangle
				//Get projection of both along bottom-left vertex
				PVector blVertex = new PVector(min.x, max.y);
				PVector axis = PVector.sub(worldCenter, blVertex);
				axis.normalize();
				axis.mult(_radius);
				PVector project = PVector.add(worldCenter, blVertex);
				if(blVertex.x <= project.x && project.y <= blVertex.y) {
					collides = true;
				}
			}
		}
		else {
			//In region to the left&up of rectangle
			//Get projection of both along top-left vertex (min)
			PVector axis = PVector.sub(worldCenter, min);
			axis.normalize();
			axis.mult(_radius);
			PVector project = PVector.add(worldCenter, axis);
			if(min.x <= project.x && min.y <= project.y) {
				collides = true;
			}
		}
		
		return collides;
	}
}
