package src.hermes.postoffice;

/**
 * Must be implemented by any object that wants to listen for and receive MouseWheel messages
 */
public interface MouseWheelSubscriber {
    /**
     * Receives and handles MouseWheel message sent to object by PostOffice.
     * @param m	the message sent by the PostOffice
     */
	public void handleMouseWheelMessage(MouseWheelMessage m);
}
