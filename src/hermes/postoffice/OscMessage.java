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
	}
	
	
	/**
	 * Use this when the OSC message being received has only one argument: an int
	 * <br>Take great care!!!! It is your responsibility to be sure that the message data is actually an int. If it isn't, the value you get from this method will be nonsense
	 * <br>If this message contains more than one argument, you will get an error.
	 * 
	 * @return		 the int value of the message
	 */
	public int getInt() {
		
		assert _contents.length==1 : "OSC message error: You tried to call getInt() (which implies the message should have a single int argument) \n " +
				"This message has: "+_contents.length + "arguments, so call getMultipleArguments(). Be careful with these untyped OSC messages!";
		
		return (Integer)_contents[0]; //blindly cast - no easy checks here - nature of the OSC beast. 
	}
	
	
	
	/**
	 * Use this when the OSC message being received has only one argument: a String
	 * <br>Take great care!!!! It is your responsibility to be sure that the message data is actually a String. If it isn't, the value you get from this method will be nonsense
	 * <br>If this message contains more than one argument, you will get an error.
	 * 
	 * @return		 the String value of the message
	 */
	public String getString() {
		
		assert _contents.length==1 : "OSC message error: You tried to call getString() (which implies the message should have a single string argument) \n " +
				"This message has: "+_contents.length + "arguments, so call getMultipleArguments(). Be careful with these untyped OSC messages!";
		
		return (String)_contents[0]; //blindly cast - no easy checks here - nature of the OSC beast. 
	}
	
	
	/**
	 * Use this when the OSC message being received has only one argument: an float
	 * <br>Take great care!!!! It is your responsibility to be sure that the message data is actually a float. If it isn't, the value you get from this method will be nonsense
	 * <br>If this message contains more than one argument, you will get an error.
	 * 
	 * @return		 the float value of the message
	 */
	public float getFloat() {
		
		assert _contents.length==1 : "OSC message error: You tried to call getFloat() (which implies the message should have a single string argument) \n " +
				"This message has: "+_contents.length + "arguments, so call getMultipleArguments(). Be careful with these untyped OSC messages!";
		
		return (Float)_contents[0]; //blindly cast - no easy checks here - nature of the OSC beast. 
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
