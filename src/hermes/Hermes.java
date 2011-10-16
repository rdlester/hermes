package src.hermes;

import processing.core.PApplet;

/**
 * Library class for broad scale static helpers, storage of <code>PApplet</code>
 */
public class Hermes {
	
	private static PApplet _parentApplet; //Storage of sketch's PApplet. 
	private static float _timeScale = 1.0f; // the time scale used by Hermes motion and physics calculations
	
	/**
	 * Sets the time scale for calculating motion and physics. This is seconds/unit, so a value of 2 will mean
	 * 	each 2 seconds correspond to one time unit.
	 * @param scale
	 */
	public static void setTimeScale(float scale) {
		_timeScale = scale;
	}
	
	/**
	 * Returns the Hermes time scale.
	 * @return	the time scale
	 */
	public static float getTimeScale() {
		return _timeScale;
	}
	
	/**
	 * Returns the <code>PApplet</code> that Hermes is running in.
	 */
	public static PApplet getPApplet() {
		synchronized(_parentApplet) {
			return _parentApplet;
		}
	}
	
	/**
	 * Set the PApplet that all utilities use. Called <code>Hermes.setPApplet(this)</code> before doing anything else!
	 */
	public static void setPApplet(PApplet parentApplet) {
		_parentApplet = parentApplet;		
	}
	
	/**
	 * Causes the calling thread to sleep, catches InterruptedException.
	 * @param time	the time (in milliseconds) to sleep
	 */
	public static void unsafeSleep(long time) {
		try {
			Thread.sleep(time);
		} catch (InterruptedException e) {}
	}
	
}
