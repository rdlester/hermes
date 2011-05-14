package src.hermesTest.core;


import org.junit.*;
import static org.junit.Assert.*;
import java.util.LinkedList;
import src.hermes.*;
import static src.hermes.HermesMath.*;
import src.hermes.shape.*;
import src.hermes.postoffice.PostOffice;
import processing.core.PApplet;

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
	
	class TestWorld1 extends World {

		int nUpdates;
		
		public TestWorld1(int nUpdates) {
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
	
	class TestWorld2 extends World {
		
		boolean preUpdated = false;
		boolean postUpdated = false;
		boolean setupCalled = false;
		boolean shutdownCalled = false;
		
		public TestWorld2() {
			super(new PostOffice(), new Camera());
		}
		
		public void setup() {
			setupCalled = true;
		}
		
		public void shutDown() {
			shutdownCalled = true;
		}
		
		public void preUpdate() {
			preUpdated = true;
		}
		
		public void postUpdate() {
			postUpdated = true;
		}
		
		public void shutdown() {
			shutdownCalled = true;
		}
		
	}
	
	class TestBeing2 extends Being {
		
		boolean interacted = false;
		
		public TestBeing2() {
			super(new Rectangle(zeroVector(), 1.0f, 1.0f), zeroVector());
		}

		@Override
		public void draw() {}
		
	}
	
	class TestInteractor1 implements Interactor<TestBeing2,TestBeing2> {

		@Override
		public boolean detect(TestBeing2 being1, TestBeing2 being2) {
			return true;
		}

		@Override
		public boolean handle(TestBeing2 being1, TestBeing2 being2) {
			being1.interacted = true;
			being2.interacted = true;
			return true;
		}
		
	}
	
	class TestInteractor2 extends TestInteractor1 {
		
		public boolean handle(TestBeing2 being1, TestBeing2 being2) {
			return true;
		}
		
	}
	
	@Test
	public void test_UpdateBeings() {
		updated1 = new LinkedList<TestBeing1>();
		PApplet papp = new PApplet();
		Hermes.setPApplet(papp);
		TestWorld1 tw1 = new TestWorld1(3);
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
	public void test_run() {
		TestWorld2 tw2 = new TestWorld2();
		tw2.start();
		Hermes.unsafeSleep(100);
		assertTrue(tw2.setupCalled);
		assertTrue(tw2.preUpdated);
		assertTrue(tw2.postUpdated);
		assertTrue(tw2.isActive());
		tw2.deActivate();
		Hermes.unsafeSleep(100);
		assertFalse(tw2.isActive());
		assertTrue(tw2.shutdownCalled);
	}
	
	@Test
	public void test_groupOperations() {
		World w = new World(new PostOffice(), new Camera());
		Group<Being> g1 = new Group<Being>(w);
		// group add
		TestBeing1 tb1 = new TestBeing1();
		g1.add(tb1);
		assertFalse(g1.getBeings().contains(tb1));
		w.update();
		assertTrue(g1.getBeings().contains(tb1));
		// group remove
		g1.remove(tb1);
		assertTrue(g1.getBeings().contains(tb1));
		w.update();
		assertFalse(g1.getBeings().contains(tb1));
		// delete
		Group<Being> g2 = new Group<Being>(w);
		g1.add(tb1);
		g2.add(tb1);
		w.deleteBeing(tb1);
		assertFalse(g1.getBeings().contains(tb1));
		assertFalse(g2.getBeings().contains(tb1));
		
	}
	
	@Test
	public void test_interactions() {
		World w = new World(new PostOffice(), new Camera());
		TestBeing2 b1 = new TestBeing2();
		TestBeing2 b2 = new TestBeing2();
		w.registerInteraction(b1, b2, new TestInteractor1(), true);
		w.update();
		w.update();
		assertTrue(b1.interacted);
		assertTrue(b2.interacted);
		w = new World(new PostOffice(), new Camera());
		b1 = new TestBeing2();
		b2 = new TestBeing2();
		w.registerInteraction(b1, b2, new TestInteractor1(), false);
		w.update();
		w.update();
		assertTrue(b1.interacted);
		assertTrue(b2.interacted);
		w = new World(new PostOffice(), new Camera());
		b1 = new TestBeing2();
		b2 = new TestBeing2();
		w.registerInteraction(b1, b2, new TestInteractor2(), false);
		w.update();
		w.update();
		assertFalse(b1.interacted);
		assertFalse(b2.interacted);
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
