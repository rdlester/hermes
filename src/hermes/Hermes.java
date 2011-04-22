package src.hermes;

import processing.core.PApplet;
import java.math.*;

/**
 * Library class for broad scale static helpers, storage of PApplet
 */
public class Hermes {
	
	private static PApplet _parentApplet; //Storage of sketch's PApplet. 
	
	/**
	 * Getter for the PApplet
	 */
	public static PApplet getPApplet() {
		return _parentApplet;		
	}
	
	/**
	 * Set the PApplet that all utilities use
	 */
	public static void setPApplet(PApplet parentApplet) {
		_parentApplet = parentApplet;		
	}
<<<<<<< HEAD
	
		
	public static final float INFINITY = Float.POSITIVE_INFINITY;
		
	
=======

>>>>>>> 6c71a88477993c61ee0227e46ea4720b08159a44
}
