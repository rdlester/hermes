package src.hermes.animation;

import java.util.ArrayList;

import processing.core.*;
import src.hermes.Hermes;

/**
 * 
 * This class is used to process, store, and play animations. 
 *
 */
public class AnimatedSprite {

	private ArrayList<Animation> _animations; // storage container for various animations of a Sprite

	private Animation _activeAnimation; //the current animation being drawn
	private int _currentFrameIndex; //the index of the frame currently being shown
	private int _currentMillisecondsPerFrame; //how many milliseconds to each frame is displayed for
	//these are loop markers
	private int _initialFrame; //the starting position in the animation
	private int _lastFrame; //the ending position in the animation
	private boolean _playDirectionLeftToRight = true; 

	//on deck buffers
	//if flag is true, these will replace their current counterparts (listed above) during the animate() and setActiveAnimation() methods
	private int _indexOfAnimationOnDeck;
	private boolean _indexOfAnimationOnDeckFlag;
	private int _millisecondsPerFrameOnDeck;
	private boolean _millisecondsPerFrameOnDeckFlag;
	private int _initialFrameOnDeck;
	private boolean _initialFrameOnDeckFlag;
	private int _lastFrameOnDeck;
	private boolean _lastFrameOnDeckFlag;
	private boolean _playDirectionLeftToRightOnDeck;
	private boolean _playDirectionLeftToRightOnDeckFlag;
	private boolean _playingOnDeck = true;
	private boolean _interruptibleOnDeck;


	//these are changed by override methods 
	// (the setters won't overwrite the stored values of the individual animations.. they just affect the current activeAnimation's playback) 
	private boolean _currentInterruptible = true;
	private int _numberOfPlaysRemaining;

	private int _timeOfLastFrameAdvance; //used to keep track of when to advance frames
	
	private boolean _setActiveAnimationWasCalled = false;
	
	//play/pause
	private boolean _playing = true;

	public AnimatedSprite() {
		_animations = new ArrayList<Animation>(); //make a new empty ArrayList to hold the Animations
	}


	public int addAnimation(Animation animation) {
		assert animation != null : "In AnimatedSprite.addAnimation(Animation animation): animation must not be null";
		_animations.add(animation);
		return _animations.size() - 1; //index of most recently added animation will always be the last element	
	}


	/**
	 * Sets the active animation that the Sprite will use when drawn
	 * <p>Note: This uses parameters internal to the specified animation for :
	 * millisecondsPerFrame, interruptible, isLooping, numberOfLoops.
	 * If you want to override any of these temporarily (ie just for this playback, this does
	 * not change the Animation's internal parameters) use the override methods described
	 * in this class following your call to this method. Eg.</p>
	 * <p>setActiveAnimation(3);
	 * <br>overrideInterruptible(true); //allows this playback to be interrupted</p>
	 * <br>overrideNumberOfTimesToPlay(3);//will play through the Animation 3 times
	 * @param animationIndex numerical index used to select a specific animation of a sprite
	 */
	public void setActiveAnimation(int animationIndex) {
		
		// make sure there are animations to choose from, and that they have been set within correct bounds
		assert !_animations.isEmpty() : "setActiveAnimation Error: You tried to set an active Animation but you haven't added any Animations yet";
		assert (animationIndex >= 0 ) : "setActiveAnimation Error: You tried to set your active Animation to: "+animationIndex+ ", which is a negative number, and isn't in the bounds of the Animations";  
		assert (animationIndex<_animations.size()) : "setActiveAnimation Error: You tried to set your active Animation to: "+animationIndex+ ", which isn't in the bounds of the Animations";  

		
		//if this is the first call to setActiveAnimation, set to true
		if(!_setActiveAnimationWasCalled) {
			_setActiveAnimationWasCalled=true;
		}
		
		//set the active Animation
		if(_currentInterruptible) { //Animation is interruptible
			//immediately change to new Animation and set parameters by its defaults
			_activeAnimation = _animations.get(animationIndex);
			_currentMillisecondsPerFrame = _activeAnimation.getMillisecondsPerFrame();
			_currentInterruptible = _activeAnimation.getInterruptible();
			_numberOfPlaysRemaining = _activeAnimation.getNumberOfTimesToPlay();
			_initialFrame = 0;
			_lastFrame = _activeAnimation.getNumberOfFrames() - 1;
			_playDirectionLeftToRight = true;
		} else { //Animation is not interruptible
			//put the animationIndex on deck
			_indexOfAnimationOnDeck = animationIndex;
			_indexOfAnimationOnDeckFlag = true;
			_millisecondsPerFrameOnDeck = _animations.get(animationIndex).getMillisecondsPerFrame();
			_millisecondsPerFrameOnDeckFlag = true;
			_initialFrameOnDeck = 0;
			_indexOfAnimationOnDeckFlag = true;
			_lastFrameOnDeck = _animations.get(animationIndex).getNumberOfFrames() - 1;
			_lastFrameOnDeckFlag = true;
			_playDirectionLeftToRightOnDeck = true;
			_playDirectionLeftToRightOnDeckFlag = true;
			_interruptibleOnDeck = _animations.get(animationIndex).getInterruptible();
		}
	}

