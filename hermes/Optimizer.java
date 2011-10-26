package hermes;

/**
 * Determines which beings are compared and potentially interacted by <code>Interactor</code>.
 * Unoptimized interactions check all members of A against all the members of B (order n^2).
 * Optimizers allow for the creation of data structures which will speed interactions.
 * <p>
 * Group B is given as argument to constructor and organized according to optimizer type.
 * Detect checks body A against the structure formed from Group B.
 * <p>
 * Sample advanced optimizers include quadtree.
 */
public interface Optimizer<A extends HObject, B extends HObject, 
				GroupA extends GenericGroup<A,?>, GroupB extends GenericGroup<B,?>> {
	
	/**
	 * This should detect all possible interactions between the members of groups A and B, using handler.
	 * @param group1	a group of beings
	 * @param group2	a group of beings
	 * @param handler	interaction handler that will detect and handle interactions
	 */
	public void detect(GroupA group1, GroupB group2, InteractionHandler<A,B> handler);
	
}

