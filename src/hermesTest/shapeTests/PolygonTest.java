package src.hermesTest.shapeTests;

import static org.junit.Assert.*;

import java.util.LinkedList;

import org.junit.*;

import processing.core.PVector;

import src.hermes.shape.*;

public class PolygonTest {

	
	/**
	 * Tests polygon versus polygon test
	 */
	@Test
	public void test_collidePolygon() {
		//Make first polygon
		PVector pos1 = new PVector(0,0);
		LinkedList<PVector> points1 = new LinkedList<PVector>();
		
		//Make second polygon, will collide with first
		//PVector pos2 = new PVector(?,?);
		LinkedList<PVector> points2 = new LinkedList<PVector>();
		
		//Make third polygon, will not collide with first or second
		//PVector pos3 = new PVector(?,?);
		LinkedList<PVector> points3 = new LinkedList<PVector>();
		
		Polygon p1 = new Polygon(pos1, points1);
		Polygon p2 = new Polygon(pos2, points2);
		Polygon p3 = new Polygon(pos3, points3);
		
		assertTrue(p1.collide(p2));
		assertTrue(p2.collide(p1));
		assertFalse(p1.collide(p3));
		assertFalse(p3.collide(p1));
		assertFalse(p2.collide(p3));
		assertFalse(p3.collide(p2));
	}
}
