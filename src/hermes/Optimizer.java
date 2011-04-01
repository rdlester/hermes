package src.hermes;

import java.util.Iterator;

/**
 * Determines which beings are compared and potentially interacted by Interactor
 * Group B is given as argument to constructor and organized according to optimizer type
 * Basic optimizer checks all the members of A against all the members of B (order n^2)
 * Sample advanced optimizers include quadtree
 * detect checks body A against the structure formed from Group B
 */
public interface Optimizer<A extends Being, B extends Being> {

	// returns all B that body interacts with
	Iterator<B> detect(A body, Interactor<A,B> i);

	// used in the case of an optimization that can check faster than O(n), for example check mutual interaction
	//  only between beings in the same room
	Iterator<Pair<A,B>> detectAll(Interactor<A,B> i);
	
}

