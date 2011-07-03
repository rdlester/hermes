package src.hermes.shape;

import java.util.*;
import processing.core.PVector;

/**
 * represents a compound shape containing any number of shapes
 * the position of contained shapes will be defined relative to the position
 * @author Sam
 *
 *//*
public class CompoundShape extendsHShape {

	private ListHShape> _shapes;
	
	*//**
	 * creates a new compound shape
	 * @param position	the shape's position
	 *//*
	public CompoundShape(PVector position) {
		super(position);
		_shapes = new ArrayListHShape>();
	}

	*//**
	 * adds a shape to the compound
	 * @param shape		
	 *//*
	public void addShapeHShape shape) {
		_shapes.add(shape);
	}
	
	@Override
	public boolean collideHShape other) {
		assert other != null : "In CompoundShape.collide: other must be a valid shape";
		
		// collide individually with each of our shapes
		for(IteratorHShape> iter = _shapes.iterator(); iter.hasNext(); ) {
			if(other.collide(iter.next()))
				return true;
		}
		return false;
	}

}
*/