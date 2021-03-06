package hermesTest.shapeTests;

import static org.junit.Assert.*;

import hermes.hshape.*;

import java.util.ArrayList;

import org.junit.*;

import processing.core.PVector;


public class HPolygonTest {

	
	/**
	 * Tests polygon versus polygon collision
	 */
	@Test
	public void test_collideHPolygon() {
		//More extensive testing in test_projectionVectorHPolygon
		//Triangle
		PVector pos1 = new PVector(0,0);
		ArrayList<PVector> points1 = new ArrayList<PVector>();
		points1.add(new PVector(0,0));
		points1.add(new PVector(10,0));
		points1.add(new PVector(0,10));
		HPolygon p1 = new HPolygon(pos1, points1);
		
		//Triangle will collide with first along hypotenuse
		PVector pos2 = new PVector(10,10);
		ArrayList<PVector> points2 = new ArrayList<PVector>();
		points2.add(new PVector(0,0));
		points2.add(new PVector(0,-10));
		points2.add(new PVector(-10,0));
		HPolygon p2 = new HPolygon(pos2, points2);
		
		//Triangle will collide with second at vertex
		PVector pos3 = new PVector(10,0);
		ArrayList<PVector> points3 = new ArrayList<PVector>();
		points3.add(new PVector(10,0));
		points3.add(new PVector(0,0));
		points3.add(new PVector(0,20));
		HPolygon p3 = new HPolygon(pos3, points3);
		
		//Square, will not collide with first or second
		PVector posNo = new PVector(20,20);
		ArrayList<PVector> pointsNo = new ArrayList<PVector>();
		pointsNo.add(new PVector(20,20));
		pointsNo.add(new PVector(0,0));
		pointsNo.add(new PVector(10,0));
		pointsNo.add(new PVector(30,20));
		HPolygon pNo = new HPolygon(posNo, pointsNo);
		
		//HPolygon p3 = new HPolygon(pos3, points3);
		
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
	public void test_collideHRectangle() {
		//More extensive testing in test_projectionVectorHRectangle
		//Triangle
		PVector pos1 = new PVector(0,0);
		ArrayList<PVector> points1 = new ArrayList<PVector>();
		points1.add(new PVector(0,0));
		points1.add(new PVector(10,0));
		points1.add(new PVector(0,10));
		HPolygon p1 = new HPolygon(pos1, points1);
		
		//Will collide at vertex
		PVector pos2 = new PVector(10,0);
		PVector min1 = new PVector(0,0);
		PVector max1 = new PVector(10,10);
		HRectangle r1 = new HRectangle(pos2, min1, max1);
		
		//Will collide through hypotenuse
		PVector pos3 = new PVector(10,10);
		PVector min2 = new PVector(-5,-5);
		PVector max2 = new PVector(5,5);
		HRectangle r2 = new HRectangle(pos3, min2, max2);
		
		//Does not collide
		PVector pos4 = new PVector(10,10);
		PVector min3 = new PVector(0,0);
		PVector max3 = new PVector(20,20);
		HRectangle r3 = new HRectangle(pos4,min3,max3);
		
		assertTrue(p1.collide(r1));
		assertTrue(p1.collide(r2));
		assertFalse(p1.collide(r3));
	}
	
	@Test 
	public void test_collideHCircle() {
		//More extensive testing in test_projectionVectorHCircle
		//Triangle
		PVector pos1 = new PVector(0,0);
		ArrayList<PVector> points1 = new ArrayList<PVector>();
		points1.add(new PVector(0,0));
		points1.add(new PVector(10,0));
		points1.add(new PVector(0,10));
		HPolygon p1 = new HPolygon(pos1, points1);
		
		//HCircle that collides
		PVector pos2 = new PVector(10,10);
		HCircle c1 = new HCircle(pos2,8);
		assertTrue(p1.collide(c1));
		
		//HCircle that does not collide
		HCircle c2 = new HCircle(pos2,4);
		assertFalse(p1.collide(c2));
		
		//Other circles that collide
		PVector pos3 = new PVector(20,0);
		HCircle c3 = new HCircle(pos3,10);
		assertTrue(p1.collide(c3));
		
		
	}
	
	@Test
	public void test_projectionVectorHPolygon() {
		//Triangle
		PVector pos1 = new PVector(0,0);
		ArrayList<PVector> points1 = new ArrayList<PVector>();
		points1.add(new PVector(0,0));
		points1.add(new PVector(10,0));
		points1.add(new PVector(0,10));
		HPolygon p1 = new HPolygon(pos1, points1);
		
		//Triangle will collide with first along hypotenuse
		PVector pos2 = new PVector(10,10);
		ArrayList<PVector> points2 = new ArrayList<PVector>();
		points2.add(new PVector(0,0));
		points2.add(new PVector(0,-10));
		points2.add(new PVector(-10,0));
		HPolygon p2 = new HPolygon(pos2, points2);
		//Test
		assertTrue(p1.collide(p2));
		PVector projectV1 = p1.projectionVector(p2);
		assertEquals(projectV1.x,0,1e-8);
		assertEquals(projectV1.y,0,1e-8);
		
		//Triangle will collide with second at vertex
		PVector pos3 = new PVector(10,0);
		ArrayList<PVector> points3 = new ArrayList<PVector>();
		points3.add(new PVector(10,0));
		points3.add(new PVector(0,0));
		points3.add(new PVector(0,20));
		HPolygon p3 = new HPolygon(pos3, points3);
		//Test
		PVector projectV2 = p1.projectionVector(p3);
		assertEquals(projectV2.x,0,1e-8);
		assertEquals(projectV2.y,0,1e-8);
		
		//Actual collision
		PVector pos4 = new PVector(5,-5);
		ArrayList<PVector> points4 = new ArrayList<PVector>();
		points4.add(new PVector(0,6));
		points4.add(new PVector(-2,5));
		points4.add(new PVector(-1,0));
		points4.add(new PVector(1,0));
		points4.add(new PVector(2,5));
		HPolygon p4 = new HPolygon(pos4, points4);
		//Test
		PVector projectV4 = p1.projectionVector(p4);
		assertEquals(projectV4.x,0,1e-8);
		assertEquals(projectV4.y,-1,1e-8);
		
		//Little quadrilateral within triangle
		PVector pos5 = new PVector(3,3);
		ArrayList<PVector> points5 = new ArrayList<PVector>();
		points5.add(new PVector(-1,-1));
		points5.add(new PVector(1,-1));
		points5.add(new PVector(1,1));
		points5.add(new PVector(-2,1));
		HPolygon p5 = new HPolygon(pos5, points5);
		//Test
		PVector projectV5 = p1.projectionVector(p5);
		assertEquals(projectV5.x,-4,1e-8);
		assertEquals(projectV5.y,0,1e-8);
		
		//Collision from "above"
		PVector pos6 = new PVector(5,10);
		ArrayList<PVector> points6 = new ArrayList<PVector>();
		points6.add(new PVector(-5,-5));
		points6.add(new PVector(-5,0));
		points6.add(new PVector(0,0));
		points6.add(new PVector(1,0));
		points6.add(new PVector(2,5));
		HPolygon p6 = new HPolygon(pos6, points6);
		//Test
		PVector projectV6 = p1.projectionVector(p6);
		assertEquals(projectV6.x,2.5,1e-8);
		assertEquals(projectV6.y,2.5,1e-8);
		
		//Collison with polygon at same exact location
		PVector projectSame = p1.projectionVector(p1);
		assertEquals(projectSame.x,-5,1e-8);
		assertEquals(projectSame.y,-5,1e-8);
		
		////
		// Colliding rotated squares
		float radius = 25;
		ArrayList<PVector> pointsSquare = new ArrayList<PVector>();
		pointsSquare.add(new PVector(0,radius));
		pointsSquare.add(new PVector(radius,0));
		pointsSquare.add(new PVector(0,-radius));
		pointsSquare.add(new PVector(-radius,0));
		
		PVector pos90 = new PVector(0,0);
		HPolygon s1 = new HPolygon(pos90,pointsSquare);
		
		PVector pos7 = new PVector(50,0);
		HPolygon s2 = new HPolygon(pos7,pointsSquare);
		PVector projectS1 = s1.projectionVector(s2);
		assertEquals(projectS1.x,0,1e-8);
		assertEquals(projectS1.y,0,1e-8);
		
		PVector pos8 = new PVector(49,0);
		HPolygon s3 = new HPolygon(pos8,pointsSquare);
		PVector projectS2 = s1.projectionVector(s3);
		assertEquals(projectS2.x,0.5,1e-6);
		assertEquals(projectS2.y,-0.5,1e-6);
		
		PVector pos9 = new PVector(30,0);
		HPolygon s4 = new HPolygon(pos9,pointsSquare);
		PVector projectS3 = s1.projectionVector(s4);
		assertEquals(projectS3.x,10,1e-6);
		assertEquals(projectS3.y,-10,1e-6);
		
		PVector pos10 = new PVector(20,20);
		HPolygon s5 = new HPolygon(pos10,pointsSquare);
		PVector projectS4 = s1.projectionVector(s5);
		assertEquals(projectS4.x,5,1e-6);
		assertEquals(projectS4.y,5,1e-6);
		
		PVector pos11 = new PVector(51,0);
		HPolygon s6 = new HPolygon(pos11,pointsSquare);
		assertFalse(s1.collide(s6));
	}
	
	@Test
	public void test_projectionVectorHRectangle() {
		//Triangle
		PVector pos1 = new PVector(0,0);
		ArrayList<PVector> points1 = new ArrayList<PVector>();
		points1.add(new PVector(0,0));
		points1.add(new PVector(10,0));
		points1.add(new PVector(0,10));
		HPolygon p1 = new HPolygon(pos1, points1);
		
		//Will collide at vertex
		PVector pos2 = new PVector(10,0);
		PVector min1 = new PVector(0,0);
		PVector max1 = new PVector(10,10);
		HRectangle r1 = new HRectangle(pos2, min1, max1);
		//Test
		PVector projectV1 = p1.projectionVector(r1);
		assertEquals(projectV1.x,0,1e-8);
		assertEquals(projectV1.y,0,1e-8);
		
		//Will collide at hypotenuse
		PVector pos3 = new PVector(10,10);
		PVector min2 = new PVector(-5,-5);
		PVector max2 = new PVector(5,5);
		HRectangle r2 = new HRectangle(pos3, min2, max2);
		//Test
		PVector projectV2 = p1.projectionVector(r2);
		assertEquals(projectV2.x,0,1e-8);
		assertEquals(projectV2.y,0,1e-8);
		
		//New displaced triangle
		PVector pos4 = new PVector(10,10);
		HPolygon p2 = new HPolygon(pos4,points1);
		
		//Overlaps at corner
		PVector pos5 = new PVector(5,5);
		PVector min3 = new PVector(-2,-2);
		PVector max3 = new PVector(6,6);
		HRectangle r3 = new HRectangle(pos5,min3,max3);
		//Test
		PVector projectV3 = p2.projectionVector(r3);
		assertEquals(projectV3.x,-1,1e-8);
		assertEquals(projectV3.y,0,1e-8);
	}
	
	@Test 
	public void test_projectionVectorHCircle() {
		//Triangle
		PVector pos1 = new PVector(0,0);
		ArrayList<PVector> points1 = new ArrayList<PVector>();
		points1.add(new PVector(0,0));
		points1.add(new PVector(10,0));
		points1.add(new PVector(0,10));
		HPolygon p1 = new HPolygon(pos1, points1);
		
		//HCircle that collides at hypotenuse
		PVector pos2 = new PVector(10,10);
		HCircle c1 = new HCircle(pos2,8);
		PVector projectV1 = p1.projectionVector(c1);
		float result = (float) 0.656854212284881;
		System.out.println(projectV1);
		assertEquals(projectV1.x,result,1e-8);
		assertEquals(projectV1.y,result,1e-8);
		
		//Collides at vertex
		PVector pos3 = new PVector(20,0);
		HCircle c2 = new HCircle(pos3,10);
		assertTrue(p1.collide(c2));
		PVector projectV2 = p1.projectionVector(c2);
		assertEquals(projectV2.x,0,1e-8);
		assertEquals(projectV2.y,0,1e-8);
		
		//Is located just inside triangle
		PVector pos4 = new PVector(1,1);
		HCircle c3 = new HCircle(pos4, 5);
		assertTrue(p1.collide(c3));
		PVector projectV3 = p1.projectionVector(c3);
		assertEquals(projectV3.x,-6,1e-8);
		assertEquals(projectV3.y,0,1e-8);
		
		//Is inside triangle
		PVector posIn = new PVector(3,3);
		HCircle cIn = new HCircle(posIn, 1);
		assertTrue(p1.collide(cIn));
		PVector projectVIn = p1.projectionVector(cIn);
		float res = (float)(5-(3-Math.sqrt(2)/2));
		assertEquals(projectVIn.x,res,1e-8);
		assertEquals(projectVIn.y,res,1e-8);
		
		//Into hypotenuse
		PVector pos5 = new PVector(20,1);
		HCircle c4 = new HCircle(pos5,12);
		PVector projectV4 = p1.projectionVector(c4);
		PVector result4 = new PVector(10,1);
		result4.normalize();
		result4.mult((float)(12-Math.sqrt(101)));
		assertEquals(projectV4.x,result4.x,1e-6);
		assertEquals(projectV4.y,result4.y,1e-6);
		
		//Test with polygon that is not at (0,0) but rather (10,10)
		ArrayList<PVector> points2 = new ArrayList<PVector>();
		points2.add(new PVector(0,0));
		points2.add(new PVector(10,0));
		points2.add(new PVector(0,10));
		HPolygon p2 = new HPolygon(pos2, points2);
		
		//Collides behind HPolygon 2
		PVector pos6 = new PVector(0,10);
		HCircle c5 = new HCircle(pos6,11);
		PVector projectV5 = p2.projectionVector(c5);
		assertEquals(projectV5.x,-1,1e-8);
		assertEquals(projectV5.y,0,1e-8);
		
		////
		// Colliding rotated squares
		float radius = 25;
		ArrayList<PVector> pointsSquare = new ArrayList<PVector>();
		pointsSquare.add(new PVector(0,radius));
		pointsSquare.add(new PVector(radius,0));
		pointsSquare.add(new PVector(0,-radius));
		pointsSquare.add(new PVector(-radius,0));
		
		PVector pos7 = new PVector(0,0);
		HPolygon s1 = new HPolygon(pos7,pointsSquare);
		
		PVector pos8 = new PVector(30,0);
		HCircle c6 = new HCircle(pos8,5);
		PVector projectS1 = s1.projectionVector(c6);
		assertEquals(projectS1.x,0,1e-8);
		assertEquals(projectS1.y,0,1e-8);
		
		PVector pos9 = new PVector(31,0);
		HCircle c7 = new HCircle(pos9,5);
		assertFalse(s1.collide(c7));
	}
	
	@Test
	public void test_contains() {
		//Triangle
		PVector pos1 = new PVector(0,0);
		ArrayList<PVector> points1 = new ArrayList<PVector>();
		points1.add(new PVector(0,0));
		points1.add(new PVector(10,0));
		points1.add(new PVector(0,10));
		HPolygon p1 = new HPolygon(pos1, points1);
		
		//Contains own corner?
		assertTrue(p1.contains(new PVector(10,0,0)));
		//Contains inside
		assertTrue(p1.contains(3,3));
		//Does not contain
		assertFalse(p1.contains(10,10));
	}
}
