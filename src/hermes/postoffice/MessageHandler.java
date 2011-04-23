package src.hermes.postoffice;

import java.util.Collection;

import src.hermes.Being;
import src.hermes.GenericGroup;

/**
 * Contains necessary logic to handle a received message of a specific type
 */
public interface MessageHandler<A extends Being> {
	
	//Handles a message 
	public void handleMessage(GenericGroup<A,?> g, Message m);
	
}
