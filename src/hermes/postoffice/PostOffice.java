package src.hermes.postoffice;

import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.awt.event.MouseMotionListener;
import java.net.InetAddress;
import java.net.SocketException;
import java.net.UnknownHostException;
import java.util.Collection;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.PriorityQueue;
import java.util.concurrent.ConcurrentLinkedQueue;

import com.illposed.osc.*;

import processing.core.*;

/**
 * Listens for and sends OSC, mouse, and keyboard messages
 * Tells subscribers of a specific type of message when one is received
 * and passes on information stored in message to subscriber
 * @author Ryan
 *
 */
public class PostOffice implements KeyListener, MouseListener, MouseMotionListener {
	
	//OSCPorts for listening and receiving
	OSCPortIn _receive;
	OSCPortOut _send;
	OSCListener _listener;
	
	/**
	 * Implementation of OCSListener that turns illposed messages into our messages
	 */
	class PostOfficeOSCListener implements OSCListener {
		/**
		 * Handles a received message
		 * Converts it from illposed to our message
		 * Adds it to queue
		 */
		public void acceptMessage(Date time, OSCMessage message) {
			String address = message.getAddress();
			Object[] contents = message.getArguments();
			OscMessage m = new OscMessage(address,contents);
			_messageQueue.add(m);
		}
	}
	
	//Map that associates the subscriptions with the Message they want to receive
	HashMap<Message, Subscription> _subscriptions;
	
	/**
	 * Helper class to hold subscriptions
	 */
	class Subscription {
		Collection _group;
		MessageHandler _handler;
		
		protected Subscription(Collection group, MessageHandler handler) {
			group = _group;
			handler = _handler;
		}
	}
	
	ConcurrentLinkedQueue<Message> _messageQueue;
	
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
		_listener = new PostOfficeOSCListener();
		
		_subscriptions = new HashMap<Message,Subscription>();
		_messageQueue = new ConcurrentLinkedQueue<Message>();
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
		_listener = new PostOfficeOSCListener();
		
		_subscriptions = new HashMap<Message,Subscription>();
		_messageQueue = new ConcurrentLinkedQueue<Message>();
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
		_listener = new PostOfficeOSCListener();
		
		_subscriptions = new HashMap<Message,Subscription>();
		_messageQueue = new ConcurrentLinkedQueue<Message>();
	}
	
	/**
	 * Registers a subscription with the PostOffice
	 * Subscriptions to key messages subscribe to press and release events from a particular key
	 * Subscriptions to mouse messages TODO
	 * Subscriptions to OSC messages subscribe to all messages sent on a specific address
	 * @param g - Subscribing group
	 * @param handler - the MessageHandler that contains the logic needed to react to a received message
	 * @param check - the particular message type the group is subscribing to
	 */
	public void registerSubscription(Collection g, MessageHandler handler, Message check) {
		Subscription newSubscription = new Subscription(g,handler);
		_subscriptions.put(check, newSubscription);
	}
	
	/**
	 * Runs PostOffice
	 * Waits for events, and adds them to a queue for handling
	 * Events are handled after an update loop has finished
	 */
	public void run() {
		
	}

	//Methods defined by implemented interfaces for handling mouse+keyboard input
	/**
	 * 
	 */
	public void mouseClicked(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}

	/**
	 * 
	 */
	public void mousePressed(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}

	/**
	 * 
	 */
	public void mouseReleased(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}

	/**
	 * 
	 */
	public void mouseEntered(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}

	/**
	 * 
	 */
	public void mouseExited(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}

	/**
	 * Ignore keyTyped events
	 */
	public void keyTyped(KeyEvent e) {
		//VOID
	}

	/**
	 * On a key press, make a new KeyMessage and add it to the queue
	 * Note: keyPressed events will repeat at rate set by OS if key is held down
	 * Users should control this with keyReleased events
	 */
	public void keyPressed(KeyEvent e) {
		int key = e.getKeyCode();
		KeyMessage m = new KeyMessage(key, true);
		_messageQueue.add(m);
	}

	/**
	 * On a key release, make a new KeyMessage and add it to the queue
	 */
	public void keyReleased(KeyEvent e) {
		int key = e.getKeyCode();
		KeyMessage m = new KeyMessage(key, false);
		_messageQueue.add(m);
	}

	/**
	 * 
	 */
	public void mouseDragged(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}

	/**
	 * 
	 */
	public void mouseMoved(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}
}
