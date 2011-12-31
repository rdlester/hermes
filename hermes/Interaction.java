package hermes;

/**
 * Wraps all the elements comprising an interaction.
 * <p>
 * Internal -- you do not need to understand this class!
 * See {@link hermes.World World} for information on registering Interactions.
 */
class Interaction<A extends HObject, B extends HObject> {

	private GenericGroup<A,?> a;		// the first group in the interaction
	private GenericGroup<B,?> b;		// the second group in the interaction
	private Interactor<A,B> interactor;	// the interactor
	private Optimizer<A,B,?,?> optimizer;	// the optimizer, if there is one
		
	public Interaction(GenericGroup<A,?> a, GenericGroup<B,?> b, Interactor<A,B> interactor, 
			Optimizer<A,B,?,?> optimizer) {
		this.a = a;
		this.b = b;
		this.interactor = interactor;
		this.optimizer = optimizer;
	}
	
	public GenericGroup<A,?> getA() {
		return a;
	}
	
	public GenericGroup<B,?> getB() {
		return b;
	}
	
	public Interactor<A,B> getInteractor() {
		return interactor;
	}
	
	public Optimizer<A,B,?,?> getOptimizer() {
		return optimizer;
	}
	
}
