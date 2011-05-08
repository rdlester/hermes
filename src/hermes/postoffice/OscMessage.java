package src.hermes.postoffice;


/**
 * First In, Last Out, meaning.
 * Message representing an OSC message
 * Very similar to illposed's OSCsMessage, but implementing Message so it can be used in PostOffice
 * The type of an OSCMessage is determined by the address it is sent on
 */

public class OscMessage implements Message {
	
	//Address of OSCMessage
	private String _address;

	//Contents of OSCMessage
	private Object[] _contents;
	
	//used to internally keep track of how many "getAndRemove" calls the user has made
	private int _indexToRetrieveFrom = 0;  
	//
	
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
	protected OscMessage(com.illposed.osc.OSCMessage message) {
		_address = message.getAddress();
		_contents = message.getArguments();
	}
	
	
	/**
	 * returns the number of arguments available for extraction from this OSCMessage.
	 * @return		the number of arguments left to extract from this OSCMessage
	 */
	public int getNumberOfRemainingArguments() {
		return _contents.length - _indexToRetrieveFrom;
	}
	
	/**
	 * Helper to find out if the user has any remaining arguments in the OSCMessage
	 * @return
	 */
	private boolean hasRemainingArguments() {
		return (_indexToRetrieveFrom <= _contents.length - 1);
	}
	
	
	/**
	 * Retrieves an int argument contained in the OSCMessage you've received
	 *<p>If your OSCMessage contains multiple arguments, call another "getAndRemove" method corresponding to the type of the next argument
	 *</p>
	 *<p>The "getAndRemove" methods are "First In, Last Out" 
	 *<br>Example: imagine your OSCMessage has a list of arguments: int A, string B, float C
	 *<br>First, you would call "getAndRemoveInt()" which would return the int value of A 
	 *<br>Next, you would call "getAndRemoveString()" which would return string B
	 *<br>Lastly, you would call getAndRemoveFloat()" which would return string C
	 *<br>Take great care!!!! You should be well-aware of how many arguments a message will contain, and what types it has
	 *</p>
	 * 
	 * @return		 the int argument in the OSCMessage
	 */
	public int getAndRemoveInt() {
		
		//make sure the user has remaining arguments
		assert hasRemainingArguments() : "OSCmessage error: You tried to call getAndRemoveInt(), but this OSCmessage has no arguments. Be careful with OSCmessages!";
	
		//make sure the type is correct
		assert _contents[_indexToRetrieveFrom] instanceof Integer : "OSCmessage error: You tried to call getAndRemoveInt(), but the current argument is not of type int!! \n" +
				"it is of type: " + _contents[_indexToRetrieveFrom].getClass().getName();
		
		//cast it
		int intToReturn = (Integer)_contents[_indexToRetrieveFrom];
		
		_indexToRetrieveFrom++;
		
		return intToReturn; 
	}
	
	
	
	/**
	 * Retrieves a String argument contained in the OSCMessage you've received
	 *<p>If your OSCMessage contains multiple arguments, call another "getAndRemove" method corresponding to the type of the next argument
	 *</p>
	 *<p>The "getAndRemove" methods are "First In, Last Out" 
	 *<br>Example: imagine your OSCMessage has a list of arguments: int A, string B, float C
	 *<br>First, you would call "getAndRemoveInt()" which would return the int value of A 
	 *<br>Next, you would call "getAndRemoveString()" which would return string B
	 *<br>Lastly, you would call getAndRemoveFloat()" which would return string C
	 *<br>Take great care!!!! You should be well-aware of how many arguments a message will contain, and what types it has
	 *</p>
	 * 
	 * @return		 the String argument in the OSCMessage
	 */
	public String getAndRemoveString() {
		
		//make sure the user has remaining arguments
		assert hasRemainingArguments() : "OSCmessage error: You tried to call getAndRemoveString(), but this OSCmessage has no arguments. Be careful with OSCmessages!";
	
		//make sure the type is correct
		assert _contents[_indexToRetrieveFrom] instanceof String : "OSCmessage error: You tried to call getAndRemoveString(), but the current argument is not of type String!! \n" +
				"it is of type: " + _contents[_indexToRetrieveFrom].getClass().getName();
		
		//cast it
		String stringToReturn = (String)_contents[_indexToRetrieveFrom];
		
		_indexToRetrieveFrom++;
		
		return stringToReturn; 
	}
	

	/**
	 * Retrieves a float argument contained in the OSCMessage you've received
	 *<p>If your OSCMessage contains multiple arguments, call another "getAndRemove" method corresponding to the type of the next argument
	 *</p>
	 *<p>The "getAndRemove" methods are "First In, Last Out" 
	 *<br>Example: imagine your OSCMessage has a list of arguments: int A, string B, float C
	 *<br>First, you would call "getAndRemoveInt()" which would return the int value of A 
	 *<br>Next, you would call "getAndRemoveString()" which would return string B
	 *<br>Lastly, you would call getAndRemoveFloat()" which would return string C
	 *<br>Take great care!!!! You should be well-aware of how many arguments a message will contain, and what types it has
	 *</p>
	 * 
	 * @return		 the float argument in the OSCMessage
	 */
	public float getAndRemoveFloat() {
		
		//make sure the user has remaining arguments
		assert hasRemainingArguments() : "OSCmessage error: You tried to call getAndRemoveFloat(), but this OSCmessage has no arguments. Be careful with OSCmessages!";
	
		//make sure the type is correct
		assert _contents[_indexToRetrieveFrom] instanceof Float : "OSCmessage error: You tried to call getAndRemoveFloat(), but the current argument is not of type Float!! \n" +
				"it is of type: " + _contents[_indexToRetrieveFrom].getClass().getName();
		
		//cast it
		float floatToReturn = (Float)_contents[_indexToRetrieveFrom];
		
		_indexToRetrieveFrom++;
		
		return floatToReturn; 
	}
	
	

/**
 * Get the typetag of the next argument in this OSCMessage. This means: "i" for int, "f" for float, and "s" for string
 * <br>NOTE: if you have extracted all the arguments from this OSCMessage, calling this method will give an error
 * @return		the typetag of the next argument in this OSCmessage
 */
	public String getTypeTagOfNextArgument() {
		
		assert hasRemainingArguments() : "OSCmessage error: You tried to call getTypeTagOfNextArgument(), but this OSCmessage has no arguments. Be careful with OSCmessages!";
		
		String typeTag;
		
		if(_contents[_indexToRetrieveFrom] instanceof Integer) {
			typeTag = "i";
		} else if (_contents[_indexToRetrieveFrom] instanceof Float){
			typeTag =  "f";
		} else if(_contents[_indexToRetrieveFrom] instanceof String) {
			typeTag = "s";
		} else {
			typeTag = null;
		}
		
		//Shouldn't happen... but just in case!
		assert typeTag != null : "getTypeTagOfNextArgument() Error: Unsupported type of data";
		
		return typeTag;
	}
	
	
	
	/**
	 * Gets the OSCAddress that this message pertains to
	 * @return address
	 */
	public String getAddress() {
		return _address;
	}
	
	/**
	 * Gets an object[] of the inner contents of an OSCMessage 
	 * @return contents
	 */
	protected Object[] getContents() {
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
			return this.getAddress().equals(m.getAddress());
		}
		return false;
	}
	
	

	
}
