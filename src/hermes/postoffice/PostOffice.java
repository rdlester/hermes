package src.hermes.postoffice;

import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.awt.event.MouseMotionListener;
import java.awt.event.MouseWheelEvent;
import java.awt.event.MouseWheelListener;
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
public class PostOffice implements KeyListener, MouseListener, MouseMotionListener, MouseWheelListener {
	
	//OSCPorts for listening and receiving
	OSCPortIn _receive;
	OSCPortOut _send;
	OSCListener _listener;
	
	//Map that associates the subscriptions with the Message they want to receive
	HashMap<Message, Subscription> _subscriptions;
	

	ConcurrentLinkedQueue<Message> _messageQueue;
	
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
	public PostOffice(PApplet applet, int portIn, int portOut) {
		applet.addKeyListener(this);
		applet.addMouseListener(this);
		applet.addMouseMotionListener(this);
		applet.addMouseWheelListener(this);
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
	 * Command that sends all messages queued by the PostOffice to subscribers
	 */
	public void checkMail() {
		ConcurrentLinkedQueue<Message> received = _messageQueue;
		_messageQueue = new ConcurrentLinkedQueue<Message>();
		
		while(received.size() != 0) {
			Message m = received.remove();
			Subscription subscriber = _subscriptions.get(m);
			if(subscriber != null) {
				Collection g = subscriber._group;
				subscriber._handler.handleMessage(g, m);
			}
		}
	}
	
	/**
	 * Sends a provided message out into the world
	 */
	public void sendMail(OscMessage m) {
		
	}

	/////////////////////////////////////////////////////////////////////////////
	//Methods defined by implemented interfaces for handling mouse+keyboard input
	
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
		String keyString = KeyEvent.getKeyText(key);
		KeyMessage m = new KeyMessage(keyString, true);
		_messageQueue.add(m);
	}

	/**
	 * On a key release, make a new KeyMessage and add it to the queue
	 */
	public void keyReleased(KeyEvent e) {
		int key = e.getKeyCode();
		String keyString = KeyEvent.getKeyText(key);
		KeyMessage m = new KeyMessage(keyString, false);
		_messageQueue.add(m);
	}
	
	/**
	 * Ignore mouseClicked events
	 */
	public void mouseClicked(MouseEvent e) {
		//VOID
	}

	/**
	 * On a mouse press, make a new MouseMessage and add it to the queue
	 */
	public void mousePressed(MouseEvent e) {
		e.getButton();
		e.getX();
		e.getY();
	}

	/**
	 * On a mouse button release, make a new MouseMessage and add it to the queue
	 */
	public void mouseReleased(MouseEvent e) {
		e.getButton();
		e.getX();
		e.getY();
	}

	/**
	 * Ignore mouseEntered events
	 */
	public void mouseEntered(MouseEvent e) {
		//VOID
	}

	/**
	 * Ignore mouseExited events
	 */
	public void mouseExited(MouseEvent e) {
		//VOID
	}

	/**
	 * 
	 */
	public void mouseDragged(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}

	/**
	 * When the mouse is moved, create a MouseMessage and add it to the queue
	 */
	public void mouseMoved(MouseEvent e) {
		// TODO Auto-generated method stub
		
	}

	/**
	 * 
	 */
	public void mouseWheelMoved(MouseWheelEvent e) {
		// TODO Auto-generated method stub
		
	}
}
