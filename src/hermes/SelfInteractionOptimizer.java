package src.hermes;

/**
 * This Optimizer reduces the time needed to handle interactions between all members of 
 * 	the same group, and also eliminates duplicate interactions. Each member will be checked
 * 	against each other member of the group exactly once. This works only if the interactions
 * 	are commutative, ie handle(A,B) is equivalent to handle(B,A).
 * <br>
 * Detection under this optimizer is still an O(n^2) operation, but using it will reduce
 * 	total calculation time by a factor of approximately 1/2 (the number of compuatations
 * 	performed will be n(n-1) / 2, where n is the number of beings in the group. 
 * 
 * @author Sam
 *
 * @param <A>	the type of Being the group contains
 */
public class SelfInteractionOptimizer<A extends Being> implements Optimizer<A, A, Group<A>, Group<A>> {

	public void detect(Group<A> group1, Group<A> group2,
			InteractionHandler<A, A> handler) {
		
		assert group1 == group2 : "SelfInteractionOptimizer.detect: group1 and group2 must be the same group";
	
		int length = group1.size();
		for(int i = 0; i < length - 1; i++) {
			A being1 = group1.get(i);
			for(int j = i + 1; j < length; j++) {
				A being2 = group2.get(j);
				handler.interactionHandler(being1, being2);
			}
		}
	}
	
}
