package src.hermes;

import java.util.Iterator;
import java.util.LinkedList;

public class Shape {

	private LinkedList<Shape> _contained;
	
	public boolean collide(Shape other) {
		boolean result = false;
		for(Iterator<Shape> iter = _contained.iterator(); iter.hasNext(); ) {
			result = result && iter.next().collide(other);
		}
		return result;
	}
	
}

public class Circle {
	
	public boolean collide(Circle other) {
		
	}
	
}