package hermes;

/**
 * Utility for wrapping a pair of objects.
 *
 * @param <A>  the type of the first object in the pair
 * @param <B>  the type of the second object in the pair
 */
public class Pair <A,B> {
	
	public A first; // the first object in the pair
	public B second; // the second object in the pair

	/**
	 * Creates a Pair with given values for in its first and second fields.
	 * @param first		the first object to store
	 * @param second	the second object to store
	 */
	public Pair(A first, B second) {
		this.first = first;
		this.second = second;
	}
	
	/**
	 * @return	the first object in the pair
	 */
	public A getFirst() {
		return first;
	}
	
	/**
	 * @return	the second object in the pair
	 */
	public B getSecond() {
		return second;
	}
	
}
