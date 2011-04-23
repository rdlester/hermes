package src.hermesTest.shapeTests;

import static org.junit.Assert.*;
import processing.core.*;
import src.hermes.shape.*;

import org.junit.*;

public class CircleTest {
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
		
		PVector pos3 = new PVector(-20,-20);
		Circle c3 = new Circle(pos3, 5);
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
}
