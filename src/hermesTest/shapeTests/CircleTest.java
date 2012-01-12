package src.hermesTest.shapeTests;

import static org.junit.Assert.*;
import hermes.Hermes;
import hermes.hshape.*;
import processing.core.*;

import org.junit.*;

public class CircleTest {
	
	@Before
	public void setup() {
		PApplet applet = new PApplet();
		applet.g = new PGraphics();
		Hermes.setPApplet(applet);
		applet.rectMode(PApplet.CENTER);
	}
	
	/**
	 * Tests circle with circle collision
	 * c1 and c2 will collide
	 * c1 and c3 will not
	 */
	@Test
	public void test_collideCircle() {
		
		PVector pos1 = new PVector(0,0); 
		Circle c1 = new Circle(pos1, 10);
		PVector pos2 = new PVector(1,1);
		Circle c2 = new Circle(pos2, 10);
		assertTrue(c1.collide(c2));
		assertTrue(c2.collide(c1));
		
		PVector pos3 = new PVector(-21,-21);
		Circle c3 = new Circle(pos3, 10);
		assertFalse(c3.collide(c1));
		assertFalse(c1.collide(c3));
		assertFalse(c3.collide(c2));
		assertFalse(c2.collide(c3));
	}
	
	/**
	 * Tests circle with rectangle collision
	 * 8 collisions tested, one for each voronoi region of a rectangle
	 */
	@Test
	public void test_collideRect() {
		int width = 10;
		int height = 10;
		int side = 15;
		int corner = 12;
		
		PVector pos1 = new PVector(0,0);
		Circle c1 = new Circle(pos1, 10);
		
		//Right on top of each other!
		Rectangle r0 = new Rectangle(pos1, width, height);
		assertTrue(c1.collide(r0));
		
		//Directly left vr
		PVector posL = new PVector(side,0);
		Rectangle L = new Rectangle(posL, width, height);
		assertTrue(c1.collide(L));
		
		//Directly right vr
		PVector posR = new PVector(-side,0);
		Rectangle R = new Rectangle(posR, width, height);
		assertTrue(c1.collide(R));
		
		//Directly below vr
		PVector posD = new PVector(0,-side);
		Rectangle D = new Rectangle(posD, width, height);
		assertTrue(c1.collide(D));
		
		//Directly above vr
		PVector posU = new PVector(0,side);
		Rectangle U = new Rectangle(posU, width, height);
		assertTrue(c1.collide(U));
		
		//Bottom-left vr
		PVector posUL = new PVector(-corner,-corner);
		Rectangle UL = new Rectangle(posUL, width, height);
		assertTrue(c1.collide(UL));
		
		//Bottom-Right vr
		PVector posUR = new PVector(corner,-corner);
		Rectangle UR = new Rectangle(posUR, width, height);
		assertTrue(c1.collide(UR));
		
		//Top-left vr
		PVector posDL = new PVector(-corner,corner);
		Rectangle DL = new Rectangle(posDL, width, height);
		assertTrue(c1.collide(DL));
		
		//Top-right vr
		PVector posDR = new PVector(corner,corner);
		Rectangle DR = new Rectangle(posDR, width, height);
		assertTrue(c1.collide(DR));
		
		//Not colliding!
		PVector no = new PVector(30,30);
		Rectangle noCollide = new Rectangle(no, width, height);
		assertFalse(c1.collide(noCollide));
	}
	
	@Test
	public void test_projectionVectorCircle() {
		PVector pos1 = new PVector(0,0);
		Circle c1 = new Circle(pos1, 10);
		PVector pos2 = new PVector(1,1);
		Circle c2 = new Circle(pos2, 10);
		
		//Calculate answer
		float sum = 10+10;
		PVector dir = PVector.sub(pos2, pos1);
		float dist = dir.mag();
		float mag = sum - dist;
		dir.normalize();
		dir.mult(mag);
		
		PVector project1 = c1.projectionVector(c2);
		PVector rProject1 = c2.projectionVector(c1);
		
		assertEquals(project1.x, dir.x, 1e-8);
		assertEquals(project1.y, dir.y, 1e-8);
		assertEquals(rProject1.x, -dir.x, 1e-8);
		assertEquals(rProject1.y, -dir.y, 1e-8);
		
		PVector pos3 = new PVector(-20,-20);
		Circle c3 = new Circle(pos3, 5);
		assertEquals(c3.projectionVector(c1), null);
	}
	
