package src.hermes;

import java.util.Iterator;

import src.hermes.postoffice.*;
import src.hermes.hshape.HShape;
import src.hermes.hshape.Rectangle;
import processing.core.*;

/**
 * General game object class.
 * <p>
 * Represents "beings", defined as objects that have:
 * <ul>
 * <li>Position</li>
 * <li>Velocity</li>
 * <li>Shape</li>
 * <li>Drawn to screen</li>
 * <li>Interacts with other Beings</li>
 * <li>Updates itself</li>
 * </ul>
 * Subclasses of <code>Being</code> should be game entities that have at least one of these properties.
 * Subclass <code>HObject</code> directly only if the entity has none of these properties.
 * <p>
 * If you want your Being to draw itself to screen, override the draw() method.
 * If you want your Being to update itself, override the update() method.
 * If you want your Being to receive input messages from the <code>PostOffice</code>,
 * override the message handler method specific to the type of message you want.
 */
public abstract class Being extends HObject implements KeySubscriber, MouseSubscriber, MouseWheelSubscriber, OscSubscriber {

	protected PVector _position; // the being's position
	protected PVector _velocity; // the being's velocity
	
	protected HShape _shape; 		 // the being's shape
	
	private boolean _done = true;	// if the Being does not need more steps this update
	protected long _time;			// the time of the last step	
	
	/**
	 * Creates a Being. Should be called by an class that extends Being.
	 * @param collisionShape	Shape used to determine Being's position and collision detection
	 * @param velocity			The Being's initial velocity. Velocity gets updated automatically every timestep.
	 */
	public Being(HShape collisionShape, PVector velocity) {
		initialize(collisionShape, velocity);
	}

	/**
	 * Alternate constructor that defaults to 0 velocity. 
	 * <br><br>
	 * When a Being's velocity in 0, the World that it is in won't update the Being's position automatically.
	 * Thus, all motion must be handled through setX, setY, or setPosition.
	 * <br><br>
	 * NOTE: If this Being's velocity is later set to something other than 0,
	 * it will then have its position updated automatically.
	 * @param collisionShape		Shape used to determine Being's position and collision detection
	 */
	public Being(HShape collisionShape) { 
		//Defaults to 0 velocity, so update won't move this Being
		initialize(collisionShape, new PVector(0,0));
	}
	
	private void initialize(HShape collisionShape, PVector velocity) {
		assert collisionShape != null : "Being constructor: shape must be a valid Shape";
		assert velocity != null : "Being constructor: velocity must be a valid PVector";
		
		_shape = collisionShape;
		_position = collisionShape.getPosition();
		_velocity = velocity;
		_time = System.nanoTime();
	}
	
	/**
	 * Updates the internal recorded time of the Being using the current system time.
	 * @return	time elaspsed since the last call to updateTime
	 */
	protected long updateTime() { 
		long time = System.nanoTime();
		long elapsed = time - _time;
		if(elapsed > 0) 
			_time = time;
		return elapsed;
	}
	
	/**
	 * Override in subclass if you want to draw the Being to the screen.
	 */
	public void draw() {}
	
	/**
	 * @return	The Being's shape
	 */
	public HShape getShape() {
		return _shape;
	}
	
	/**
	 * @return	The Being's position
	 */
	public PVector getPosition() {
		return _position;
	}
	
	/**
	 * Sets the Being's new position.
	 * <p>
	 * Note: this is a deep copy so the Being's
	 * position and its Shape's position will always
	 * be in sync.
	 * @param position
	 */
	public void setPosition(PVector position) {
		assert position != null : "Being.setPosition: position must be a valid PVector";
		
		_position.x = position.x;
		_position.y = position.y;
		_position.z = position.z;
	}
	
	/**
	 * Sets the Being's position to given x,y values.
	 * @param x		x position
	 * @param y		y position
     */
	public void setPosition(float x, float y) {
		_position.x = x;
		_position.y = y;
	}
	
