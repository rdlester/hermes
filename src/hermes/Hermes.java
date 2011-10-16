package src.hermes;

import processing.core.PApplet;

/**
 * Library class for broad scale static helpers, storage of <code>PApplet</code>
 */
public class Hermes {
	
	private static PApplet _parentApplet; //Storage of sketch's PApplet. 
	public static float timeScale = 1.0f;
	
	/**
	 * Getter for the PApplet.
	 */
	public static PApplet getPApplet() {
		synchronized(_parentApplet) {
			return _parentApplet;
		}
	}
	
	/**
	 * Set the PApplet that all utilities use.
	 */
	public static void setPApplet(PApplet parentApplet) {
		_parentApplet = parentApplet;		
	}
	
	/**
	 * Causes the calling thread to sleep, catches InterruptedException without any interactions.
	 * @param time	the time (in milliseconds) to sleep
	 */
	public static void unsafeSleep(long time) {
		try {
			Thread.sleep(time);
		} catch (InterruptedException e) {}
	}
	
}