	/**
	 * Overrides interruptible -- valid until next call to setActiveAnimation.
	 * <br>Note: this does not overwrite the Animation's internal interruptible
	 * @param millisecondsPerFrame		How many milliseconds each Animation frame will play for
	 */
	public void overrideInterruptible(boolean interruptible) {
		_currentInterruptible = interruptible;
	}

	/**
	 * Overrides millisecondsPerFrame -- valid until next call to setActiveAnimation.
	 * <br>Note: this does not overwrite the Animation's internal millisecondsPerFrame
	 * @param millisecondsPerFrame		How many milliseconds each Animation frame will play for
	 */
	public void overrideNumberOfTimesToPlay(int numberOfTimesToPlay) {
		assert numberOfTimesToPlay>=0 : "overrideNumberOfTimesToPlay Error: numberOfTimesToPlay must be a non-negative integer, you enetered:"+numberOfTimesToPlay;
		_numberOfPlaysRemaining = numberOfTimesToPlay;
	}


	/**
	 * Retrieves an Animation stored with this AnimatedSprite
	 * @param index		The index of the animation being retrieved
	 * @return
	 */
	public Animation getAnimation(int index) {
		// make sure there are animations to choose from, and that they have been set within correct bounds
		assert !_animations.isEmpty() : "getAnimation Error: You tried to get an Animation but you haven't added any Animations yet";
		assert (index >= 0 && index<_animations.size()) : "getAnimation Error: You tried to get an Animation at index: "+index+ ", which isn't in the bounds of the Animations";  
		return _animations.get(index);
	}
	
	/**
	 *  the number of Animations added to this AnimatedSprite
	 * @return		the number of Animations added to this AnimatedSprite
	 */
	public int getNumberOfAnimations() {
		return _animations.size();
		
	}
	

	/**
	 * Overrides millisecondsPerFrame for this playback. It is valid until the next call to setActiveAnimation.
	 * <br>Note: this does not overwrite the Animation's internal millisecondsPerFrame
	 * @param millisecondsPerFrame		How many milliseconds each Animation frame will play for
	 */
	public void overrideMillisecondsPerFrame(int millisecondsPerFrame) {
		assert millisecondsPerFrame>0 : "overrideMillisecondsPerFrame Error: millisecondsPerFrame must be a positive integer, you enetered: "+millisecondsPerFrame;
		assert _setActiveAnimationWasCalled : "overrideMillisecondsPerFrame Error: this method can only be called after you have called setActiveAnimation(int animationIndex)";
		
		_millisecondsPerFrameOnDeck = millisecondsPerFrame;
		_millisecondsPerFrameOnDeckFlag = true; //flag this to get updated by animate()
	}

	/**
	 * 
	 * @return		the index of the initial frame of the Animation
	 */
	public int getInitialFrame() {
		assert _setActiveAnimationWasCalled : "getInitialFrame Error: this method can only be called after you have called setActiveAnimation(int animationIndex)";
		assert !_animations.isEmpty() : "getInitialFrame Error: You tried to get the InitialFrame but you haven't added any Animations yet.";
		return _initialFrame;
	}

