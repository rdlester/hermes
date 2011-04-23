package src.hermes;

import java.util.List;
import processing.core.*;
import src.hermes.shape.Rectangle;

/**
 * used to determine what should be drawn
 */
public class Camera extends Environment {
	
	//Rectangle _shape; 	// camera dimensions
	float _x, _y;		// camera location in the world

	//width & height of user's world coordinates
	private float _worldCoordinateWidth;
	private float _worldCoordinateHeight;
	
	List<Being> _beings;

	//Camera's default constructor which uses 1 to 1 world pixel ratio
	public Camera() {
		_worldCoordinateWidth = 1;
		_worldCoordinateHeight = 1;
		_x=0;
		_y=0;
		_shape = new Rectangle(new PVector(_x,_y), new PVector(0,0), new PVector(_worldCoordinateWidth, _worldCoordinateHeight));
	}
	
	//Camera's constructor with world coordinates for translation
	public Camera(float x, float y, float worldCoordinateWidth, float worldCoordinateHeight) {
		_x = x;
		_y = y;
		_worldCoordinateWidth = worldCoordinateWidth;
		_worldCoordinateHeight = worldCoordinateHeight;
		_shape = new Rectangle(new PVector(_x,_y), new PVector(0,0), new PVector(_worldCoordinateWidth, _worldCoordinateHeight));
	}
	
	
	public float getX() {
		return _x;
	}

	public void setX(float x) {
		_x = x;
	}

	public float getY() {
		return _y;
	}

	public void setY(float y) {
		_y = y;
	}
	
	public float getWorldCoordinateWidth() {
		return _worldCoordinateWidth;
	}
	
	public void setWorldCoordinateWidth(float worldCoordinateWidth) {
		_worldCoordinateWidth = worldCoordinateWidth;
	}

	public float getWorldCoordinateHeight() {
		return _worldCoordinateHeight;
	}
	
	public void setWorldCoordinateHeight(float worldCoordinateHeight) {
		_worldCoordinateHeight = worldCoordinateHeight;
	}

	@Override
	public void draw(int x, int y) {
		// TODO Auto-generated method stub
		
	}
	
	
}
