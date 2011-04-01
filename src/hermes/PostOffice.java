package src.hermes;

import java.net.SocketException;
import java.net.UnknownHostException;
import java.util.Collection;
import java.util.ArrayList;

import com.illposed.osc.*;
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
	
	//If illposed.osc is used intead of oscP5
	//OSCPorts for listening and recieving
	OSCPortIn _receive;
	OSCPortOut _send;
	
	
	
	//Fields containing subscribing Beings
	ArrayList<Being> _keySubscribed;
	ArrayList<Being> _mouseSubscribed;
	ArrayList<Being> _oscSubscribed;
	
	//Constructor for OscP5
	public PostOffice(PApplet applet, int port) {
		_server = new OscP5(applet, port);
	}
	
	//Constructors for illposed
	//Constructor that sends out to default location on localhost
	public PostOffice(int portIn) {
		try {
			_receive = new OSCPortIn(port);
		} catch (SocketException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			_send = new OSCPortOut();
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SocketException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//Constructor that defines location to send to on localhost
	
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
