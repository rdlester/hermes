package src.hermes;

/**
 * Contains necessary logic to interact two beings
 * detect method determines if two bodies should interact
 * handle "interacts" the two beings by updating them
 */
 public interface Interactor<A extends HObject, B extends HObject> {

	/**
	 * determines whether an interaction between two beings has occurred
	 * should not make any changes to the state of either being, although it might
	 * store data about the interaction within them
	 * @param being1	the first interacting being
	 * @param being2	the second interacting being
	 * @return			whether or not an interaction has occurred
	 */
	public boolean detect(A being1, B being2);

	/**
	 * handles the consequence of an interaction between two beings
	 * @param being1	the first being
	 * @param being2	the second being
	 * @return			whether or not the interaction has been fully resolved. 
	 * 					Will be true in most uses (see below).
	 * 
	 * <h3>Understanding the handle return</h3>
	 * Hermes.World's main event loop provides support for interactions that require
	 * multiple iterations during a single loop. For example, when performing collision
	 * detection on a fast-moving object the object's position will be sampled at several points
	 * along the path for accuracy. If an interaction returns false, this mean that this
	 * interaction has not been fully resolved. For any interaction that has not been 
	 * fully resolved, the world will continue to check both beings in the interaction against
	 * ALL other beings they are capable of interacting with, until all interactions
	 * have been resolved. Note that this can cause a serious hit to performance,
	 * and can also cause infinite loops, so be careful when using this feature.
	 * 
	 */
	public boolean handle(A being1, B being2);
}

