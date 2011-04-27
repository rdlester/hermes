package src.hermes.postoffice;

import java.util.ArrayList;
import java.util.Arrays;


//
//public class OSCMessage extends com.illposed.osc.OSCMessage implements Message{
//	
// 
//}





/**
 * Message representing an OSC message
 * Very similar to illposed's OSCMessage, but implementing Message so it can be used in PostOffice
 * The type of an OSCMessage is determined by the address it is sent on
 */

public class OscMessage implements Message {
	
	//Address of OSCMessage
	private String _address;
	//Contents of OSCMessage
	private Object[] _contents;
	
	/**
	 * Basic constructor for unpacked OSCMessage
	 * @param address - Address of OSCMessage
	 * @param contents - Contents of OSCMessage
	 */
	public OscMessage(String address, Object[] contents) {
		_address = address;
		_contents = contents;
	}
	
	/**
	 * Constructor taking an illposed OSCMessage
	 * @param message - a packed OSCMessage in illposed's format
	 */
	public OscMessage(com.illposed.osc.OSCMessage message) {
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
	
	/**
	 * Get an illposed version of this message
	 */
	protected com.illposed.osc.OSCMessage toIllposed() {
		com.illposed.osc.OSCMessage m = new com.illposed.osc.OSCMessage(_address,_contents);
		return m;
	}
	
	public boolean equals(Object o) {
		if(o instanceof OscMessage) {
			OscMessage m = (OscMessage) o;
			if(this.getAddress() == m.getAddress()) return true;
		}
		return false;
	}
	
	

	
}