	/**
	 * Sets the Being's position to given x,y,z values.
	 * @param x		x position
	 * @param y		y position
	 * @param z		z position (at the currrent time a nonzero z may result in unexpected behavior)
	 */
	public void setPosition(float x, float y, float z) {
		_position.x = x;
		_position.y = y;
		_position.z = z;
	}
	
	/**
	 * @return	The Being's x position
	 */
	public float getX() {
		return _position.x;
	}
	
	/**
	 * @return	The Being's y position
	 */
	public float getY() {
		return _position.y;
	}
	
	/**
	 * @param x	Being's new x position
	 */
	public void setX(float x) {
		_position.x = x;
	}
	
	/**
	 * @param x	Being's new y position
	 */
	public void setY(float y) {
		_position.y = y;
	}
	
	/**
	 * @return The Being's velocity
	 */
	public PVector getVelocity() {
		return _velocity;
	}
	
	/**
	 * @return The Being's x velocity
	 */
	public float getVelocityX() {
	    return _velocity.x;
	}
	
	/**
	 * @return The Being's y velocity
	 */
	public float getVelocityY() {
	    return _velocity.y;
	}
	
	/**
	 * Sets the being's velocity to a given vector.
	 * <p>
	 * NOTE: this is a deep copy;
	 * changing velocity vector passed in after this call
	 * will have no effect on the Being.
	 * @param velocity
	 */
	public void setVelocity(PVector velocity) {
		assert velocity != null : "Being.setVelocity: velocity must be a valid PVector";
		
		_velocity.x = velocity.x;
		_velocity.y = velocity.y;
		_velocity.z = velocity.z;
	}
	
	/**
	 * @param x Being's new x velocity
	 */
	public void setVelocityX(float x) {
	    _velocity.x = x;
	}
	
	/**
	 * @param x Being's new y velocity
	 */
	public void setVelocityY(float y) {
	    _velocity.y = y;
	}

	/**
	 * @return	The bounding box enclosing the Being's shape
	 */
	public Rectangle getBoundingBox() {
		return _shape.getBoundingBox();
	}
	
	protected void setDone(boolean done) {
		_done = done;
	}
	
	
	@SuppressWarnings({ "rawtypes", "unchecked" })
	public boolean processUpdate() {
		boolean firstStep = _done;
		if(firstStep)
			update();
		setDone(true);
		step();
		if(!_done && firstStep)
			for(Iterator<GenericGroup> iter = getGroups(); iter.hasNext(); )
				iter.next().addNeedsMoreSamples(this);
		return _done;
	}
	
	public boolean needsMoreSamples() {
		return _done;
	}
	
	/**
	 * Override if Being should update itself on every game step
	 */
	public void update() {}
	
	protected void step() {
		double elapsed = (double)updateTime();
		EulerIntegratePosition(elapsed/1e9*Hermes.timeScale);
	}
	
	protected void EulerIntegratePosition(double dt) {
		_position.add(PVector.mult(_velocity, (float)dt));
	}
	
	/**
	 * @return	String with position and velocity of Being, use for debugging
	 */
	public String toString() {
		return "position: " + _position + " velocity: " + _velocity;
	}
	
	//Methods for receiving methods from PostOffice, defined in subscriber interfaces
	//Left blank here, must be overrided by user to add functionality
	/**
	 * Override if you want your Being to handle Key messages
	 */
	public void handleKeyMessage(KeyMessage m) {
		//VOID
	}
	/**
	 * Override if you want your Being to handle Mouse messages
	 */
	public void handleMouseMessage(MouseMessage m) {
		//VOID
	}
	/**
	 * Override if you want your Being to handle Mouse Wheel messages
	 */
	public void handleMouseWheelMessage(MouseWheelMessage m) {
		//VOID
	}
	/**
	 * Override if you want your Being to handle OSC messages
	 */
	public void handleOscMessage(OscMessage m) {
		//VOID
	}
}
