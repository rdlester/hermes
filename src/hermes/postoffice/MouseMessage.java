package src.hermes.postoffice;

import java.awt.event.MouseEvent;

/**
 * Message representing mouse actions
 * Type of MouseMessage determined by the button pressed
 * Subscription to a mouse button gets you press, release, and drag events
 * Subscription to nobutton gets you mouse moved events
 */
public class MouseMessage implements Message {

	//Button clicked in message
	//Get buttons from MouseEvent, 1 is button 1, etc.
	//0 is no buttons
	private int _buttonClicked;
	//Type of action designated by message
	private int _actionType;
	//Locations
	private int _x, _y;
	
	//Constants representing mouseclicks
	public static int NOBUTTON = MouseEvent.NOBUTTON;
	public static int BUTTON1 = MouseEvent.BUTTON1;
	public static int BUTTON2 = MouseEvent.BUTTON2;
	public static int BUTTON3 = MouseEvent.BUTTON3;
	
	//Constants representing type of mouse action
	public static int MOUSE_PRESSED = MouseEvent.MOUSE_PRESSED;
	public static int MOUSE_RELEASED = MouseEvent.MOUSE_RELEASED;
	public static int MOUSE_DRAGGED = MouseEvent.MOUSE_DRAGGED;
	public static in MOUSE_MOVED = MouseEvent.MOUSE_CLICKED;
	
	/**
	 * Creates a new MouseMessage
	 * @param buttonClicked
	 * @param x
	 * @param y
	 */
	public MouseMessage(int buttonClicked, int actionType, int x, int y) {
		_buttonClicked = buttonClicked;
		_actionType = actionType;
		_x = x;
		_y = y;
	}
	
	/**
	 * Gets the button pressed on the mouse
	 * Use BUTTON1, BUTTON2, BUTTON3 constants defined in MouseMessage
	 * to figure out what button has been pressed 
	 */
	public int getButton() {
		return _buttonClicked;
	}
	
	/**
	 * Gets the action designated by the event
	 * Use MOUSE_PRESSED, MOUSE_RELEASED, MOUSE_DRAGGED, and MOUSE_MOVED
	 * to determined actions
	 */
	public int getAction() {
		return _actionType;
	}
	
	/**
	 * Gets the x location of the mouse sending this message
	 */
	public int getX() {
		return _x;
	}
	
	/**
	 * Gets the y location of the mouse sending this message
	 */
	public int getY() {
		return _y;
	}
	
	/**
	 * Checks for equality of MouseMessages
	 */
	public boolean equals(Object o) {
		if(o instanceof MouseMessage) {
			MouseMessage m = (MouseMessage) o;
			if(m.getButton() == this.getButton()) return true;
		}
		return false;
	}
}
