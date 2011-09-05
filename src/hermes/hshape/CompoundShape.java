package src.hermes.hshape;

import java.util.*;
import processing.core.PVector;

/**
 * NOTE: do not use, does not work.
 * <p>
 * Represents a compound shape containing any number of shapes.
 * The position of contained shapes will be defined relative to the position.
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