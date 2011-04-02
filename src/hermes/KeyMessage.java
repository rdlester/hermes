package src.hermes;

/**
 * Message representing a key stroke
 */
public class KeyMessage implements Message {

	//Char contained by message
	private char _keyPressed;
	
	//Message constructor
	public KeyMessage(char keyPressed) {
		keyPressed = _keyPressed;
	}
	
	//Getter for data represented 
	public char getKey() {
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
