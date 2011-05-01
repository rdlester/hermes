package src.hermesTest.physicsTest;

import static src.hermes.HermesMath.*;
import processing.core.PVector;
import src.hermes.physics.*;
import src.hermes.shape.*;
import static org.junit.Assert.*;
import org.junit.*;


public class ImpulseCollisionTest {
	
	class MyBeing extends MassedBeing {

		public MyBeing(PVector pos, PVector vel, float mass, float elasticity) {
			super(new Rectangle(pos,3.0f,3.0f),
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
	
	
}
