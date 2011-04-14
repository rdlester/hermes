package src.hermes.shapeTests;

import static org.junit.Assert.*;
import org.junit.*;
import src.hermes.shape.*;
import processing.core.*;

/**
 * unit tests for Hermes.shape.Rectangle
 * @author Sam
 *
 */
public class RectangleTest {

	/**
	 * tests the collision of two Rectangles
	 */
	@Test
	public void test_RectangleCollide() {
		// check one rectangle containing another
		Rectangle r1 = new Rectangle(new PVector(0,0), 5, 5);
		assertTrue(r1.collide(r1)); // self-collision
		Rectangle r2 = new Rectangle(new PVector(0,0), 3, 3);
		assertTrue(r1.collide(r2));
		assertTrue(r2.collide(r1));
		// corner overlap
		r2 = new Rectangle(new PVector(-3,-3),1,1);
		assertTrue(r1.collide(r2));
		assertTrue(r2.collide(r1));
		r2 = new Rectangle(new PVector(3,-3),1,1);
		assertTrue(r1.collide(r2));
		assertTrue(r2.collide(r1));
		r2 = new Rectangle(new PVector(-3,3),1,1);
		assertTrue(r1.collide(r2));
		assertTrue(r2.collide(r1));
		r2 = new Rectangle(new PVector(3,3),1,1);
		assertTrue(r1.collide(r2));
		assertTrue(r2.collide(r1));
		// one side overlap
		r2 = new Rectangle(new PVector(4,0),3,1);
		assertTrue(r1.collide(r2));
		assertTrue(r2.collide(r1));
		r2 = new Rectangle(new PVector(-4,0),3,1);
		assertTrue(r1.collide(r2));
		assertTrue(r2.collide(r1));
		r2 = new Rectangle(new PVector(0,4),1,3);
		assertTrue(r1.collide(r2));
		assertTrue(r2.collide(r1));
		r2 = new Rectangle(new PVector(0,-4),1,3);
		assertTrue(r1.collide(r2));
		assertTrue(r2.collide(r1));
		// center overlap
		r1 = new Rectangle(new PVector(0,0),1,3);
		r2 = new Rectangle(new PVector(0,1),3,1);
		assertTrue(r1.collide(r2));
		assertTrue(r2.collide(r1));
		// check for false positives
		r2 = new Rectangle(new PVector(0,3),3,1);
		assertFalse(r1.collide(r2));
		assertFalse(r2.collide(r1));
	}
	
}