	/**
	 * Sets the initial frame for this playback. It is basically the loop's head marker. A single play of the Animation will start at the initial frame,
	 * and play each frame in the direction specified by playDirectionLeftToRight() or playDirectionRightToLeft()
	 * until the last frame is reached. If the Animation must loop again, it will start the process over
	 * again at the initial frame.
	 * <br>Note: by default this is set to 0, the index of the leftmost frame from the Animation
	 * @param initialFrame		the index of the initial frame in the Animation
	 */
	public void setInitialFrame(int initialFrame) {
		assert _setActiveAnimationWasCalled : "setInitialFrame Error: this method can only be called after you have called setActiveAnimation(int animationIndex)";
		assert !_animations.isEmpty() : "setInitialFrame Error: You tried to set the InitialFrame but you haven't added any Animations yet.";
		
		_initialFrameOnDeck = initialFrame;
		_initialFrameOnDeckFlag = true; //flag this to get updated by animate()
	}

	/**
	 * 
	 * @return		the index of the last frame of the Animation
	 */
	public int getLastFrame() {
		assert _setActiveAnimationWasCalled : "getLastFrame Error: this method can only be called after you have called setActiveAnimation(int animationIndex)";
		assert !_animations.isEmpty() : "getLastFrame Error: You tried to get the LastFrame but you haven't added any Animations yet";

		return _lastFrame;
	}

	/**
	 * Sets the last frame for this playback. It is basically the loop's end marker. A single play of the Animation will start at the initial frame,
	 * and play each frame in the direction specified by playDirectionLeftToRight() or playDirectionRightToLeft()
	 * until the last frame is reached. If the Animation must loop again, it will start the process over
	 * again at the initial frame.
	 * <br>Note: by default this is set to the (number of frames in the Animation - 1), the rightmost frame
	 * @param lastFrame		the index of the last frame in the Animation
	 */
	public void setLastFrame(int lastFrame) {
		assert _setActiveAnimationWasCalled : "setLastFrame Error: this method can only be called after you have called setActiveAnimation(int animationIndex)";
		assert !_animations.isEmpty() : "setLastFrame Error: You tried to set the LastFrame but you haven't added any Animations yet";

		
		_lastFrameOnDeck = lastFrame;
		_lastFrameOnDeckFlag = true;
	}

	/**
	 * Sets the direction of play from left to right. Eg. if the Animation sequence is A-B-C-D-E
	 * the frames will play in the following order: A,B,C,D,E,(if looping : A,B,C...)
	 */
	public void setPlayDirectionLeftToRight() {
		assert _setActiveAnimationWasCalled : "setPlayDirectionLeftToRight Error: this method can only be called after you have called setActiveAnimation(int animationIndex)";
		assert !_animations.isEmpty() : "setPlayDirectionLeftToRight Error: You tried to setPlayDirectionLeftToRight but you haven't added any Animations yet";

		
		_playDirectionLeftToRightOnDeck = true;
		_playDirectionLeftToRightOnDeckFlag = true; //flag this to get updated by animate()
	}

	/**
	 * Sets the direction of play from right to left. Eg. if the Animation sequence is A-B-C-D-E
	 * the frames will play in the following order: E,D,C,B,A,(if looping : E,D,C...)
	 */
	public void setPlayDirectionRightToLeft() {
		assert _setActiveAnimationWasCalled : "setPlayDirectionRightToLeft Error: this method can only be called after you have called setActiveAnimation(int animationIndex)";
		assert !_animations.isEmpty() : "setPlayDirectionRightToLeft Error: You tried to setPlayDirectionRightToLeft but you haven't added any Animations yet";

		
		_playDirectionLeftToRightOnDeck = false;
		_playDirectionLeftToRightOnDeckFlag = true; //flag this to get updated by animate()
	}

