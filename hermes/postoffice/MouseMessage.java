package hermes.postoffice;

import processing.core.PVector;

/**
 * Message representing mouse actions.
 * <p>
 * Type of MouseMessage determined by the button pressed.
 * <p>
 * Subscription to a mouse button gets you press, release, and drag events;
 * subscription to POConstants.Button.NO gets you mouse moved messages.
 */
public class MouseMessage implements Message {

	//Button clicked in message
	//Get buttons from MouseEvent, 1 is button 1, etc.
	//0 is no buttons
	private POCodes.Button _buttonClicked;
	//Type of action designated by message
	private POCodes.Click _actionType;
	//Locations
	private int _x, _y;
	
	/**
	 * Creates a new MouseMessage.
	 * @param buttonClicked
	 * @param x
	 * @param y
	 */
	public MouseMessage(POCodes.Button buttonClicked, POCodes.Click actionType, int x, int y) {
		_buttonClicked = buttonClicked;
		_actionType = actionType;
		_x = x;
		_y = y;
	}
	
	/**
	 * Gets the button pressed on the mouse.
	 * Use constants defined in POCodes.Button
	 * to figure out what button has been pressed
	 * @return      button type, compare against POCodes.Button
	 */
	public POCodes.Button getButton() {
		return _buttonClicked;
	}
	/**
	 * Gets the action designated by the message.
	 * Compare w/ POCodes.Click to determined actions.
	 * @return      action type, compare against POCodes.Click
	 */
	public POCodes.Click getAction() {
		return _actionType;
	}
	
	/**
	 * Gets the x location of the mouse
	 * @return      int corresponding to x location
	 */
	public int getX() {
		return _x;
	}
	
	/**
	 * Gets the y location of the mouse
	 * @return      int corresponding to y location
	 */
	public int getY() {
		return _y;
	}
	
	/**
	 * Gets position of mouse as PVector
	 * @return		PVector w/ x,y coordinates
	 */
	public PVector getPosition() {
		return new PVector(_x, _y);
	}
	
	/**
	 * Checks for equality of MouseMessages by comparing mouse button.
	 */
	public boolean equals(Object o) {
		if(o instanceof MouseMessage) {
			MouseMessage m = (MouseMessage) o;
			return m.getButton() == this.getButton();
		}
		return false;
	}
}
