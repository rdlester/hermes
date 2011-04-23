package src.hermes.postoffice;


/**
 * Message representing an OSC message
 * Very similar to illposed's OSCMessage, but implementing Message so it can be used in PostOffice
 * The type of an OSCMessage is determined by the address it is sent on
 */

public class OSCMessage implements Message {
	
	//Address of OSCMessage
	private String _address;
	//Contents of OSCMessage
	private Object[] _contents;
	
	/**
	 * Basic constructor for unpacked OSCMessage
	 * @param address - Address of OSCMessage
	 * @param contents - Contents of OSCMessage
	 */
	public OSCMessage(String address, Object[] contents) {
		_address = address;
		_contents = contents;
	}
	
	/**
	 * Constructor taking an illposed OSCMessage
	 * @param message - a packed OSCMessage in illposed's format
	 */
	public OSCMessage(com.illposed.osc.OSCMessage message) {
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
		if(o instanceof OSCMessage) {
			OSCMessage m = (OSCMessage) o;
			if(this.getAddress() == m.getAddress()) return true;
		}
		return false;
	}
}
