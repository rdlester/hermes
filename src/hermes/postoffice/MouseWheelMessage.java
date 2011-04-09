package src.hermes.postoffice;

/**
 * Message representing a movement of the Mouse Wheel
 * There are two types of wheel messages:
 * Up messages (rotation amounts that are negative)
 * Down messages (rotation amounts that are positive)
 */
public class MouseWheelMessage implements Message {
	
	//Represents amount to scroll
	int _wheelRotation;
	
	/**
	 * Creates a new MouseWheelMessage
	 * @param wheelRotation
	 */
	public MouseWheelMessage(int wheelRotation) {
		_wheelRotation = wheelRotation;
	}
	
	/**
	 * Gets the amount the wheel has been rotated
	 */
	public int getWheelRotation() {
		return _wheelRotation;
	}
	
	/**
	 * Checks for the equality of MouseWheelMessage types
	 */
	public boolean equals(Object o) {
		if(o instanceof MouseWheelMessage) {
			MouseWheelMessage m = (MouseWheelMessage) o;
			if(m.getWheelRotation() * this.getWheelRotation() > 0) return true;
		}
		return false;
	}
}
