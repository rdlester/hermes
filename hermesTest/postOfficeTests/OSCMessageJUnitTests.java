package hermesTest.postOfficeTests;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.fail;
import hermes.Hermes;
import hermes.postoffice.OscMessage;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import processing.core.PApplet;

public class OSCMessageJUnitTests {

	PApplet _sketch;
	
	@Before
	public void setUp() {
		_sketch = new PApplet();
		Hermes.setPApplet(_sketch);
	}
	
	@After
	public void tearDown() {
		_sketch = null;
		Hermes.setPApplet(null);
	}
	
	
	@Test
	public void testGoodData() {
		
		//make an object array of all valid arguments
		Object[] testObjects = new Object[3];
		testObjects[0] = new Integer(10);
		testObjects[1] = new String("Oh hai");
		testObjects[2] = new Float(1.0);
			
		//don't need a valid address.. just testing the argument retrieval functionality
		OscMessage message = new OscMessage("/DummyAddress", testObjects);
		
		//make sure the number of arguments is correct
		assertEquals(message.getNumberOfRemainingArguments(), 3);
		//Should be an int
		assertEquals(message.getTypeTagOfNextArgument(), "i");
		//check the value
		int intValue = message.getAndRemoveInt();
		assertEquals((Integer)intValue, (Integer)testObjects[0]);
	
		//make sure the number of arguments is correct
		assertEquals(message.getNumberOfRemainingArguments(), 2);
		//Should be a string
		assertEquals(message.getTypeTagOfNextArgument(), "s");
		//check the value
		String stringValue = message.getAndRemoveString();
		assertEquals((String)stringValue, (String)testObjects[1]);
		
		//make sure the number of arguments is correct
		assertEquals(message.getNumberOfRemainingArguments(), 1);
		//Should be a float
		assertEquals(message.getTypeTagOfNextArgument(), "f");
		//check the value
		Float floatValue= message.getAndRemoveFloat();
		assertEquals((Float)floatValue, (Float)testObjects[2]);

		assertEquals(message.getNumberOfRemainingArguments(), 0);
		
	}
	
	@Test
	public void textBadMethodCalls() {
		
		//make an object array of all valid arguments
		Object[] testObjects = new Object[3];
		testObjects[0] = new Integer(10);
		testObjects[1] = new String("Oh hai");
		testObjects[2] = new Float(1.0);
			
		//don't need a valid address.. just testing the argument retrieval functionality
		OscMessage message = new OscMessage("/DummyAddress", testObjects);
		
		try {
			message.getAndRemoveFloat();
		    fail( "Should throw AssertionError" );
		} catch (AssertionError expectedException) {
		}
		
		try {
			message.getAndRemoveString();
		    fail( "Should throw AssertionError" );
		} catch (AssertionError expectedException) {
		}
		
		//remove the element to check Int
		message.getAndRemoveInt();

		try {
			message.getAndRemoveInt();
		    fail( "Should throw AssertionError" );
		} catch (AssertionError expectedException) {
		}
		
		//empty the OSCMessage and then check errors..
		message.getAndRemoveString();
		message.getAndRemoveFloat();

		
		try {
			message.getAndRemoveInt();
		    fail( "Should throw AssertionError because the OSCMessage is empty" );
		} catch (AssertionError expectedException) {
			}
		
		try {
			message.getAndRemoveFloat();
		    fail( "Should throw AssertionError because the OSCMessage is empty" );
		} catch (AssertionError expectedException) {
			}
		
		
		try {
			message.getAndRemoveString();
		    fail( "Should throw AssertionError because the OSCMessage is empty" );
		} catch (AssertionError expectedException) {
			}
		
		try {
			message.getTypeTagOfNextArgument();
		    fail( "Should throw AssertionError because the OSCMessage is empty" );
		} catch (AssertionError expectedException) {
			}
		
		//Lastly, check nonexistent typetag
		 class Impossible {
		}
		//make a message that contains an 'Impossible'
		testObjects = new Object[1];
		testObjects[0] = new Impossible();
		message = new OscMessage("/DummyAddress", testObjects);
		
		try {
			message.getTypeTagOfNextArgument();
		    fail( "Should throw AssertionError because the tag does not exist" );
		} catch (AssertionError expectedException) {
			}
		
	}
	
	
}
