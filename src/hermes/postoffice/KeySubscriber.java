package src.hermes.postoffice;

/**
 * Must be implemented by any object that wants to listen for and receive Key messages.
 */
public interface KeySubscriber {
	/**
	 * Receives and handles Osc message sent to object by PostOffice.
	 * @param m	the message sent by the PostOffice
	 */
	public void handleKeyMessage(KeyMessage m);
}
