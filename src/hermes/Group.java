package src.hermes;

import java.util.ArrayList;

/**
 * a group of beings, backed by an ArrayList
 * @author Sam
 *
 * @param <A>	the type of being to be stored
 */
public class Group<A extends Being> extends GenericGroup<A, ArrayList<A>> {

	/**
	 * constructs a new empty group
	 * @param world		the world containing the group
	 */
	public Group(World world) {
		super(new ArrayList<A>(), world);
	}
	
	/**
	 * retrieves the being at a specific index
	 * @param index		the index to fetch from
	 * @return			the being at index
	 */
	public A get(int index) {
		return getBeings().get(index);
	}
	
	/**
	 * finds the location of being in the group
	 * @param being		the being
	 * @return			the index at which the being is stored
	 */
	public int getIndex(A being) {
		return getBeings().indexOf(being);
	}
	
}
