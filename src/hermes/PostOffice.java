package src.hermes;

import java.util.Collection;
import java.util.ArrayList;

import oscP5.*;
import netP5.*;

/**
 * Listens for and sends OSC, mouse, and keyboard messages
 * Tells subscribers of a specific type of message when one is recieved
 * and passes on information stored in message to subscriber
 * @author Ryan
 *
 */
public class PostOffice {
	
	//Server listening for and sending messages
	OscP5 _server;
	
	//Fields containing subscribing Beings
	ArrayList<Being> _keySubscribed;
	ArrayList<Being> _mouseSubscribed;
	ArrayList<Being> _oscSubscribed;
	
	//Constructor
	public PostOffice(PApplet applet, int port) {
		_server = new OscP5(applet, port);
	}
	
	//Sends key presses to subscribing Beings
	void handleKeyPress(char keyPressed) {
		
	}

	//Sends mouse clicks to subscribing Beings
	void handleMouseClick(Point clickLocation) {
		
	}

	//Sends osc messages to subscribing Beings
	//Q: how will we internally represent OSC messages?
	void handleOSC(Message recievedMessage) {
		
	}

	//Registers Group of Being for keyboard subscription
	void registerKeySubscribe(Collection g) {
		
	}

	//Registers Group of Being for mouse subscription
	void registerMouseSubscribe(Collection g) {
		
	}

	//Registers Group of Being for osc subscription
	void registerOSCSubscribe(Collection g) {
		
	}
	
	//Runs Post Office
	//Waits for events, and adds them to queue for handling
	//Does not handle events while a world update loop is running
	void run() {
		
	}
}
