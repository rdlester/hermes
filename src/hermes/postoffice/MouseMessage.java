package src.hermes.postoffice;

//TODO
/**
 * Message representing mouse actions
 */
public class MouseMessage implements Message {

	//Button clicked in message
	//Get buttons from MouseEvent, 1 is button 1, etc.
	//0 is no buttons
	int _buttonClicked;
	//locations
	int _x, _y;
	
	public MouseMessage(int buttonClicked, int x, int y) {
		_buttonClicked = buttonClicked;
		_x = x;
		_y = y;
	}
	
	public int getButton() {
		return _buttonClicked;
	}
	
	public int getX() {
		return _x;
	}
	
	public int getY() {
		return _y;
	}
	
	public boolean equals(Object o) {
		if(o instanceof MouseMessage) {
			MouseMessage m = (MouseMessage) o;
			if(m.getButton() == this.getButton()) return true;
		}
		return false;
	}
}
