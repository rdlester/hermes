package src.hermes;

import java.net.InetAddress;
import java.net.SocketException;
import java.net.UnknownHostException;
import java.util.Collection;
import java.util.ArrayList;
import java.util.HashMap;

import com.illposed.osc.*;
import processing.core.*;

/**
 * Listens for and sends OSC, mouse, and keyboard messages
 * Tells subscribers of a specific type of message when one is received
 * and passes on information stored in message to subscriber
 * @author Ryan
 *
 */
public class PostOffice {
	
	//OSCPorts for listening and receiving
	OSCPortIn _receive;
	OSCPortOut _send;
	
	HashMap<Message,Subscription> _subscriptions;
	
	//Holder class to hold subscriptions
	class Subscription {
		Collection _group;
		MessageHandler _handler;
		
		protected Subscription(Collection group, MessageHandler handler) {
			group = _group;
			handler = _handler;
		}
	}
	
	
	/**
	 * Constructor for illposed's default port out
	 * @param portIn - port to receive messages on
	 */
	public PostOffice(int portIn) {
		try {
			_receive = new OSCPortIn(portIn);
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
		
		_subscriptions = new HashMap<Message,Subscription>();
	}
	
	/**
	 * Constructor that defines location to send to on localhost
	 * @param portIn - port to receive messages on
	 * @param portOut - port to send messages on
	 */
	public PostOffice(int portIn, int portOut) {
		try {
			_receive = new OSCPortIn(portIn);
		} catch (SocketException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			_send = new OSCPortOut(InetAddress.getLocalHost(),portOut);
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SocketException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		_subscriptions = new HashMap<Message,Subscription>();
	}
	
	/**
	 * Constructor for PostOffice that sends messages to non-local address
	 * @param portIn - port to receive messages on
	 * @param portOut - port to send messages on
	 * @param netAddress - url of location to send messages to
	 */
	public PostOffice(int portIn, int portOut, String netAddress) {
		try {
			_receive = new OSCPortIn(portIn);
		} catch (SocketException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			_send = new OSCPortOut(InetAddress.getByName(netAddress), portOut);
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SocketException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		_subscriptions = new HashMap<Message,Subscription>();
	}
	
	/**
	 * Registers a subscription with the PostOffice
	 * @param g - Subscribing group
	 * @param handler - the MessageHandler that contains the logic needed to react to a received message
	 * @param check - the particular message type the group is subscribing to
	 */
	public void registerSubscription(Collection g, MessageHandler handler, Message check) {
		Subscription newSubscription = new Subscription(g,handler);
		_subscriptions.put(check, newSubscription);
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
	void registerKeySubscribe(Collection<Being> g) {
		_keySubscribed.addAll(g);
	}

	//Registers Group of Being for mouse subscription
	void registerMouseSubscribe(Collection<Being> g) {
		
	}

	//Registers Group of Being for osc subscription
	void registerOSCSubscribe(Collection<Being> g) {
		
	}
	
	//Runs Post Office
	//Waits for events, and adds them to queue for handling
	//Does not handle events while a world update loop is running
	void run() {
		
	}
}
