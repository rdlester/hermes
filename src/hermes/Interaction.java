package src.hermes;

/**
 * wraps all the elements of an interaction
 * 
 * internal -- you do not need to understand this class!
 */
class Interaction<A extends HObject, B extends HObject> {

	private GenericGroup<A,?> a;		// the first group in the interaction
	private GenericGroup<B,?> b;		// the second group in the interaction
	private Interactor<A,B> interactor;	// the interactor
	private Optimizer<A,B,?,?> optimizer;	// the optimizer, if there is one
	private boolean immediate;			// whether handle should be called immediately after detect 
										// 	return true, or if the interaction should be cached for 
										//  resolution at the end of the update loop
	
	public Interaction(GenericGroup<A,?> a, GenericGroup<B,?> b, Interactor<A,B> interactor, 
			boolean immediate, Optimizer<A,B,?,?> optimizer) {
		this.a = a;
		this.b = b;
		this.interactor = interactor;
		this.optimizer = optimizer;
		this.immediate = immediate;
	}
	
	public boolean isImmediate() {
		return immediate;
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
