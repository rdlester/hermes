package hermes.postoffice;

/**
 * Must be implemented by any object that wants to listen for and receive Mouse messages
 */
public interface MouseSubscriber {
    /**
     * Receives and handles Mouse message sent to object by PostOffice.
     * @param m	the message sent by the PostOffice
     */
	public void handleMouseMessage(MouseMessage m);
}
