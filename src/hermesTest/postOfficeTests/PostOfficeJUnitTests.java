package src.hermesTest.postOfficeTests;

import static org.junit.Assert.*;

import java.awt.event.*;

import javax.swing.JButton;

import org.junit.*;

import src.hermes.postoffice.*;

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
	MouseWheelEvent _wheel;
	
	@Before
	public void setUp() {
		_p = new PostOffice(); //Listening to OSC on 8080 and sending on 8000
		
		//JButton component = new JButton();//Used to fool/construct events without actually running a frame
		_key = new KeyEvent(null, 0, 0, 0, KEY, '\0');
		_mouse = new MouseEvent(null, 0, 0, 0, X, Y, 0, false, MouseMessage.BUTTON1);
		_wheel = new MouseWheelEvent(null, 0, 0, 0, X, Y, 0, false, 0, 0, ROTATION);
	}
	
	@After
	public void tearDown() {
		_p = null;
	}
	
	/**
	 * General test for all the message handling functions
	 */
	@Test
	public void test_message() {
		//Test keyPressed
		_p.keyPressed(_key);
		Message m1 = _p.popQueue();
		assertTrue(m instanceof KeyMessage);
		KeyMessage k = (KeyMessage) m1;
		assertEquals(k.getKey(), KEY_TEXT);
		assertTrue(k.isPressed());
		
		//Test keyReleased
		_p.keyReleased(_key);
		Message m2 = _p.popQueue();
		assertTrue(m instanceof KeyMessage);
		KeyMessage k = (KeyMessage) m2;
		assertEquals(k.getKey(), KEY_TEXT);
		assertTrue(k.isPressed());
		
		//Test mouseDragged
		_p.mouseDragged(_mouse);
		Message m3 = _p.popQueue();
		
		
		_p.mouseMoved(_mouse);
		_p.mousePressed(_mouse);
		_p.mouseReleased(_mouse);
		_p.mouseWheelMoved(_wheel);
	}
}
