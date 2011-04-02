package src.hermes.postoffice;

import java.util.Collection;

/**
 * Contains necessary logic to handle a received message of a specific type
 */
public interface MessageHandler<A> {
	
	//Handles a message 
	public void handleMessage(Collection<A> g, Message m);
	
}
