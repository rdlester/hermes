/*package src.hermesTest.postOfficeTests;

import static org.junit.Assert.*;

import java.awt.event.*;

import javax.swing.JButton;

import org.junit.*;

import src.hermes.postoffice.*;

*//**
 * Simple tests for PostOffice message queuing and message equality checks
 *//*
public class PostOfficeJUnitTests {
	
	//Constants defining key 'triggering' key event
	static int KEY = 5;
	static String KEY_TEXT = KeyEvent.getKeyText(KEY);
	//Constants defining mouse events
	static int X = 50, Y = 50;
	//Constants defining wheel events
	static int ROTATION = 10;
	
	PostOffice _p;
	KeyEvent _key;
	String _keyText;
	MouseEvent _mouse;
	MouseEvent _mouseMove;
	MouseWheelEvent _wheel;
	
	@Before
	public void setUp() {
		_p = new PostOffice(); //Listening to OSC on 8080 and sending on 8000
		
		JButton component = new JButton();//Used to fool/construct events without actually running a frame
		_key = new KeyEvent(component, 0, 0, 0, KEY, '\0');
		_mouse = new MouseEvent(component, 0, 0, 0, X, Y, 0, false, MouseMessage.BUTTON1);
		_mouseMove = new MouseEvent(component, 0, 0, 0, X, Y, 0, false, MouseMessage.NOBUTTON);
		_wheel = new MouseWheelEvent(component, 0, 0, 0, X, Y, 0, false, 0, 0, ROTATION);
	}
	
	@After
	public void tearDown() {
		_p = null;
	}
	
	*//**
	 * General test for all the message handling functions
	 *//*
	@Test
	public void test_message() {
		//Test keyPressed
		_p.keyPressed(_key);
		Message m1 = _p.popQueue();
		assertTrue(m1 instanceof KeyMessage);
		KeyMessage k1 = (KeyMessage) m1;
		assertEquals(k1.getKey(), KEY_TEXT);
		assertTrue(k1.isPressed());
		
		//Test keyReleased
		_p.keyReleased(_key);
		Message m2 = _p.popQueue();
		assertTrue(m2 instanceof KeyMessage);
		KeyMessage k2 = (KeyMessage) m2;
		assertEquals(k2.getKey(), KEY_TEXT);
		assertFalse(k2.isPressed());
		
		//Check that both messages are in same subscription
		assertTrue(k1.equals(k2));
		
		//Test mouseDragged
		_p.mouseDragged(_mouse);
		Message m3 = _p.popQueue();
		assertTrue(m3 instanceof MouseMessage);
		MouseMessage mouse1 = (MouseMessage) m3;
		assertEquals(mouse1.getButton(), MouseMessage.BUTTON1);
		assertEquals(mouse1.getAction(), MouseMessage.MOUSE_DRAGGED);
		assertEquals(mouse1.getX(), X);
		assertEquals(mouse1.getY(), Y);
		
		//Test mouseMoved
		_p.mouseMoved(_mouseMove);
		Message m4 = _p.popQueue();
		assertTrue(m4 instanceof MouseMessage);
		MouseMessage mouse2 = (MouseMessage) m4;
		assertEquals(mouse2.getButton(), MouseMessage.NOBUTTON);
		assertEquals(mouse2.getAction(), MouseMessage.MOUSE_MOVED);
		assertEquals(mouse2.getX(), X);
		assertEquals(mouse2.getY(), Y);
		
		//Test mousePressed
		_p.mousePressed(_mouse);
		Message m5 = _p.popQueue();
		assertTrue(m5 instanceof MouseMessage);
		MouseMessage mouse3 = (MouseMessage) m5;
		assertEquals(mouse3.getButton(), MouseMessage.BUTTON1);
		assertEquals(mouse3.getAction(), MouseMessage.MOUSE_PRESSED);
		assertEquals(mouse3.getX(), X);
		assertEquals(mouse3.getY(), Y);
		
		//Test mouseReleased
		_p.mouseReleased(_mouse);
		Message m6 = _p.popQueue();
		assertTrue(m6 instanceof MouseMessage);
		MouseMessage mouse4 = (MouseMessage) m6;
		assertEquals(mouse4.getButton(), MouseMessage.BUTTON1);
		assertEquals(mouse4.getAction(), MouseMessage.MOUSE_RELEASED);
		assertEquals(mouse4.getX(), X);
		assertEquals(mouse4.getY(), Y);
		
		//Test subscriptions
		assertEquals(mouse1, mouse3);
		assertEquals(mouse1, mouse4);
		assertTrue(mouse1 != mouse2);
		
		//Test mouseWheelMoved
		_p.mouseWheelMoved(_wheel);
		Message m7 = _p.popQueue();
		assertTrue(m7 instanceof MouseWheelMessage);
		MouseWheelMessage wheel = (MouseWheelMessage) m7;
		assertEquals(wheel.getWheelRotation(), ROTATION);
	}
}*/
