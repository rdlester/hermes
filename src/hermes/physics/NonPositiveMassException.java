package src.hermes.physics;

/**
 * this exception is thrown if a being is found to have non-positive mass
 * @author Sam
 *
 */
@SuppressWarnings("serial")
public class NonPositiveMassException extends Exception {

	private MassedBeing _being;
	
	public NonPositiveMassException(MassedBeing being) {
		_being = being;
	}
	
	public String toString() {
		return "MassedBeing " + _being + " has a non-positive mass value " + _being.getMass();
	}
	
}
