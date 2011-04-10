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
 */
public class PostOffice implements KeyListener, MouseListener, MouseMotionListener, MouseWheelListener {
	
	//OSCPorts for listening and receiving
	private OSCPortIn _receive;
	private OSCPortOut _send;
	private OSCListener _listener;
	
	//Map that associates the subscriptions with the Message they want to receive
	private HashMap<Message, ArrayList<Subscription>> _subscriptions;
	
	//Stores messages as they are received, which are then picked off by checkMail()
	private ConcurrentLinkedQueue<Message> _messageQueue;
	
	/**
	 * Implementation of OCSListener that turns illposed messages into our messages
	 */
	class PostOfficeOSCListener implements OSCListener {
		
		//Reference to containing post office
		PostOffice _p;
		
		/**
		 * Constructor passes in reference to containing post office
		 */
		protected PostOfficeOSCListener(PostOffice p) {
			_p = p;
		}
		
		/**
		 * Handles a received message
		 * Converts it from illposed to our message
		 * Adds it to queue
		 */
		public void acceptMessage(Date time, OSCMessage message) {
			OscMessage m = new OscMessage(message);
			_p._messageQueue.add(m);
		}
	}
	
	/**
	 * Helper struct to hold subscriptions
	 */
	class Subscription {
		Collection<?> _group;
		MessageHandler<?> _handler;
		
