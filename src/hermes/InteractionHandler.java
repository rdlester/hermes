package src.hermes;

import java.util.LinkedList;

/**
 * This class contains support code for detecting interactions and handling them. The only
 * 	time you will encounter this class is when is when writing an Optimizer, where you use
 * 	this class to handle the interactions for you.
 * 
 * @author Sam
 *
 */
@SuppressWarnings({ "rawtypes" })
public class InteractionHandler<A extends Being, B extends Being> {

	Interaction<A,B> _interaction;
	LinkedList<DetectedInteraction> _detectedInteractionsQueue;
	
	/**
	 * constructs a new InteractionHandler
	 * @param interaction				the interaction being handled
	 * @param detectedInteractionsQ		the detected interactions queue where non-immediate interactions are stored
	 */
	InteractionHandler(Interaction<A,B> interaction, LinkedList<DetectedInteraction> detectedInteractionsQ) {
		_interaction = interaction;
		_detectedInteractionsQueue = detectedInteractionsQ;
	}
	
	/**
	 * checks if an interaction is detected between being1 and being2; if the interaciton
	 * is immediate, synchronizes on the beings and handles the interaction, otherwise
	 * adds a new DetectedInteraction object to the detectedInteractionsQueue
	 * @param being1				the first interacting Being
	 * @param being2				the second interacting Being
	 * @return 						whether an interaction was detected
	 */
	public boolean interactionHandler(A being1, B being2) {
		// see if an interaction was detected
		if(being1 != being2 && _interaction.getInteractor().detect(being1, being2)) {
			if(_interaction.isImmediate()) { // if immediate, handle it now
					synchronized(being1) {
						synchronized(being2) {
							_interaction.getInteractor().handle(being1, being2);
						}
					}
			} else {//if not immediate, queue detection to handle later
				_detectedInteractionsQueue.add(new DetectedInteraction<A, B>(being1, being2, _interaction));
			}
			return true;
		}
		return false;
	}
	
}
