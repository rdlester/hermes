package hermes;

/**
 * An <code>Interactor</code> defines some conditional relationship between two <code>HObject</code>s.
 * It provides a method of detecting whether the objects are interacting, and 
 * a method of executing/handling the resultant interaction.
 * <p>
 * This is the primary means of writing
 * conditional logic into the <code>World</code> game loop.
 *
 * @param <A>	The first type of <code>HObject</code> in the interaction.
 * @param <B>	The second type of <code>HObject</code> in the interaction.
 */
 public abstract class Interactor<A extends HObject, B extends HObject> {

	private boolean _applyImmediate; 	// whether handle will be called upon detection, or deferred
	private boolean _multisample;		// whether the Interactor will be multisampled
	
	/**
	 * Constructs a new Interactor, setting whether the Interactor will be handled upon
	 * 	detection or deferred, and whether the Interactor will be multisampled. Note that
	 * 	these flags are only meaningful when the Interactor has been registered with a World.
	 * @param applyImmediate	If true, the Interactor will be applied by World as soon as 
	 * 								<code>detect</code> has returned true. If false, it will
	 * 								be applied only when all possible interactions have been checked
	 * 								for the step, for the entire World.
	 * @param multisample		If true, the Interactor will be checked for and applied
	 * 								for each interacting object for each step, against all
	 * 								all objects it may interact with. If false, it will be
	 * 								checked for and applied only once per update of the loop,
	 * 								on the first step.
	 */
	protected Interactor(boolean applyImmediate, boolean multisample) {
		_applyImmediate = applyImmediate;
		_multisample = multisample;
	}
	
	/**
	 * Constructs a new Interactor using default settings.
	 * It will be applied as soon as <code>detect</code>
	 * 	has returned true, and will be applied on once per update (not multisampled).
	 * <p>
	 * Use this constructor unless you understand multisampling and delayed application
	 *  and need it for a specific purpose.
	 */
	protected Interactor() {
		this(true, false);
	}
	
	/**
	 * Whether the Interactor is applied upon detection, or deferred until all possible
	 * 	interactions have been checked for the step.
	 * @return	If true, the World will call <code>handle</code> immediately upon 
	 * 				<code>detect</code> returning true. If false, it will wait until the
	 * 				end of the loop, after all interactions have been checked.
	 */
	public boolean appliedImmediately() {
		return _applyImmediate;
	}
	
	/**
	 * Whether the Interactor is checked for each step of the objects it is registered with,
	 * 	or only once per update.
	 * @return	If true, for each object this Interactor is registered with, the World
	 * 	will apply it for all the object's steps, against all objects the object could
	 * 	interact with. If false, it will be checked only once per object per update, on
	 * 	the object's first step.
	 */
	public boolean multisampled() {
		return _multisample;
	}
	
	/**
	 * Determines whether an interaction between two objects has occurred.
	 * @param object1	the first interacting object
	 * @param object2	the second interacting object
	 * @return			Whether or not an interaction has occurred.
	 */
	public abstract boolean detect(A object1, B object2);

	/**
	 * Handles the result of an interaction that has been detected (by <code>detect</code> return true)
	 * 	for a pair of objects.
	 * @param object1	the first object
	 * @param object2	the second object
	 */
	public abstract void handle(A object1, B object2);
}

