package src.hermes.postoffice;

import com.illposed.osc.*;

/**
 * Message representing an OSC message
 * Very similar to illposed's OSCMessage, but implementing Message so it can be used in PostOffice
 */
//TODO: change the name to something that conflicts less with illposed
public class OscMessage implements Message {
	
	//Address of OSCMessage
	String _address;
	//Contents of OSCMessage
	Object[] _contents;
	
	/**
	 * Basic constructor for unpacked OSCMessage
	 * @param address - Address of OscMessage
	 * @param contents - Contents of OscMessage
	 */
	public OscMessage(String address, Object[] contents) {
		_address = address;
		_contents = contents;
	}
	
	/**
	 * Constructor taking an illposed OSCMessage
	 * @param message - a packed OSCMessage in illposed's format
	 */
	public OscMessage(OSCMessage message) {
		_address = message.getAddress();
		_contents = message.getArguments();
	}
	
	/**
	 * Getter for address
	 * @return address
	 */
	public String getAddress() {
		return _address;
	}
	
	/**
	 * Getter for contents
	 * @return contents
	 */
	public Object[] getContents() {
		return _contents;
	}
	
	public boolean equals(Object o) {
		if(o instanceof OscMessage) {
			OscMessage m = (OscMessage) o;
			if(this.getAddress() == m.getAddress()) return true;
		}
		return false;
	}
}
