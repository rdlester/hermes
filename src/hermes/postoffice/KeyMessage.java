package src.hermes.postoffice;

/**
 * Message representing a key stroke
 */
public class KeyMessage implements Message {

	//Char contained by message
	private int _keyPressed;
	
	//Boolean indicating if key is pressed or released
	private boolean _isPressed;
	
	/**
	 * 
	 * @param keyPressed
	 */
	public KeyMessage(int keyPressed, boolean isPressed) {
		_keyPressed = keyPressed;
		_isPressed = isPressed;
	}
	
	//Getter for data represented 
	public int getKey() {
		return _keyPressed;
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
