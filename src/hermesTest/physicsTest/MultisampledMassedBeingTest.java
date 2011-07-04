package src.hermesTest.physicsTest;

import processing.core.PVector;
import src.hermes.physics.*;
import src.hermes.hshape.*;
import static src.hermes.HermesMath.*;

import static org.junit.Assert.*;
import org.junit.*;

public class MultisampledMassedBeingTest {

	public class TestBeing extends MultisampledMassedBeing {

		public TestBeing(PVector position, PVector velocity, float sampleLength) {
			super(new Rectangle(position, 4, 4), velocity, 1, 1, sampleLength);
		}

		public void draw() {}
		
	}
	
	@Test
	public void test_step() {
		TestBeing being1 = new TestBeing(makeVector(0,0), makeVector(1,0), 4);
		being1.processUpdate();
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {}
		being1.processUpdate();
		assertEquals(being1.getPosition().x, 1, 1e-2);
		being1.setVelocity(makeVector(5, 0));
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {}
		being1.processUpdate();
		assertEquals(being1.getPosition().x, 5, 1e-2);
		assertTrue(being1.needsMoreSamples());
		being1.processUpdate();
		assertEquals(being1.getPosition().x, 6, 1e-2);
		assertFalse(being1.needsMoreSamples());	
	}
	
}
