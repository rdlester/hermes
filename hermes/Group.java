package hermes;

import java.util.ArrayList;

/**
 * Groups together <code>Beings</code> that share common attributes
 * and interact with other <code>HObject</code>s.
 * <p>
 * Group uses an <code>ArrayList</code> to keep track of <code>Being</code>s.
 * Use <code>GenericGroup</code> if you want to use a different data structure
 * or keep track of things that aren't <code>Being</code>s.
 * <p>
 * Groups are used for the same reasons as <code>GenericGroup</code>s.
 * See JavaDocs for <code>GenericGroup</code> for more details.
 * 
 * @param <A>	the type of being to be stored
 */
public class Group<A extends HObject> extends GenericGroup<A, ArrayList<A>> {

	/**
	 * Constructs a new empty group.
	 * @param world		the world containing the group
	 */
	public Group(World world) {
		super(new ArrayList<A>(), world);
	}
	
	/**
	 * Retrieves the being at a specific index.
	 * @param index		the index to fetch from
	 * @return			the being at index
	 */
	public A get(int index) {
		return getObjects().get(index);
	}
	
	/**
	 * Finds the location of being in the group.
	 * @param being		the being
	 * @return			the index at which the being is stored
	 */
	public int getIndex(A being) {
		return getObjects().indexOf(being);
	}
	
}
