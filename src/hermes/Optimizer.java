package src.hermes;

/**
 * Determines which beings are compared and potentially interacted by Interactor
 * Group B is given as argument to constructor and organized according to optimizer type
 * Unoptimized interactions check all members of A against all the members of B (order n^2)
 * Sample advanced optimizers include quadtree
 * detect checks body A against the structure formed from Group B
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

