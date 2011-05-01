package src.hermesTest.core;

import org.junit.*;

import processing.core.PVector;
import static org.junit.Assert.*;
import src.hermes.*;
import src.hermes.shape.*;
import static src.hermes.HermesMath.*;

/**
 * test class for Hermes.Being
 * extends Being for protected method access
 * @author Sam
 *
 */
public class BeingTest extends Being {

	public BeingTest() {
		super(new Rectangle(zeroVector(),1.0f,1.0f), zeroVector());
	}
	
	BeingTest being;
	
	@Before
	public void setup() {
		being = new BeingTest();
	}
	
	/**
	 * tests Being.updateTime()
	 */
	@Test
	public void test_updateTime() {
		being.updateTime();
		try {
			Thread.sleep(10);
		} catch (InterruptedException e) { assertTrue(false); }
		long elapsed = being.updateTime();
		assertEquals(elapsed, 1e7,1e6); // this COULD fail if the system is running slow
	}

	@Test
	public void test_EulerIntegratePosition() {
		being.setVelocity(makeVector(0.5f,0.0f,0.0f));
		being.EulerIntegratePosition(0.5);
		assertEquals(being.getPosition().x, 0.25f, 1e-8);
		assertEquals(being.getPosition().y, 0.0f, 1e-8);
		assertEquals(being.getPosition().z, 0.0f, 1e-8);
	}
	
	@Test
	public void test_step() {
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
	
	@Override
	public void draw() {}
	
}
