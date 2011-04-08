package src.hermes.postoffice;

public class MouseWheelMessage implements Message {
	
	//Represents amount to scroll
	int _wheelRotation;
	
	public MouseWheelMessage(int wheelRotation) {
		_wheelRotation = wheelRotation;
	}
	
	public int getWheelRotation() {
		return _wheelRotation;
	}
	
	public boolean equals(Object o) {
		if(o instanceof MouseWheelMessage) {
			MouseWheelMessage m = (MouseWheelMessage) o;
			if(m.getWheelRotation() * this.getWheelRotation() > 0) return true;
		}
		return false;
	}
}
