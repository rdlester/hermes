package src.hermes;

import java.util.Collection;

/**
 * wraps all the elements of an interaction
 */
public class Interaction<A extends Being, B extends Being> {

	private Collection<A> a;
	private Collection<B> b;
	private Interactor<A,B> interactor;
	private Optimizer<A,B> optimizer;
	private boolean immediate;
	
	public Interaction(Collection<A> a, Collection<B> b, Interactor<A,B> interactor, 
			boolean immediate, Optimizer<A,B> optimizer) {
		this.a = a;
		this.b = b;
		this.interactor = interactor;
		this.optimizer = optimizer;
		this.immediate = immediate;
	}
	
	public boolean isImmediate() {
		return immediate;
	}
	
	public Collection<A> getA() {
		return a;
	}
	
	public Collection<B> getB() {
		return b;
	}
	
	public Interactor<A,B> getInteractor() {
		return interactor;
	}
	
	public Optimizer<A,B> getOptimizer() {
		return optimizer;
	}
	
}
