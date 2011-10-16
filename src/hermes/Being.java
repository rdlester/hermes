package src.hermes;

import java.util.Iterator;

import src.hermes.postoffice.*;
import src.hermes.hshape.HShape;
import src.hermes.hshape.Rectangle;
import processing.core.*;

/**
 * General game object class.
 * <p>
 * Represents "beings", defined as (H)Objects that have:
 * <ul>
 * <li>Position</li>
 * <li>Velocity</li>
 * <li>Shape</li></ul>
 * Furthermore, <code>Being</code>s can be: 
 * <ul>
 * <li>Drawn to screen</li>
 * <li>Interact with other <code>Being</code>s</li>
 * <li>Update themselves</li>
 * </ul>
 * Subclasses of <code>Being</code> should be game entities that have at least one of these properties.
 * Subclass <code>HObject</code> directly only if the entity has none of these properties.
 * <p>
 * If you want a <code>Being</code> to draw itself to screen, override the draw() method.
 * If you want a <code>Being</code> to update itself, override the update() method.
 * If you want a <code>Being</code> to receive input messages from the <code>PostOffice</code>,
 * override the message handler method specific to the type of message you want.
 */
public abstract class Being extends HObject implements KeySubscriber, MouseSubscriber, MouseWheelSubscriber, OscSubscriber {

	protected PVector _position; // the Being's position
	protected PVector _velocity; // the Being's velocity
	
	protected HShape _shape; 		 // the Being's shape
	
	private boolean _done = true;	// if the Being does not need more steps this update
	protected long _time;			// the time of the last step	
	
	/**
	 * Creates a <code>Being</code>. Should be called by a class that extends <code>Being</code>.
	 * @param collisionShape	Shape used to determine <code>Being</code>'s position and collision detection
	 * @param velocity			The <code>Being</code>'s initial velocity. Velocity gets updated automatically every timestep.
	 */
	public Being(HShape collisionShape, PVector velocity) {
		initialize(collisionShape, velocity);
	}

	/**
	 * Alternate constructor that defaults to 0 velocity. 
	 * <br><br>
	 * When a <code>Being</code>'s velocity in 0, the World that it is in won't update the <code>Being</code>'s position automatically.
	 * Thus, all motion must be handled through setX, setY, or setPosition.
	 * <br><br>
	 * NOTE: If this <code>Being</code>'s velocity is later set to something other than 0,
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
	 * Updates the internal recorded time of the <code>Being</code> using the current system time.
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
	 * @return	The <code>Being</code>'s shape
	 */
	public HShape getShape() {
		return _shape;
	}
	
	/**
	 * @return	The <code>Being</code>'s position
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
	 * Sets the <code>Being</code>'s position to given x,y values.
	 * @param x		x position
	 * @param y		y position
     */
	public void setPosition(float x, float y) {
		_position.x = x;
		_position.y = y;
	}
	
	/**
	 * Sets the <code>Being</code>'s position to given x,y,z values.
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
	 * @return	The <code>Being</code>'s x position
	 */
	public float getX() {
		return _position.x;
	}
	
	/**
	 * @return	The <code>Being</code>'s y position
	 */
	public float getY() {
		return _position.y;
	}
	
	/**
	 * @param x	<code>Being</code>'s new x position
	 */
	public void setX(float x) {
		_position.x = x;
	}
	
	/**
	 * @param x	<code>Being</code>'s new y position
	 */
	public void setY(float y) {
		_position.y = y;
	}
	
	/**
	 * @return The <code>Being</code>'s velocity
	 */
	public PVector getVelocity() {
		return _velocity;
	}
	
	/**
	 * @return The <code>Being</code>'s x velocity
	 */
	public float getVelocityX() {
	    return _velocity.x;
	}
	
	/**
	 * @return The <code>Being</code>'s y velocity
	 */
	public float getVelocityY() {
	    return _velocity.y;
	}
	
	/**
	 * Sets the <code>Being</code>'s velocity to a given vector.
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
	 * @param x <code>Being</code>'s new x velocity
	 */
	public void setVelocityX(float x) {
	    _velocity.x = x;
	}
	
	/**
	 * @param x <code>Being</code>'s new y velocity
	 */
	public void setVelocityY(float y) {
	    _velocity.y = y;
	}

	/**
	 * Gets the bounding box enclosing the <code>Being</code>'s shape.
	 * @return	The bounding box enclosing the <code>Being</code>'s shape
	 */
	public Rectangle getBoundingBox() {
		return _shape.getBoundingBox();
	}
	
	protected void setDone(boolean done) {
		_done = done;
	}
	
	/**
	 * Used internally (needed for multi-sampling).
	 */
	@SuppressWarnings({ "rawtypes", "unchecked" })
	protected boolean processUpdate() {
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
		return !_done;
	}
	
	/**
	 * Override if <code>Being</code> should update itself on every game step
	 */
	protected void update() {}
	
	/**
	 * Updates the <code>Being</code>'s position, called for on each update, if multisampling is enabled will be for each sample.
	 * <br>
	 * Override if you want to perform movement manually rather than letting it move automatically.
	 */
	protected void step() {
		double elapsed = (double)updateTime();
		EulerIntegratePosition(elapsed/1e9*Hermes.timeScale);
	}
	
	/**
	 * Moves the <code>Being</code> by its velocity * the elapsed time <code>dt</code>.
	 * @param dt	the elapsed time to use for Euler integration
	 */
	protected void EulerIntegratePosition(double dt) {
		_position.add(PVector.mult(_velocity, (float)dt));
	}
	
	/**
	 * @return	String with position and velocity of <code>Being</code>, use for debugging
	 */
	public String toString() {
		return "position: " + _position + " velocity: " + _velocity;
	}
	
	//Methods for receiving methods from PostOffice, defined in subscriber interfaces
	//Left blank here, must be overridden by user to add functionality
	/**
	 * Override if you want your <code>Being</code> to handle Key messages
	 */
	public void handleKeyMessage(KeyMessage m) {
		//VOID
	}
	/**
	 * Override if you want your <code>Being</code> to handle Mouse messages
	 */
	public void handleMouseMessage(MouseMessage m) {
		//VOID
	}
	/**
	 * Override if you want your <code>Being</code> to handle Mouse Wheel messages
	 */
	public void handleMouseWheelMessage(MouseWheelMessage m) {
		//VOID
	}
	/**
	 * Override if you want your <code>Being</code> to handle OSC messages
	 */
	public void handleOscMessage(OscMessage m) {
		//VOID
	}
}
