package src.hermesTest.physicsTest;

import static org.junit.Assert.*;
import org.junit.*;
import src.hermes.physics.*;
import src.hermes.hshape.Rectangle;
import processing.core.*;
import static src.hermes.HermesMath.*;

public class PhysicsTest {

	class MyBeing extends MassedBeing {

		public MyBeing(float mass, float elasticity) {
			super(new Rectangle(zeroVector(),1.0f,1.0f),
					zeroVector(), mass, elasticity);
		}

		public void draw() {}	

	}
	
	@Test
	public void test_calculateImpulse() {
		MassedBeing being1 = new MyBeing(1.0f, 1.0f);
		MassedBeing being2 = new MyBeing(1.0f, 1.0f);
		
		// very simple case (body hits body of equal mass at rest, transferring velocity)
		being1.setPosition(zeroVector());
		being1.setVelocity(zeroVector());
		being2.setPosition(makeVector(-1.0f,0.0f));
		being2.setVelocity(makeVector(1.0f,0.0f));
		PVector impulse = Physics.calculateImpulse(being1, being2, 1.0f, makeVector(-1.0f,0.0f));
		assertEquals(impulse.x, -1.0f, 1e-8);
		assertEquals(impulse.y, 0.0f, 1e-8);
		impulse = Physics.calculateImpulse(being2, being1, 1.0f, makeVector(-1.0f,0.0f));
		assertEquals(impulse.x, 1.0f, 1e-8);
		assertEquals(impulse.y, 0.0f, 1e-8);
		impulse = Physics.calculateImpulse(being1, being2, 1.0f, makeVector(-10.0f,0.0f));
		assertEquals(impulse.x, -1.0f, 1e-8);
		assertEquals(impulse.y, 0.0f, 1e-8);
		
		// beings of differing mass
		being1.setMass(2.0f);
		impulse = Physics.calculateImpulse(being1, being2, 1.0f, makeVector(-1.0f,0.0f));
		assertEquals(impulse.x, -4.0 / 3.0, 1e-5);
		assertEquals(impulse.y, 0.0f, 1e-5);
		
		// relativity!
		being1.setVelocity(makeVector(1,0));
		being2.setVelocity(makeVector(2,0));
		impulse = Physics.calculateImpulse(being1, being2, 1.0f, makeVector(-1.0f,0.0f));
		assertEquals(impulse.x, -4.0 / 3.0, 1e-5);
		assertEquals(impulse.y, 0.0f, 1e-5);
	}
	
}
