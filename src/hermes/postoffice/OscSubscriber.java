package src.hermes.postoffice;

/**
 * Must be implemented by any object that wants to listen for and receive Osc messages
 */
public interface OscSubscriber {
    /**
     * Receives and handles Osc message sent to object by PostOffice
     */
	public void handleOscMessage(OscMessage m);
}
