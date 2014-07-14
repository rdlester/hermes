package hermesTest.physicsTest;

import hermes.hshape.*;
import hermes.physics.*;
import processing.core.PVector;
import static hermes.HermesMath.*;
import static org.junit.Assert.*;
import org.junit.*;


public class ImpulseCollisionTest {
	
	class MyBeing extends MassedBeing {

		public MyBeing(PVector pos, PVector vel, float mass, float elasticity) {
			super(new HCircle(pos, 1.0f),
					vel, mass, elasticity);
		}

		public void draw() {}	

	}
	
	/**
	 * tests ImpulseCollision.addImpulse();
	 */
	@Test
	public void test_addImpulse() {
		MyBeing being1 = new MyBeing(zeroVector(), zeroVector(), 1.0f, 1.0f);
		MyBeing being2 = new MyBeing(zeroVector(), zeroVector(), 1.0f, 1.0f);
		ImpulseCollision collision = new ImpulseCollision(being1, being2, makeVector(1.0f,1.0f), 1.0f);
		collision.addImpulse(makeVector(1.0f,2.0f), being1);
		assertEquals(collision.getImpulse().x, 1.0f, 1e-8);
		assertEquals(collision.getImpulse().y, 2.0f, 1e-8);
		collision.addImpulse(makeVector(-1,0), being2);
		assertEquals(collision.getImpulse().x, 2.0f, 1e-8);
		assertEquals(collision.getImpulse().y, 2.0f, 1e-8);	
	}
	
	/**
	 * tests ImpulseCollision.applyProjection()
	 */
	@Test
	public void test_applyProjection() {
		MyBeing being1 = new MyBeing(zeroVector(), zeroVector(), 1, 1);
		MyBeing being2 = new MyBeing(makeVector(1, 0), zeroVector(), 1, 1);
		PVector projection = being1.getShape().projectionVector(being2.getShape());
		assertEquals(projection.x, 1, 1e-8);
		assertEquals(projection.y, 0, 1e-8);
		ImpulseCollision collision = new ImpulseCollision(being1, being2, projection, 1.0f);
		collision.calculateDisplacement();
		collision.applyDisplacement();
		assertEquals(being1.getDisplacement().x, -0.5f, 1e-8);
		assertEquals(being2.getDisplacement().x, 0.5f, 1e-8);
		// check infinite masses
		being1 = new MyBeing(zeroVector(), zeroVector(), INFINITY, 1);
		being2 = new MyBeing(makeVector(1, 0), zeroVector(), 1, 1);
		collision = new ImpulseCollision(being1, being2, projection, 1.0f);
		collision.calculateDisplacement();
		collision.applyDisplacement();
		assertEquals(being1.getDisplacement().x, 0, 1e-8);
		assertEquals(being2.getDisplacement().x, 1, 1e-8);
		being1 = new MyBeing(zeroVector(), zeroVector(), 1, 1);
		being2 = new MyBeing(makeVector(1, 0), zeroVector(), INFINITY, 1);
		collision = new ImpulseCollision(being1, being2, projection, 1.0f);
		collision.calculateDisplacement();
		collision.applyDisplacement();
		assertEquals(being1.getDisplacement().x, -1, 1e-8);
		assertEquals(being2.getDisplacement().x, 0, 1e-8);
		being1 = new MyBeing(zeroVector(), zeroVector(), INFINITY, 1);
		being2 = new MyBeing(makeVector(1, 0), zeroVector(), INFINITY, 1);
		collision = new ImpulseCollision(being1, being2, projection, 1.0f);
		collision.calculateDisplacement();
		collision.applyDisplacement();
		assertEquals(being1.getDisplacement().x, -0.5f, 1e-8);
		assertEquals(being2.getDisplacement().x, 0.5f, 1e-8);
		
	}
	
	
}
