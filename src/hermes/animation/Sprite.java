package src.hermes.animation;

import java.util.ArrayList;

import processing.core.*;
import src.hermes.Hermes;

/**
 * 
 * This class is used to process, store, and play animations. 
 *
 */
class AnimatedSprite implements Animatable {

	private ArrayList<Animation> _animations; // storage container for various animations of a Sprite

	private Animation _activeAnimation; //the current animation being drawn

	private int _currentMillisecondsPerFrame;

	public int addAnimation(Animation animation) {
		_animations.add(animation);
		return _animations.size() - 1; //index of most recently added animation will always be the last element	
	}


	/**
	 * Sets the active animation that the Sprite will use when drawn
	 * Note: This advances frames at the rate originally specified on the construction of the Animation. 
	 * If you want to play this Animation at a different rate, use the 'setActiveAnimation(int animationIndex, int millisecondsPerFrame)' version of this method
	 * @param animationIndex numerical index used to select a specific animation of a sprite
	 */
	public void setActiveAnimation(int animationIndex) {
		_activeAnimation = _animations.get(animationIndex);
		_currentMillisecondsPerFrame = _activeAnimation.getMillisecondsPerFrame(); 

	}

	/**
	 * Sets the active animation that the Sprite will use when drawn, and how many milliseconds each frame of the animation will be displayed for
	 * Note: when you construct an Animation, it stores the millisecondsPerFrame rate internally. This call will NOT change that value, so you can still easily revert to the original rate you specified  
	 * @param animationIndex 		numerical index used to select a specific animation of a sprite
	 * @param millisecondsPerFrame 	optional argument to specify how many milliseconds each frame of the animation will be displayed for

	 */
	public void setActiveAnimation(int animationIndex, int millisecondsPerFrame) {
		_currentMillisecondsPerFrame = millisecondsPerFrame;
		_activeAnimation = _animations.get(animationIndex);
	}


	/**
	 * Retrieves an Animation stored with this AnimatedSprite
	 * @param index		The index of the animation being retrieved
	 * @return
	 */
	public Animation getAnimation(int index) {
		return _animations.get(index);
	}


	public void play() {
		// TODO Auto-generated method stub

	}


	public void stop() {
		// TODO Auto-generated method stub

	}


	public void specifyAnimation(int animationIndex) {
		// TODO Auto-generated method stub

	}


	public void draw() {
		// TODO Auto-generated method stub

	}






}







/*

  THIS WAS OLD - dont panic. - MIGHT NEED IT?

class Sprite {


	// creates a playable animation between frames start_frame and end_frame 
	void addAnimation(int key, int start_frame, int end_frame);

	// plays the animation denoted by the given keys, will loop indefinitely if loop is true
	void setAnimation(int key, boolean loop = false);

	// draws the sprite next animation frame at the given screen position
	//  advances frame count by given value
	void draw(double x, double y, int advanceFrame = 1);

	//Helper utility for splitting image into respective tiles
	PImage[] parseTileMap(PImage map, int rows, int cols);

	//Access to individual frames such that the user can do pixel level changes to a sprite's graphic
	PImage[] getFrames(); 

	//allows user to change the frames of an animation
	setFrames(PImage[] newFrames); 

}

 */