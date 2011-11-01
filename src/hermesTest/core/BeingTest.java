package src.hermesTest.core;

import hermes.*;
import hermes.hshape.*;

import org.junit.*;

import processing.core.PApplet;
import processing.core.PGraphics;

import static hermes.HermesMath.*;
import static org.junit.Assert.*;

/**
 * test class for Hermes.Being
 * extends Being for protected method access
 * @author Sam
 *
 */
public class BeingTest {

	public class TestBeing extends Being {
	
		public TestBeing() {
			super(new Rectangle(zeroVector(),1.0f,1.0f), zeroVector());
		}
	
		public long updateTime() {
			return super.updateTime();
		}
		
		public boolean processUpdate() {
			return super.processUpdate();
		}
		
		public void step() {
			super.step();
		}
		
		public void EulerIntegratePosition(double dt) {
			super.EulerIntegratePosition(dt);
		}
		
		public void draw() {}
	}
	
	@Before
	public void setup() {
		PApplet applet = new PApplet();
		applet.g = new PGraphics();
		Hermes.setPApplet(applet);
		applet.rectMode(PApplet.CENTER);
	}
	
	/**
	 * tests Being.updateTime()
	 */
	@Test
	public void test_updateTime() {
		TestBeing being = new TestBeing();	
		being.updateTime();
		try {
			Thread.sleep(10);
		} catch (InterruptedException e) { assertTrue(false); }
		long elapsed = being.updateTime();
		assertEquals(elapsed, 1e7,1e6); // this COULD fail if the system is running slow
	}

	@Test
	public void test_EulerIntegratePosition() {
		TestBeing being = new TestBeing();	
		being.setVelocity(makeVector(0.5f,0.0f,0.0f));
		being.EulerIntegratePosition(0.5);
		assertEquals(being.getPosition().x, 0.25f, 1e-8);
		assertEquals(being.getPosition().y, 0.0f, 1e-8);
		assertEquals(being.getPosition().z, 0.0f, 1e-8);
	}
	
	@Test
	public void test_step() {
		TestBeing being = new TestBeing();	
		being.setVelocity(makeVector(0.5f,0.0f,0.0f));
		being.updateTime();
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) { assertTrue(false); }
		being.step();
		assertEquals(being.getPosition().x, 0.5f, 1e-2);
		assertEquals(being.getPosition().y, 0.0f, 1e-2);
		assertEquals(being.getPosition().z, 0.0f, 1e-2);
	}
	
	@Test
	public void test_processUpdate() {
		TestBeing being = new TestBeing();	
		being.setVelocity(makeVector(0.5f,0.0f,0.0f));
		being.updateTime();
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) { assertTrue(false); }
		being.processUpdate();
		assertEquals(being.getPosition().x, 0.5f, 1e-2);
		assertEquals(being.getPosition().y, 0.0f, 1e-2);
		assertEquals(being.getPosition().z, 0.0f, 1e-2);
	}
	
	
}
