package src.hermes.animation;
/**
 * 
 * Interface to tie together various ways of playing animations
 * (Examples: Sprite, Procedural Animation Sequences, etc)
 *
 */
public interface Animatable {
	
	/**
	 * Specifies that the current animation should advance frames
	 */
	public void play();
	
	/**
	 * Specifies that the current animation should NOT advance frames 
	 */
	public void stop();
	
	/**
	 * Determines which animation should play
	 * @param animationIndex a numerical index for determining which animation a sprite should play. User might want to associate these index values with variables constants for the sake of naming
	 */
	public void specifyAnimation(int animationIndex);

	
	
	
	public void draw();

}
