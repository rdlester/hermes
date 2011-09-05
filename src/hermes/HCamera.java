package src.hermes;

import java.util.Collections;
import java.util.LinkedList;
import java.util.List;
import java.util.Iterator;
import processing.core.*;
import src.hermes.hshape.Rectangle;

/**
 * <code>HCamera</code> determines which <code>Being</code>s get drawn. You can think of it as a window into the <code>World</code>, 
 * and any <code>Being</code>s that are inside of its bounding box will have their <code>draw()</code> methods called automatically.
 * 
 * <p>
 * The <code>World</code> class needs to be passed an <code>HCamera</code> when constructed.  
 * Any <code>Being</code>(s) registered with that <code>World</code> will automatically get drawn if they are
 * spatially within that <code>HCamera</code>'s bounding box. 
 * 
 * <p>
 * An <code>HCamera</code>'s bounding box is determined at construction - by default, it uses the pixel width and height of the PApplet that was passed to <code>Hermes</code>.
 * Alternatively, <code>HCamera</code> has an alternate constructor that allows you to set your own custom screen to world coordinate ratio. 
 * If you wish to use a coordinate system other than pixels coordinates, simply set the width and height of the camera to the area of the world you want the camera to see at a time.
 * 
 * <p>
 * <code>HCamera</code> extends <code>Being</code>, which allows it to move around and interact with other entities in the game. 
 * This opens interesting possibilities, such as having a camera follow a character, having the camera move based on game events or other logic, etc. 
 * 
 * 
 * 
 */
public class HCamera extends Being {

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

	//Camera's default constructor which uses 
	
/**
	Default HCamera constructor. 
	Passing no arguments gives HCamera a 1-to-1 world pixel ratio (the world coordinate units are the same size as the screen's pixel coordinates)
	 
 */
	public HCamera() {
		this(0,0,Hermes.getPApplet().width,Hermes.getPApplet().height);
	}


	/**
	 * Constructs an HCamera with a custom coordinate unit size.
	 * @param x					the starting x coordinate of the camera
	 * @param y					the starting y coordinate of the camera
	 * @param cameraWidth		the width of the camera view, in world coordinate units. This determines how far the camera can see in the x direction.
	 * @param cameraHeight		the height of the camera view. This determines how far the camera can see in the y direction.
	 */
	public HCamera(float x, float y, float cameraWidth, float cameraHeight) {
		super(new Rectangle(new PVector(x,y), new PVector(0,0), new PVector(cameraWidth, cameraHeight)),
				HermesMath.zeroVector());
		_worldCoordinateWidth = cameraWidth;
		_worldCoordinateHeight = cameraHeight;
		
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
	
	//pixels/(worldmetric)
	public float getScreenToWorldRatioX() {
		return Hermes.getPApplet().width/_worldCoordinateWidth;
	}
	
	//pixels/(worldmetric)
	public float getScreenToWorldRatioY() {
		return Hermes.getPApplet().height/_worldCoordinateHeight;
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
	
	//TODO: make sure these work and comment properly
	
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
