package hermesTest.physicsTest;

import hermes.hshape.*;
import hermes.physics.*;
import processing.core.PVector;

import org.junit.*;

import static hermes.HermesMath.*;
import static org.junit.Assert.*;

public class InsideMassedColliderTest {

	class TestBeing extends MassedBeing {

		public TestBeing(PVector position, float width, float height, float mass) {
			super(new HRectangle(position, width, height), zeroVector(), mass, 1);
		}

		public void draw() {}
				
	}
	
	TestBeing big;
	TestBeing small;
	InsideMassedCollider collider;
	
	@Before
	public void setup() {
		big = new TestBeing(zeroVector(), 10, 10, INFINITY);
		small = new TestBeing(zeroVector(), 3, 3, 1);
		collider = new InsideMassedCollider();
	}
	
	@Test
	public void test_detect() {
		assertFalse(collider.detect(big, small));
		small.setPosition(4,0);
		assertTrue(collider.detect(big, small));
		small.setPosition(0,-3.6f);
		assertTrue(collider.detect(big, small));
		small.setPosition(0, 6);
		assertTrue(collider.detect(big, small));
		small.setPosition(10,10);
		assertFalse(collider.detect(big, small));
	}
	
	@Test
	public void test_handle() {
		small.setPosition(4,0);
		small.setVelocity(makeVector(1,0));
		collider.detect(big, small);
		collider.handle(big, small);
		assertEquals(small.getImpulse().x, -2, 1e-8);
		assertEquals(small.getDisplacement().x, -0.5, 1e-5);
		setup();
		small.setPosition(0,-3.6f);
		small.setVelocity(makeVector(0,-1));
		collider.detect(big, small);
		collider.handle(big, small);
		assertEquals(small.getImpulse().y, 2, 1e-5);
		assertEquals(small.getDisplacement().y, 0.1f, 1e-5);
		setup();
		small.setPosition(0,6);
		small.setVelocity(makeVector(0,1));
		collider.detect(big, small);
		collider.handle(big, small);
		assertEquals(small.getImpulse().y, -2, 1e-5);
		assertEquals(small.getDisplacement().y, -2.5f, 1e-5);
	}
	
}
