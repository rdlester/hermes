package src.hermes;

/**
 * internal -- used to store detected interactions
 */
class DetectedInteraction<A extends HObject, B extends HObject> {
	A _being1;
	B _being2;
	Interaction<A, B> _interaction;
	
	DetectedInteraction(A b1, B b2, Interaction<A,B> interaction) {
		_being1 = b1;
		_being2 = b2;
		_interaction = interaction;
	}
	
	public A get_being1() {
		return _being1;
	}
	public B get_being2() {
		return _being2;
	}
	public Interactor<A, B> get_interactor() {
		return _interaction.getInteractor();
	}
	
	public Interaction<A,B> getInteraction() {
		return _interaction;
	}
}