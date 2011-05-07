package src.hermes;

import java.util.Collections;
import java.util.LinkedList;
import java.util.List;
import java.util.Iterator;
import processing.core.*;
import src.hermes.shape.Rectangle;

/**
 * used to determine what should be drawn
 */
public class Camera extends Environment {

	//width & height of user's world coordinates
	private float _worldCoordinateWidth;
	private float _worldCoordinateHeight;
	
	@SuppressWarnings("unused")
	private float _zoomFactor;

	//contains all the Beings colliding with the Camera in a given timestep
	//repopulated each time step
	List<Being> _beingsPending;
	List<Being> _beingsDrawn;
	Boolean _switchToBeingsPending;

	//Camera's default constructor which uses 1 to 1 world pixel ratio
	public Camera() {
		this(0,0,Hermes.getPApplet().width,Hermes.getPApplet().height);
	}

	//Camera's constructor with world coordinates for translation
	public Camera(float x, float y, float worldCoordinateWidth, float worldCoordinateHeight) {
		super(new Rectangle(new PVector(x,y), new PVector(0,0), new PVector(worldCoordinateWidth, worldCoordinateHeight)),
				HermesMath.zeroVector());
		_worldCoordinateWidth = worldCoordinateWidth;
		_worldCoordinateHeight = worldCoordinateHeight;
		
		_zoomFactor = 1.0f;

		_beingsPending = new LinkedList<Being>();
		_beingsDrawn = new LinkedList<Being>();
		
		_switchToBeingsPending = new Boolean(false);
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
	 * Resets internal state parameters, effectively clearing the cache of
	 * collided Beings from the last time step
	 */
	public void collisionsReset() {
		synchronized(_switchToBeingsPending) {
			_switchToBeingsPending = false;
		}
		
		synchronized(_beingsPending) {
			_beingsPending = Collections.synchronizedList(new LinkedList<Being>());
		}
	}
	
	/**
	 * This method is a callback, letting the Camera know that the _beingsPending list
	 * has been completed for this timestep, and that it can switch to make it the actively
	 * drawn list of Beings on the next call to draw()
	 */
	public void collisionsComplete() {
		synchronized(_switchToBeingsPending) {
			_switchToBeingsPending = true;
		}
	}

	/**
	 * adds a Being to _beings. Every item in the list gets drawn.
	 * @param being
	 */
	public void addBeing(Being being) {
		synchronized(_beingsPending) {
			_beingsPending.add(being);
		}
	}
	
	//TODO: make sure these work and comment properlyl
	
	/**
	 * 
	 * @param zoomFactor
	 * @param worldZoomCenterX
	 * @param worldZoomCenterY
	 */
	public void zoomWithWorldCoordinates(float zoomFactor, float worldZoomCenterX, float worldZoomCenterY) {
		//change the World width and height of the Camera
		_worldCoordinateWidth = _worldCoordinateWidth/zoomFactor;
		_worldCoordinateHeight = _worldCoordinateHeight/zoomFactor;
		
		//find the new top-left point in World coordinates
		getPosition().x = worldZoomCenterX - _worldCoordinateWidth/2;
		getPosition().y = worldZoomCenterY - _worldCoordinateHeight/2;
		
		//set the _zoomFactor
		_zoomFactor = zoomFactor;
	}
	
	public void zoomWithScreenCoordinates(float zoomFactor, float screenZoomCenterX, float screenZoomCenterY) {
		//translate from screen coordinates to world coordinates
		//units of calculation: worldmetric = pixels * (worldmetric/pixel)
		float worldX = screenZoomCenterX * (_worldCoordinateWidth/Hermes.getPApplet().width);
		float worldY = screenZoomCenterY * (_worldCoordinateHeight/Hermes.getPApplet().height);
		
		//call other method that works with world coordinates
		this.zoomWithWorldCoordinates(zoomFactor, worldX, worldY);		
	}
	
	
	
	

	/**
	 * This method gets called by Processing's draw thread. It handles drawing all of the Beings that 
	 * are colliding with the camera. It translates to each Being's position on screen and draws the
	 * Being there.
	 */
	@Override
	public void draw() {
		PApplet pApplet = Hermes.getPApplet();
		
		synchronized(_switchToBeingsPending) {
			if(_switchToBeingsPending) {
				synchronized(_beingsPending) {
					_beingsDrawn = _beingsPending;
				}
			}
		}
		
		pApplet.translate(-getPosition().x / (_worldCoordinateWidth/pApplet.width),
				-getPosition().y / (_worldCoordinateHeight/pApplet.height));
		
		// for each being in _beings do matrix manipulations and call the draw method of each being
		for(Iterator<Being> iter = _beingsDrawn.iterator(); iter.hasNext(); ) {


			Being being = iter.next();

			synchronized(being) {

				pApplet.pushMatrix();
				
				//translate to being's coordinates on the screen 
				//units of calculation: pixels = (worldmetric)/(worldmetric/pixel)
				float beingXCoordinate = being.getPosition().x/(_worldCoordinateWidth/pApplet.width);
				float beingYCoordinate = being.getPosition().y/(_worldCoordinateHeight/pApplet.height);
				pApplet.translate(beingXCoordinate, beingYCoordinate);
				//pApplet.scale(_zoomFactor);
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

}