		protected Subscription(Collection<?> group, MessageHandler<?> handler) {
			group = _group;
			handler = _handler;
		}
	}
	
	
	/**
	 * Constructor for illposed's default port out
	 * @param applet - Top Processing PApplet running the PostOffice 
	 * @param portIn - port to receive messages on
	 */
	public PostOffice(PApplet applet, int portIn) {
		//Set PostOffice to listen for events
		applet.addKeyListener(this);
		applet.addMouseListener(this);
		applet.addMouseMotionListener(this);
		applet.addMouseWheelListener(this);
		//Start OSC and set listener
		try {
			_receive = new OSCPortIn(portIn);
			_receive.startListening();
		} catch (SocketException e) {
			System.err.println("OSC Port In on " + portIn + " could not start");
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
		_listener = new PostOfficeOSCListener(this);
		//Initialize subscription list and message queue
		_subscriptions = new HashMap<Message, ArrayList<Subscription>>();
		_messageQueue = new ConcurrentLinkedQueue<Message>();
	}
	
	/**
	 * Constructor that defines location to send to on localhost
	 * @param applet - Top Processing PApplet running the PostOffice
	 * @param portIn - port to receive messages on
	 * @param portOut - port to send messages on
	 */
	public PostOffice(PApplet applet, int portIn, int portOut) {
		//Set PostOffice to listen for events
		applet.addKeyListener(this);
		applet.addMouseListener(this);
		applet.addMouseMotionListener(this);
		applet.addMouseWheelListener(this);
		//Start OSC and set listener
		try {
			_receive = new OSCPortIn(portIn);
			_receive.startListening();
		} catch (SocketException e) {
			System.err.println("OSC Port In on " + portIn + " could not start");
			e.printStackTrace();
		}
		try {
			_send = new OSCPortOut(InetAddress.getLocalHost(),portOut);
		} catch (UnknownHostException e) {
			System.err.println("OSC Port Out on " + portOut + " could not start");
			e.printStackTrace();
		} catch (SocketException e) {
			System.err.println("OSC Port Out on " + portOut + " could not start");
			e.printStackTrace();
		}
		_listener = new PostOfficeOSCListener(this);
		//Initialize subscription list and message queue
		_subscriptions = new HashMap<Message,ArrayList<Subscription>>();
		_messageQueue = new ConcurrentLinkedQueue<Message>();
	}
	
	/**
	 * Constructor for PostOffice that sends messages to non-local address
	 * @param applet - Top Processing PApplet running the PostOffice
	 * @param portIn - port to receive messages on
	 * @param portOut - port to send messages on
	 * @param netAddress - url of location to send messages to
	 */
	public PostOffice(PApplet applet, int portIn, int portOut, String netAddress) {
		//Set PostOffice to listen for events
		applet.addKeyListener(this);
		applet.addMouseListener(this);
		applet.addMouseMotionListener(this);
		applet.addMouseWheelListener(this);
		//Start OSC and set listener
		try {
			_receive = new OSCPortIn(portIn);
			_receive.startListening();
		} catch (SocketException e) {
			System.err.println("OSC Port In on " + portIn + " could not start");
			e.printStackTrace();
		}
		try {
			_send = new OSCPortOut(InetAddress.getByName(netAddress), portOut);
		} catch (UnknownHostException e) {
			System.err.println("OSC Port Out on " + portOut + " could not start");
			e.printStackTrace();
		} catch (SocketException e) {
			System.err.println("OSC Port Out on " + portOut + " could not start");
			e.printStackTrace();
		}
		_listener = new PostOfficeOSCListener(this);
		//Initialize subscription list and message queue
		_subscriptions = new HashMap<Message, ArrayList<Subscription>>();
		_messageQueue = new ConcurrentLinkedQueue<Message>();
	}
	
	/**
	 * Testing constructor - DO NOT USE
	 * Listens on 8000
	 * Sends on 8080
	 */
	public PostOffice() {
		//Start OSC to listen on 8000 and output on 8080, same as monome
		try {
			_receive = new OSCPortIn(8000);
			_receive.startListening();
		} catch (SocketException e) {
			System.err.println("OSC Port In on 8000 could not start");
			e.printStackTrace();
		}
		try {
			_send = new OSCPortOut(InetAddress.getLocalHost(), 8080);
		} catch (UnknownHostException e) {
			System.err.println("OSC Port Out on 8080 could not start");
			e.printStackTrace();
		} catch (SocketException e) {
			System.err.println("OSC Port Out on 8080 could not start");
			e.printStackTrace();
		}
		_listener = new PostOfficeOSCListener(this);
		_receive.addListener("/test", _listener);
		//Initialize subscription list and message queue
		_subscriptions = new HashMap<Message, ArrayList<Subscription>>();
		_messageQueue = new ConcurrentLinkedQueue<Message>();
	}
	
	/**
	 * Registers a subscription with the PostOffice
	 * Subscriptions to key messages subscribe to press and release events from a particular key
	 * Subscriptions to mouse messages
	 * Subscriptions to OSC messages subscribe to all messages sent on a specific address
	 * @param g - Subscribing group
	 * @param handler - the MessageHandler that contains the logic needed to react to a received message
	 * @param check - the particular message type the group is subscribing to
	 */
	public void registerSubscription(Collection<?> g, MessageHandler<?> handler, Message check) {
		Subscription newSubscription = new Subscription(g,handler);
		if(_subscriptions.containsKey(check)) {
			ArrayList<Subscription> subscriptionList = _subscriptions.get(check);
			subscriptionList.add(newSubscription);
		}
		else {
			ArrayList<Subscription> subscriptionList = new ArrayList<Subscription>();
			subscriptionList.add(newSubscription);
			_subscriptions.put(check, subscriptionList);
		}
		if(check instanceof OscMessage) {
			OscMessage osc = (OscMessage) check;
			_receive.addListener(osc.getAddress(), _listener);
		}
	}
	
	/**
	 * Command that sends all messages queued by the PostOffice to subscribers
	 */
	public void checkMail() {
		ConcurrentLinkedQueue<Message> received = _messageQueue;
		_messageQueue = new ConcurrentLinkedQueue<Message>();
		
		while(received.size() != 0) {
			Message m = received.remove();
			ArrayList<Subscription> subscribers = _subscriptions.get(m);
			if(subscribers != null) {
				for(Subscription s : subscribers) {
					Collection<?> g = s._group;
					MessageHandler h = s._handler;
					h.handleMessage(g, m);
				}
			}
		}
	}
	
	/**
	 * Sends a provided message out into the world
	 */
	public void sendMail(OscMessage m) {
		OSCMessage mail = m.toIllposed();
		try {
			_send.send(mail);
		}
		catch(Exception e) {
			System.err.println("Error sending message on " + m.getAddress() + "!");
		}
	}

	/**
	 * Picks message off queue - FOR TESTING ONLY, DO NOT USE
	 */
	public Message popQueue() {
		return _messageQueue.poll();
	}
	
	/////////////////////////////////////////////////////////////////////////////
	//Methods defined by implemented interfaces for handling mouse+keyboard input
	
	/////////////////////
	//Get keyboard events
	
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
	
	///////////////////////////////
	//Get mouse clicks and releases
	
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
		MouseMessage m  = new MouseMessage(e.getButton(), MouseMessage.MOUSE_PRESSED, e.getX(), e.getY());
		_messageQueue.add(m);
	}
	/**
	 * On a mouse button release, make a new MouseMessage and add it to the queue
	 */
	public void mouseReleased(MouseEvent e) {
		MouseMessage m  = new MouseMessage(e.getButton(), MouseMessage.MOUSE_RELEASED, e.getX(), e.getY());
		_messageQueue.add(m);
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

	///////////////////////////////
	//Get changes in mouse location
	
	//TODO What is the difference between mouseDragged and mouseMoved?
	/**
	 * When the mouse is dragged, create a MouseMessage and add it to the group
	 */
	public void mouseDragged(MouseEvent e) {
		MouseMessage m  = new MouseMessage(e.getButton(), MouseMessage.MOUSE_DRAGGED, e.getX(), e.getY());
		_messageQueue.add(m);
		
	}
	/**
	 * When the mouse is moved, create a MouseMessage and add it to the queue
	 */
	public void mouseMoved(MouseEvent e) {
		MouseMessage m  = new MouseMessage(e.getButton(), MouseMessage.MOUSE_MOVED, e.getX(), e.getY());
		_messageQueue.add(m);
		
	}

	//////////////////////////
	//Get mouse wheel movement
	/**
	 * When the mouse wheel is moved, create a MouseWheelMessage and add it to the queue
	 */
	public void mouseWheelMoved(MouseWheelEvent e) {
		MouseWheelMessage m = new MouseWheelMessage(e.getWheelRotation());
		_messageQueue.add(m);
	}
}
