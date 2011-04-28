package src.hermes;

import java.util.Collections;
import java.util.LinkedList;
import java.util.List;
import processing.core.*;
import src.hermes.shape.Rectangle;

/**
 * used to determine what should be drawn
 */
public class Camera extends Environment {
	
	//Rectangle _shape; 	// camera dimensions
	float _x, _y;		// camera's TOP LEFT corner's location in the world

	//width & height of user's world coordinates
	private float _worldCoordinateWidth;
	private float _worldCoordinateHeight;
	
	//contains all the Beings colliding with the Camera in a given timestep
	//repopulated each time step
	List<Being> _beings;

	//Camera's default constructor which uses 1 to 1 world pixel ratio
	public Camera() {
		this(0,0,1,1);
	}
	
	//Camera's constructor with world coordinates for translation
	public Camera(float x, float y, float worldCoordinateWidth, float worldCoordinateHeight) {
		super(new Rectangle(new PVector(x,y,0.0f), new PVector(0,0), new PVector(worldCoordinateWidth, worldCoordinateHeight)),
				new PVector(x,y,0.0f),HermesMath.zeroVector());
		_x = x;
		_y = y;
		_worldCoordinateWidth = worldCoordinateWidth;
		_worldCoordinateHeight = worldCoordinateHeight;
	}
	
	//getters and setters
	
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
	
	/**
	 * creates a new (empty) synchronized List of Beings _being
	 * it will be re-populated each timestep
	 */
	public void update() {//TODO: changeto boolean? if Being's is change to boolean
		_beings = Collections.synchronizedList(new LinkedList<Being>());
	}
	
	/**
	 * adds a Being to _beings. Every item in the list gets drawn.
	 * @param being
	 */
	public void addBeing(Being being) {
		_beings.add(being);
	}

	/**
	 * This method gets called by Processing's draw thread. It handles drawing all of the Beings that 
	 * are colliding with the camera. It translates to each Being's position on screen and draws the
	 * Being there.
	 */
	@Override
	public void draw() {
		PApplet pApplet = Hermes.getPApplet();
		
		// for each being in _beings do matrix manipulations and call the draw method of each being
		for(Being being: _beings) {
			
			//keep track of initial state
			pApplet.pushMatrix();
			
			//translate to being's coordinates on the screen 
			//units of calculation: pixels = (worldmetric)/(worldmetric/pixel)
			float beingXCoordinate = being.getPosition().x/(_worldCoordinateWidth/pApplet.width);
			float beingYCoordinate = being.getPosition().y/(_worldCoordinateHeight/pApplet.height);
			pApplet.translate(beingXCoordinate, beingYCoordinate);
			//save this state
			pApplet.pushMatrix();
			
			//draw being (will draw itself as though it were at (0,0))
			being.draw();
			
			//pop the two states
			pApplet.popMatrix();
			pApplet.popMatrix();
		}
		
	}
	
	
}