	@Test
	public void test_projectionVectorRectangle() {
		int width = 12;
		int height = 12;
		int side = 15;
		int corner = 12;
		
		
		
		//Calculate answer for corner cases
		PVector dir = new PVector(1,1);
		dir.normalize();
		float overlap = dir.dot(new PVector(6,6));
		overlap = 10 - overlap;
		dir.mult(overlap);
		
		
		PVector pos1 = new PVector(0,0);
		Circle c1 = new Circle(pos1, 10);
		
		//Right on top of each other!
		Rectangle r0 = new Rectangle(pos1, width, height);
		PVector result1 = c1.projectionVector(r0);
		assertEquals(result1.x, 0, 1e-8);
		assertEquals(result1.y, 16, 1e-8);
		
		//Directly left vr
		PVector posL = new PVector(side,0);
		Rectangle L = new Rectangle(posL, width, height);
		PVector result2 = c1.projectionVector(L);
		assertEquals(result2.x, 1, 1e-8);
		assertEquals(result2.y, 0, 1e-8);
		
		//Directly right vr
		PVector posR = new PVector(-side,0);
		Rectangle R = new Rectangle(posR, width, height);
		PVector result3 = c1.projectionVector(R);
		assertEquals(result3.x, -1, 1e-8);
		assertEquals(result3.y, 0, 1e-8);
		
		//Directly above vr
		PVector posU = new PVector(0,-side);
		Rectangle U = new Rectangle(posU, width, height);
		PVector result4 = c1.projectionVector(U);
		assertEquals(result4.x, 0, 1e-8);
		assertEquals(result4.y, -1, 1e-8);
		
		//Directly below vr
		PVector posD = new PVector(0,side);
		Rectangle D = new Rectangle(posD, width, height);
		PVector result5 = c1.projectionVector(D);
		assertEquals(result5.x, 0, 1e-8);
		assertEquals(result5.y, 1, 1e-8);
		
		//Top-right vr
		PVector posUR = new PVector(-corner,-corner);
		Rectangle UR = new Rectangle(posUR, width, height);
		PVector result6 = c1.projectionVector(UR);
		assertEquals(result6.x, -dir.x, 1e-5);
		assertEquals(result6.y, -dir.y, 1e-6);
		
		//Top-left vr
		PVector posUL = new PVector(corner,-corner);
		Rectangle UL = new Rectangle(posUL, width, height);
		PVector result7 = c1.projectionVector(UL);
		assertEquals(result7.x, dir.x, 1e-5);
		assertEquals(result7.y, -dir.y, 1e-6);
		
		//Bottom-right vr
		PVector posDR = new PVector(-corner,corner);
		Rectangle DR = new Rectangle(posDR, width, height);
		PVector result8 = c1.projectionVector(DR);
		assertEquals(result8.x, -dir.x, 1e-5);
		assertEquals(result8.y, dir.y, 1e-6);
		
		//Bottom-Left vr
		PVector posDL = new PVector(corner,corner);
		Rectangle DL = new Rectangle(posDL, width, height);
		PVector result9 = c1.projectionVector(DL);
		assertEquals(result9.x, dir.x, 1e-5);
		assertEquals(result9.y, dir.y, 1e-6);
		
		//Not colliding!
		PVector no = new PVector(30,30);
		Rectangle noCollide = new Rectangle(no, width, height);
		assertEquals(c1.projectionVector(noCollide), null);
	}
}
