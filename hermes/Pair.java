package hermes;

/**
 * 
 * @author Sam
 *
 * @param <A>  the type of the first object in the pair
 * @param <B>  the type of the second object in the pair
 */
public class Pair <A,B> {
	
	public A first; // the first object in the pair
	public B second; // the second object in the pair
	
	public Pair(A first, B second) {
		this.first = first;
		this.second = second;
	}
	
}
