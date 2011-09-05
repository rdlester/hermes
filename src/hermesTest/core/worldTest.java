package src.hermesTest.core;


import org.junit.*;

import static org.junit.Assert.*;

import java.util.Hashtable;
import java.util.LinkedList;
import src.hermes.*;
import static src.hermes.HermesMath.*;
import src.hermes.hshape.*;
import src.hermes.postoffice.PostOffice;
import processing.core.PApplet;
import processing.core.PGraphics;

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
	
	class TestBeing3 extends Being {
		
		int _stepsPerUpdate;
		int _steps;
		Hashtable<TestBeing3,Integer> _checkedInteractions;
		
		public TestBeing3(int numSteps) {
			super(new Rectangle(zeroVector(), 1.0f, 1.0f), zeroVector());
			_stepsPerUpdate = numSteps;
			_checkedInteractions = new Hashtable<TestBeing3,Integer>();
		}
		
		public void update() {
			_steps = 0;
		}
		
		public void step() {
			_steps++;
			if(_steps < _stepsPerUpdate)
				setDone(false);
		}
		
		public void interactWith(TestBeing3 other) {
			Integer previous = _checkedInteractions.get(other);
			if(previous == null) 
				_checkedInteractions.put(other, 1);
			else 
				_checkedInteractions.put(other, previous + 1);
		}
		
		public int getInteractionsWith(TestBeing3 other) {
			Integer interactions = _checkedInteractions.get(other);
			return (interactions != null ? interactions : 0);
		}
		
	}
	
	class MultisampleTestInteractor extends Interactor<TestBeing3,TestBeing3> {
		
		public boolean detect(TestBeing3 being1, TestBeing3 being2) {
			return true;
		}
		
		public void handle(TestBeing3 being1, TestBeing3 being2) {
			being1.interactWith(being2);
			being2.interactWith(being1);
		}
		
	}
	
	class TestInteractor1 extends Interactor<TestBeing2,TestBeing2> {

		public boolean detect(TestBeing2 being1, TestBeing2 being2) {
			return true;
		}

		public void handle(TestBeing2 being1, TestBeing2 being2) {
			being1.interacted = true;
			being2.interacted = true;
		}
		
	}
	
	class TestInteractor2 extends TestInteractor1 {
		
		public void handle(TestBeing2 being1, TestBeing2 being2) {}
		
	}
	
	@Before
	public void setup() {
		PApplet applet = new PApplet();
		applet.g = new PGraphics();
		Hermes.setPApplet(applet);
		applet.rectMode(PApplet.CENTER);
	}
	
	@Test
	public void test_UpdateBeings() {
		updated1 = new LinkedList<TestBeing1>();
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
		assertFalse(g1.getObjects().contains(tb1));
		w.update();
		assertTrue(g1.getObjects().contains(tb1));
		// group remove
		g1.remove(tb1);
		assertTrue(g1.getObjects().contains(tb1));
		w.update();
		assertFalse(g1.getObjects().contains(tb1));
		// delete
		Group<Being> g2 = new Group<Being>(w);
		g1.add(tb1);
		g2.add(tb1);
		w.deleteFromGroups(tb1);
		assertFalse(g1.getObjects().contains(tb1));
		assertFalse(g2.getObjects().contains(tb1));
		
	}
	
	@Test
	public void test_interactions() {
		World w = new World(new PostOffice(), new Camera());
		TestBeing2 b1 = new TestBeing2();
		TestBeing2 b2 = new TestBeing2();
		w.registerInteraction(b1, b2, new TestInteractor1());
		w.update();
		w.update();
		assertTrue(b1.interacted);
		assertTrue(b2.interacted);
		w = new World(new PostOffice(), new Camera());
		b1 = new TestBeing2();
		b2 = new TestBeing2();
		w.registerInteraction(b1, b2, new TestInteractor1());
		w.update();
		w.update();
		assertTrue(b1.interacted);
		assertTrue(b2.interacted);
		w = new World(new PostOffice(), new Camera());
		b1 = new TestBeing2();
		b2 = new TestBeing2();
		w.registerInteraction(b1, b2, new TestInteractor2());
		w.update();
		w.update();
		assertFalse(b1.interacted);
		assertFalse(b2.interacted);
	}
	
	@Test
	public void test_multisampledInteractions() {
		World w = new World(new PostOffice(), new Camera());
		Group<TestBeing3> g1 = new Group<TestBeing3>(w);
		Group<TestBeing3> g2 = new Group<TestBeing3>(w);
		TestBeing3[] beings = new TestBeing3[7];
		g1.add(beings[0] = new TestBeing3(1));
		g1.add(beings[1] = new TestBeing3(2));
		g1.add(beings[2] = new TestBeing3(3));
		g2.add(beings[3] = new TestBeing3(1));
		g2.add(beings[4] = new TestBeing3(2));
		g2.add(beings[5] = new TestBeing3(3));
		g2.add(beings[6] = new TestBeing3(4));
		w.registerInteraction(g1, g2, new MultisampleTestInteractor());
		w.update();
		assertEquals(beings[0].getInteractionsWith(beings[1]), 0);
		assertEquals(beings[0].getInteractionsWith(beings[2]), 0);
		assertEquals(beings[0].getInteractionsWith(beings[3]), 1);
		assertEquals(beings[0].getInteractionsWith(beings[4]), 2);
		assertEquals(beings[0].getInteractionsWith(beings[5]), 0);
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
