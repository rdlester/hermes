package src.hermes.animation;
/**
 * 
 * Interface to tie together various ways of playing animations
 * (Examples: Sprite, Procedural Animation Sequences, etc)
 *
 */
public interface Animatable {
	
	public static final int INFINITE_LOOPS = -1;
	
	/**
	 * Specifies that the current animation should advance frames TODO: change
	 */
	public void pause();
	
	/**
	 * Specifies that the current animation should NOT advance frames TODO: cahnge
	 */
	public void resume();
	
	/**
	 * Determines which animation should play TODO: changet o setActiveAnimation
	 * @param animationIndex a numerical index for determining which animation a sprite should play. User might want to associate these index values with variables constants for the sake of naming
	 */
	public void specifyAnimation(int animationIndex);

	
	
	
	public void draw();

}
