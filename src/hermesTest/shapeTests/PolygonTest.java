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
		//Triangle
		PVector pos1 = new PVector(0,0);
		LinkedList<PVector> points1 = new LinkedList<PVector>();
		points1.add(new PVector(0,0));
		points1.add(new PVector(10,0));
		points1.add(new PVector(0,10));
		Polygon p1 = new Polygon(pos1, points1);
		
		//Triangle will collide with first along hypotenuse
		PVector pos2 = new PVector(10,10);
		LinkedList<PVector> points2 = new LinkedList<PVector>();
		points2.add(new PVector(0,0));
		points2.add(new PVector(0,-10));
		points2.add(new PVector(-10,0));
		Polygon p2 = new Polygon(pos2, points2);
		
		//Triangle will collide with second at vertex
		PVector pos3 = new PVector(10,0);
		LinkedList<PVector> points3 = new LinkedList<PVector>();
		points3.add(new PVector(10,0));
		points3.add(new PVector(0,0));
		points3.add(new PVector(0,20));
		Polygon p3 = new Polygon(pos3, points3);
		
		//Square, will not collide with first or second
		PVector posNo = new PVector(20,20);
		LinkedList<PVector> pointsNo = new LinkedList<PVector>();
		pointsNo.add(new PVector(20,20));
		pointsNo.add(new PVector(0,0));
		pointsNo.add(new PVector(10,0));
		pointsNo.add(new PVector(30,20));
		Polygon pNo = new Polygon(posNo, pointsNo);
		
		//Polygon p3 = new Polygon(pos3, points3);
		
		assertTrue(p1.collide(p2));
		assertTrue(p2.collide(p1));
		
		assertTrue(p3.collide(p1));
		assertTrue(p2.collide(p3));
		assertTrue(p3.collide(p2));
		
		assertFalse(p1.collide(pNo));
		assertFalse(pNo.collide(p1));
		assertFalse(p2.collide(pNo));
		assertFalse(pNo.collide(p2));
	}
	
	/**
	 * Tests polygon versus rectangle collision
	 */
	@Test
	public void test_collideRectangle() {
		//Triangle
		PVector pos1 = new PVector(0,0);
		LinkedList<PVector> points1 = new LinkedList<PVector>();
		points1.add(new PVector(0,0));
		points1.add(new PVector(10,0));
		points1.add(new PVector(0,10));
		Polygon p1 = new Polygon(pos1, points1);
		
		//Will collide at vertex
		PVector pos2 = new PVector(10,0);
		PVector min1 = new PVector(0,0);
		PVector max1 = new PVector(10,10);
		Rectangle r1 = new Rectangle(pos2, min1, max1);
		
		//Will collide through hypotenuse
		PVector pos3 = new PVector(10,10);
		PVector min2 = new PVector(-5,-5);
		PVector max2 = new PVector(5,5);
		Rectangle r2 = new Rectangle(pos3, min2, max2);
		
		//Does not collide
		PVector pos4 = new PVector(10,10);
		PVector min3 = new PVector(-1,-1);
		PVector max3 = new PVector(20,20);
		Rectangle r3 = new Rectangle(pos4,min3,max3);
		
		assertTrue(p1.collide(r1));
		assertTrue(p1.collide(r2));
		assertFalse(p1.collide(r3));
	}
}
