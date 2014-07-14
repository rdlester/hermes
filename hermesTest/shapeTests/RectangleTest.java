package hermesTest.shapeTests;

import static org.junit.Assert.*;
import hermes.Hermes;
import hermes.hshape.*;

import org.junit.*;

import processing.core.*;

/**
 * unit tests for Hermes.shape.HRectangle
 * @author Sam
 *
 */
public class HRectangleTest {
	
	@Before
	public void setup() {
		PApplet applet = new PApplet();
		applet.g = new PGraphics();
		Hermes.setPApplet(applet);
		applet.rectMode(PApplet.CENTER);
	}
	
	/**
	 * tests the collision of two HRectangles
	 */
	@Test
	public void test_HRectangleCollide() {
		// check one rectangle containing another
		HShape r1 = new HRectangle(new PVector(0,0), 5, 5);
		assertFalse(r1.collide(r1)); // self-collision
		HShape r2 = new HRectangle(new PVector(0,0), 3, 3);
		assertTrue(r1.collide(r2));
		assertTrue(r2.collide(r1));
		// corner overlap
		r2 = new HRectangle(new PVector(-3,-3),1,1);
		assertTrue(r1.collide(r2));
		assertTrue(r2.collide(r1));
		r2 = new HRectangle(new PVector(3,-3),1,1);
		assertTrue(r1.collide(r2));
		assertTrue(r2.collide(r1));
		r2 = new HRectangle(new PVector(-3,3),1,1);
		assertTrue(r1.collide(r2));
		assertTrue(r2.collide(r1));
		r2 = new HRectangle(new PVector(3,3),1,1);
		assertTrue(r1.collide(r2));
		assertTrue(r2.collide(r1));
		// one side overlap
		r2 = new HRectangle(new PVector(4,0),3,1);
		assertTrue(r1.collide(r2));
		assertTrue(r2.collide(r1));
		r2 = new HRectangle(new PVector(-4,0),3,1);
		assertTrue(r1.collide(r2));
		assertTrue(r2.collide(r1));
		r2 = new HRectangle(new PVector(0,4),1,3);
		assertTrue(r1.collide(r2));
		assertTrue(r2.collide(r1));
		r2 = new HRectangle(new PVector(0,-4),1,3);
		assertTrue(r1.collide(r2));
		assertTrue(r2.collide(r1));
		// center overlap
		r1 = new HRectangle(new PVector(0,0),1,3);
		r2 = new HRectangle(new PVector(0,1),3,1);
		assertTrue(r1.collide(r2));
		assertTrue(r2.collide(r1));
		// check for false positives
		r2 = new HRectangle(new PVector(0,3),3,1);
		assertFalse(r1.collide(r2));
		assertFalse(r2.collide(r1));
	}
	
	/**
	 * tests HRectangle.projectionVector()
	 */
	@Test
	public void test_projectionVector() {
		// check one rectangle containing another
		HRectangle r1 = new HRectangle(new PVector(0,0), 5, 5);
		assertEquals(r1.projectionVector(r1), null); // self-collision
		HRectangle r2 = new HRectangle(new PVector(0,0), 3, 3);
		assertEquals(r1.projectionVector(r2).x, 0, 1e-8);
		assertEquals(r1.projectionVector(r2).y, -4, 1e-8);
		// corner overlap
		r2 = new HRectangle(new PVector(-3,-3),1,1);
		assertEquals(r1.projectionVector(r2).x, 0, 1e-8);
		assertEquals(r1.projectionVector(r2).y, 0, 1e-8);
		// one side overlap
		r2 = new HRectangle(new PVector(3,0),3,1);
		assertEquals(r1.projectionVector(r2).x, 1, 1e-8);
		assertEquals(r1.projectionVector(r2).y, 0, 1e-8);
		assertEquals(r2.projectionVector(r1).x, -1, 1e-8);
		assertEquals(r2.projectionVector(r1).y, 0, 1e-8);
		r2 = new HRectangle(new PVector(-3,0),3,1);
		assertEquals(r1.projectionVector(r2).x, -1, 1e-8);
		assertEquals(r1.projectionVector(r2).y, 0, 1e-8);
		r2 = new HRectangle(new PVector(0,3),1,3);
		assertEquals(r1.projectionVector(r2).x, 0, 1e-8);
		assertEquals(r1.projectionVector(r2).y, 1, 1e-8);
		r2 = new HRectangle(new PVector(0,-3),1,3);
		assertEquals(r1.projectionVector(r2).x, 0, 1e-8);
		assertEquals(r1.projectionVector(r2).y, -1, 1e-8);
	}
	
	/**
	 * tests HRectangle.getCenter()
	 */
	@Test
	public void test_getCenter() {
		HRectangle rect = new HRectangle(new PVector(3,3), 5.0f, 1.2f);
		assertEquals(rect.getCenter().x, 3.0f, 1e-8);
		assertEquals(rect.getCenter().y, 3.0f, 1e-8);
		rect = new HRectangle(new PVector(0,0), new PVector(-1,-1), new PVector(3,4));
		assertEquals(rect.getCenter().x, 1.0f, 1e-8);
		assertEquals(rect.getCenter().y, 1.5f, 1e-8);
	}
	
	/**
	 * tests HRectangle.contains(HRectangle)
	 */
	@Test
	public void test_contains() {
		HRectangle r1 = new HRectangle(new PVector(0,0), 6, 6);
		assertTrue(r1.contains(r1));
		HRectangle r2 = new HRectangle(new PVector(0,0), 4, 4);
		assertTrue(r1.contains(r2));
		assertFalse(r2.contains(r1));
		r2 = new HRectangle(new PVector(0, 2), 2.5f, 2.5f);
		assertFalse(r1.contains(r2));
	}
	
}
