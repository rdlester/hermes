package src.hermesTest.core;

import java.util.LinkedList;
import src.hermes.*;
import static src.hermes.HermesMath.*;
import src.hermes.shape.*;
import src.hermes.postoffice.PostOffice;
import src.hermes.shape.Shape;
import processing.core.PApplet;
import processing.core.PVector;

import org.junit.*;
import static org.junit.Assert.*;

public class worldTest {

	LinkedList<TestBeing1> updated1;
	boolean trial1Success = false;
	
	class TestBeing1 extends Being {

		public TestBeing1() {
			super(new Rectangle(zeroVector(), 1.0f, 1.0f), zeroVector());
		}

		@Override
		public void draw() {}
		
		public void update() {
			updated1.add(this);
		}
		
	}
	
	class testWorld1 extends World {

		int nUpdates;
		
		public testWorld1(int nUpdates) {
			super(new PostOffice(5000,5001), new Camera());
			this.nUpdates = nUpdates;
		}
		
		public void update() {
			super.update();
			if(updated1.size() == nUpdates) {
				trial1Success = true;
			}
			this.deActivate();
		}
	}
	
	@Test
	public void test_UpdateBeings() {
		updated1 = new LinkedList<TestBeing1>();
		PApplet papp = new PApplet();
		Hermes.setPApplet(papp);
		testWorld1 tw1 = new testWorld1(3);
		TestBeing1 b1 = new TestBeing1();
		TestBeing1 b2 = new TestBeing1();
		TestBeing1 b3 = new TestBeing1();
		TestBeing1 b4 = new TestBeing1();
		tw1.registerBeing(b1, true);
		tw1.registerBeing(b2, false);
		tw1.registerBeing(b3, true);
		tw1.registerBeing(b4, true);
		tw1.start();
		while(tw1.isAlive()) {}
		assertTrue(trial1Success);
		assertTrue(updated1.contains(b1));
		assertFalse(updated1.contains(b2));
		assertTrue(updated1.contains(b3));
		assertTrue(updated1.contains(b4));
	}
	
	@Test
	public void test_LockUpdateRate() {
		World w = new World(new PostOffice(), new Camera());
		w.lockUpdateRate(5);
		long time = System.currentTimeMillis();
		w.update();
		long elapsed = System.currentTimeMillis() - time;
		assertEquals(elapsed,200,5);
	}
}
