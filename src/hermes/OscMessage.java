package src.hermes;

import com.illposed.osc.*;

/**
 * Message representing an OSC message
 */
public class OscMessage implements Message {
	
	//Address of OSCMessage
	String _address;
	//Contents of OSCMessage
	Object[] _contents;
	
	/**
	 * Basic constructor for unpacked OSCMessage 
	 */
	public OscMessage(String address, Object[] contents) {
		_address = address;
		_contents = contents;
	}
	
	/**
	 * Constructor taking an illposed OSCMessage
	 */
	public OscMessage(OSCMessage message) {
		
	}
	
	public String getAddress() {
		return _address;
	}
	
	public Object[] getContents() {
		return _contents;
	}
	
	public boolean equals() {
		
	}
}
