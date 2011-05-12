package src.hermes.postoffice;

/**
 * Message representing a key stroke
 * The type of the key message is determined by the key it corresponds to
 */
public class KeyMessage implements Message {

	//key code of message
	private int _keyCode;
	
	//Char contained by message
	private char _keyChar;
	
	//Boolean indicating if key is pressed or released
	private boolean _isPressed;
	
	/**
	 * Creates a new KeyMessage
	 * @param keyCode - int corresponding to key, use PostOffice constants to determine key
	 * @param keyChar - char corresponding to key, PostOffice.CHAR_UNDEFINED if key is non-unicode
	 * @param b - true when key is pressed, false when key is released
	 */
	public KeyMessage(int keyCode, char keyChar, boolean isPressed) {
		_keyCode = keyCode;
		_keyChar = keyChar;
		_isPressed = isPressed;
	}

	/**
	 * @return integer corresponding to key pressed, use key constants in PostOffice to determine key
	 */
	public int getKeyCode() {
		return _keyCode;
	}
	
	/**
	 * @return char representing the key acted upon if key is unicode
	 */
	public char getKeyChar() {
	    assert _keyChar != PostOffice.CHAR_UNDEFINED: "KeyMessage.getKeyChar() - Cannot get char of non-unicode key"
		return _keyChar;
	}
	
	/**
	 * Tells if key is pressed or not
	 * @return true is key is pressed, false if key is released
	 */
	public boolean isPressed() {
		return _isPressed;
	}
	
	/**
	 * Checks for equality of KeyMessage by comparing key codes
	 */
	public boolean equals(Object o) {
		if(o instanceof KeyMessage) {
			KeyMessage m = (KeyMessage) o;
			return this.getKeyCode() == m.getKeyCode();
		}
		return false;
	}
}