	/**
	 * 
	 * @return		true if the play direction is left to right, false if the play direction is right to left
	 */
	public boolean getPlayDirectionLeftToRight() {
		assert _setActiveAnimationWasCalled : "getPlayDirectionLeftToRight Error: this method can only be called after you have called setActiveAnimation(int animationIndex)";
		assert !_animations.isEmpty() : "getPlayDirectionLeftToRight Error: You tried to getPlayDirectionLeftToRight but you haven't added any Animations yet";

		return _playDirectionLeftToRight;
	}

	/**
	 *
	 * @return		true if the play direction is right to left, false if the play direction is left to right
	 */
	public boolean getPlayDirectionRightToLeft() {
		assert _setActiveAnimationWasCalled : "getPlayDirectionRightToLeft Error: this method can only be called after you have called setActiveAnimation(int animationIndex)";
		assert !_animations.isEmpty() : "getPlayDirectionRightToLeft Error: You tried to getPlayDirectionRightToLeft but you haven't added any Animations yet";

		
		return !_playDirectionLeftToRight;
	}
	
	/**
	 *  This tells the Animated Sprite to play its activeAnimation.
	 *  It may be used after a call to pause() to restart the play.
	 */
	public void unpause() {
		_playing = true;
		_playingOnDeck = true;
	}
	
	/**
	 * This pauses the Animated Sprite on its currentFrame. It respects the setting of Interruptible.
	 */
	public void pause() {
	    _playingOnDeck = false;
	}

	/**
	 * This method handles advancing the Animation's frame, and then returns the PImage corresponding to the Animation's current state
	 * 
	 */
	public PImage animate() {
		
		assert _setActiveAnimationWasCalled : "animate Error: this method can only be called after you have called setActiveAnimation(int animationIndex)";
		assert !_animations.isEmpty() : "animate Error: You tried to call animate() but you haven't added any Animations yet";

		//There are two main steps here:
		//1) update the values from the OnDeck buffers if appropriate
		//2) handle advancing the frame, set all the values correctly, and return the new frame

		////////1)

		//there are two cases where you want to pull the values from the OnDeck buffers:
		//1. the current playing Animation is interruptible (want to change values immediately)
		//2. the current playing Animation is uninterruptible BUT it is on its final frame of its final playthrough 
		//(or just final frame on any playthrough if on loop infinitely)
		if(_currentInterruptible || 
				((_numberOfPlaysRemaining==Animatable.INFINITE_LOOPS || _numberOfPlaysRemaining==0) && _currentFrameIndex==_lastFrame)) { 

			//check onDeck buffers, replace values, update flags.

			if (_indexOfAnimationOnDeckFlag) { //set activeAnimation was called - update the active animation using onDeck buffer
				_activeAnimation = _animations.get(_indexOfAnimationOnDeck);	
				_indexOfAnimationOnDeckFlag = false; //reset flag
				_currentInterruptible = _interruptibleOnDeck;
			}

			if (_millisecondsPerFrameOnDeckFlag) { 
				_currentMillisecondsPerFrame = _millisecondsPerFrameOnDeck; //update the millisecondsPerFrame used based on the onDeck buffer
				_millisecondsPerFrameOnDeckFlag = false; //reset flag
			}

			if (_initialFrameOnDeckFlag) { 
				_initialFrame = _initialFrameOnDeck; //update the initialFrame to use based on the onDeck buffer
				_initialFrameOnDeckFlag = false; //reset flag
			}

			if (_lastFrameOnDeckFlag) { 
				_lastFrame = _lastFrameOnDeck; //update the lastFrame to use based on the onDeck buffer
				_lastFrameOnDeckFlag = false; //reset flag
			}

			if (_playDirectionLeftToRightOnDeckFlag) { 
				_playDirectionLeftToRight = _playDirectionLeftToRightOnDeck; //update the play direction based on the onDeck buffer
				_playDirectionLeftToRightOnDeckFlag = false; //reset flag
			}
			
			if (!_playingOnDeck) {
				_playing = _playingOnDeck;
			}
			
		} 

		////////2)
		if(_playing) {
			int currentTime = Hermes.getPApplet().millis();
			if(currentTime - _timeOfLastFrameAdvance >= _currentMillisecondsPerFrame) { //if the millisecondsPerFrame specified has passed
	
				//we don't want to advance the frame if the Animation's numberOfPlays is 0 and you've played last frame, otherwise, go!
				if (_numberOfPlaysRemaining==0 && _currentFrameIndex==_lastFrame) { 
					_currentFrameIndex = _activeAnimation.getdefaultFrame(); //always draw the default if the Animation has completed all playbacks
					_timeOfLastFrameAdvance = currentTime;
	
				} else {
					advanceFrame();
					_timeOfLastFrameAdvance = currentTime;
				}
			}
		}

		return _activeAnimation.getFrame(_currentFrameIndex); //returns the currentFrame of the Animation
	}

