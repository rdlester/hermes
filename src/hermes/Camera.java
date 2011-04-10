package src.hermes;

import java.util.List;
import processing.core.*;

/**
 * used to determine what should be drawn
 */
public class Camera {
	
	Rectangle screen; 	// camera dimensions
	float x, y;		// camera location in the world

	//width & height of user's world coordinates
	private float _worldCoordinateWidth;
	private float _worldCoordinateHeight;
	
	List<Being> beings;

	//Camera's default constructor which uses 1 to 1 world pixel ratio
	public Camera() {
		_worldCoordinateWidth = 1;
		_worldCoordinateHeight = 1;
	}
	
	//Camera's constructor with world coordinates for translation
	public Camera(float worldCoordinateWidth, float worldCoordinateHeight) {
		_worldCoordinateWidth = worldCoordinateWidth;
		_worldCoordinateHeight = worldCoordinateHeight;
	}
	
	
	// translates from world coordinates to screen coordinates
	Pair<Integer,Integer> worldToScreenCoors(float x, float y) {
		return null;
	}
	
	
	public float getX() {
		return x;
	}

	public void setX(float x) {
		this.x = x;
	}

	public float getY() {
		return y;
	}

	public void setY(float y) {
		this.y = y;
	}
	
	public float getWorldCoordinateWidth() {
		return _worldCoordinateWidth;
	}

	public float getWorldCoordinateHeight() {
		return _worldCoordinateHeight;
	}
	
	
}
