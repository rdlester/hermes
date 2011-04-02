package src.hermes.postoffice;

/**
 * Message representing a key stroke
 */
public class KeyMessage implements Message {

	//Char contained by message
	private String _keyPressed;
	
	//Boolean indicating if key is pressed or released
	private boolean _isPressed;
	
	/**
	 * Creates a new KeyMessage
	 * @param keyString - String representing key
	 * @param isPressed - true when key is pressed, false when key is released
	 */
	public KeyMessage(String keyString, boolean isPressed) {
		_keyPressed = keyString;
		_isPressed = isPressed;
	}
	
	/**
	 * Getter for the name of the key acted upon
	 */
	public String getKey() {
		return _keyPressed;
	}
	
	/**
	 * Tells if key is pressed or not
	 */
	public boolean isPressed() {
		return _isPressed;
	}
	
	//Checks for equality of KeyMessage
	public boolean equals(Object o) {
		if(o instanceof KeyMessage) {
			KeyMessage m = (KeyMessage) o;
			if(this.getKey() == m.getKey()) return true;
		}
		return false;
	}
}