	/**
	 * advances _currentFrameIndex
	 * <br>considers: the play direction, initial and last frame positions (including those where last is lower than initial), and lower and upper indices of the Animation's array 
	 */
	private void advanceFrame() {
		
		if (_initialFrame == _lastFrame) { //if the user has set the initalFrame and lastFrame to the same.. just display that frame
			_currentFrameIndex = _initialFrame;

		} else { //otherwise... have fun:

			if (_playDirectionLeftToRight) { //playing left to right
				if(_initialFrame<_lastFrame) { //init is less than last
					if(_currentFrameIndex<_lastFrame) { //not at end of Animation
						if(_currentFrameIndex<_activeAnimation.getNumberOfFrames()) { //not at end of ArrayList
							_currentFrameIndex++;
						} else { //at end of arraylist
							_currentFrameIndex = _initialFrame;
						}
					} else { //just displayed _lastFrame (or no man's land)
						_currentFrameIndex = _initialFrame;
					}
				} else { //last is less than init
					if(_currentFrameIndex>=_initialFrame) { //greater than init
						if(_currentFrameIndex<_activeAnimation.getNumberOfFrames()) {//not at end of arraylist
							_currentFrameIndex++;
						} else { //at end of arraylist
							_currentFrameIndex = 0;
						} 
					} else { //less than init
						if(_currentFrameIndex<_lastFrame) { //left of final
							_currentFrameIndex++;
						} else { //in no-man's land between final and init
							_currentFrameIndex = _initialFrame;
						}
					}
				}
			} else { //playing right to left
				if(_initialFrame>_lastFrame) { //init is right of last
					if(_currentFrameIndex>_lastFrame) { //not at end of Animation
						_currentFrameIndex--;
					} else { //just displayed last frame (or no man's land)
						_currentFrameIndex = _initialFrame;
					}
				} else { //init is left of last
					if(_currentFrameIndex<=_initialFrame) {//left of or on initial
						if(_currentFrameIndex>0) { //not at edge of arraylist
							_currentFrameIndex--;
						} else {//are at edge of arraylist
							_currentFrameIndex = _activeAnimation.getNumberOfFrames() - 1;
						}
					} else { //right of initial
						if(_currentFrameIndex>_lastFrame) {//right of final
							_currentFrameIndex--;
						} else {//on final or in no man's land
							_currentFrameIndex = _initialFrame;
						}
					}
				}
			}
		}
	}

	/**
	 * This switches the direction of the playback and swaps the initial and final frames.
	 * Eg. if the frames play A-B-C, then you call reverse(), they will play C-B-A.
	 * If the Animation is interruptible, the reverse will happen immediately. If the 
	 * Animation is not interruptible, the changes will be come into effect when the Animation
	 * has been played through. These changes are only relevant while this is the active Animation
	 * and they are valid for this playback.
	 */
	public void reverse() {
		assert _setActiveAnimationWasCalled : "reverse Error: this method can only be called after you have called setActiveAnimation(int animationIndex)";
		assert !_animations.isEmpty() : "reverse Error: You tried to call reverse() but you haven't added any Animations yet";

		
		int formerInitialFrame = _initialFrame;
		setInitialFrame(getLastFrame());
		setLastFrame(formerInitialFrame);

		//Flip direction
		if (getPlayDirectionRightToLeft()) {
			setPlayDirectionLeftToRight();
		} else {
			setPlayDirectionRightToLeft();
		}
	}
}