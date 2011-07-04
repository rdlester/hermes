package src.hermesTest.physicsTest;

import org.junit.*;
import static org.junit.Assert.*;
import processing.core.PVector;
import src.hermes.physics.GravityInteractor;
import src.hermes.physics.MassedBeing;
import src.hermes.hshape.Rectangle;
import static src.hermes.HermesMath.*;

public class GravityInteractorTest {

	public class TestBeing extends MassedBeing {

		public TestBeing(PVector position, PVector velocity, float mass) {
			super(new Rectangle(position, 4, 4), velocity, mass, 1);
		}

		public void draw() {}
		
	}
	
	TestBeing being1, being2, being3;
	GravityInteractor inter;
	
	@Before
	public void setup() {
		being1 = new TestBeing(zeroVector(), zeroVector(), 2);
		being2 = new TestBeing(makeVector(1, 1), zeroVector(), 1);
		being3 = new TestBeing(makeVector(0, 2.1), zeroVector(), 0.5f);
		inter = new GravityInteractor(1, 2);
	}
	
	@Test
	public void test_detect() {
		assertTrue(inter.detect(being1, being2));
		assertFalse(inter.detect(being1, being1));
		assertFalse(inter.detect(being1, being3));
		assertTrue(inter.detect(being2, being3));
		assertTrue(inter.detect(being3, being2));
	}
	
	@Test
	public void test_handle() {
		inter.handle(being1, being2);
		assertEquals(being1.getForce().mag(), 1, 1e-6);
		assertEquals(being1.getForce().x, 1 / Math.sqrt(2), 1e-6);
		assertEquals(being1.getForce().y, 1 / Math.sqrt(2), 1e-6);
		assertEquals(being2.getForce().mag(), 1, 1e-6);
		assertEquals(being2.getForce().x, -1 / Math.sqrt(2), 1e-6);
		assertEquals(being2.getForce().y, -1 / Math.sqrt(2), 1e-6);
	}
	
}
