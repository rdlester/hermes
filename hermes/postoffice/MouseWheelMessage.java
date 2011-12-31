package hermes.postoffice;

/**
 * Message representing a movement of the Mouse Wheel.
 * All MouseWheelMessages are of the same type.
 */
public class MouseWheelMessage implements Message {
	
	//Represents amount to scroll
	private int _wheelRotation;
	
	/**
	 * Creates a new MouseWheelMessage.
	 * @param wheelRotation
	 */
	public MouseWheelMessage(int wheelRotation) {
		_wheelRotation = wheelRotation;
	}
	
	/**
	 * Gets the amount the wheel has been rotated.
	 */
	public int getWheelRotation() {
		return _wheelRotation;
	}
	
	/**
	 * Checks for the equality of MouseWheelMessage types.
	 */
	public boolean equals(Object o) {
		if(o instanceof MouseWheelMessage) return true;
		return false;
	}
}
