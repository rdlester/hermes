package src.hermes.postoffice;

/**
 * Must be implemented by any object that wants to listen for and receive Mouse messages
 */
public interface MouseSubscriber {
    /**
     * Receives and handles Mouse message sent to object by PostOffice
     */
	public void handleMouseMessage(MouseMessage m);
}
