package src.hermes.animation;

import java.util.ArrayList;

import processing.core.*;
import src.hermes.Hermes;
/**
 * <p>This class is used to store the PImages that make up a single animation and some properties
 * that aid in playing that animation. These properties values should be thought of as "default"
 * for this particular Animation, values that you know will work well or be used the most often. </p>
 * 
 * <p>The key properties are:</p>
 * <ul>
 * <li>millisecondsPerFrame - specifies the rate at which the frames should be advanced. In other words, 
 * how long a given frame appears on screen before advancing to the next.
 *
 * <li>interruptible - This is used to determine what happens when an AnimatedSprite's setActiveAnimation is called while this Animation is playing. 
 * By default, this is set to true on construction.
 * <p>If set to true, the AnimatedSprite will immediately switch to the new Animation.</p>
 * <p>If set to false, this Animation will play to completion before changing 
 * If numberOfTimesToPlay is set to INFINITE_LOOPS, it will play to the end of the cycle before switching. 
 * Otherwise, the Animation will play through the remaining cycles it has left before switching.
 * Upon completion of playback, if setActiveAnimation has been called one or more times, the 
 * AnimatedSprite's activeAnimation will be set to the one specified by the most recent call.</p>
 * 
 * 
 * <li><p>numberOfTimesToPlay - Specifies how many times this animation will play.
 * It can be set to any positive integer value, or INFINITE_LOOPS for looping the Animation
 * infinitely. By default, this is set to INFINITE_LOOPS on construction.
 * If the animation completes playing through its numberOfTimesToPlay and no calls
 * to AnimatedSprite's setActiveAnimation were made, the Animation will display its defaultFrame.
 * 
 * <li><p>defaultFrame - the index of the frame that completed animations will rest on. By default
 * this is set to 0 (the first frame in the Animation) on construction.
 * </ul>
 */
public class Animation implements AnimationConstants {

	private int _millisecondsPerFrame; //in milliseconds
	private boolean _isInterruptible = true; //this specifies if the Animation can be escaped at on any frame
	private int _numberOfTimesToPlay = INFINITE_LOOPS;
	private int _defaultFrame = 0;

	ArrayList<PImage> _frames; //Collection of each frame used in the Animation


	/**
	 * Builds an Animation from several image files on disk (where each is an individual frame in the Animation), and adds it to the Sprite's collection of Animations
	 * 
	 * <p>The method loads files with numbers starting from 0 to (numberOfImagesToLoad-1) and assumes numerical contiguity
	 * <br>ex. Explosion0.jpg, Explosion1.jpg, Explosion2.jpg would have method call:
	 * <br>addAnimationFromSequenceOfImages("Explosion", 3, ".jpg");</P>
	 * 
	 * <p>Works with all image filetypes supported by PImage: .gif, .jgp, tga, .png</p>
	 * 
	 * @param imageSequenceNamePrefix 	file prefix of all of the images to be loaded into this Animation ex. "Explosion"
	 * @param numberOfImagesToLoad		total number of images to load (note: your names should be indexed starting from 0)
	 * @param fileType					file extension including the 'dot' - supports: ".gif" ".jgp" ".tga" ".png"
	 * @param millisecondsPerFrame		amount of time each frame in the Animation is displayed, in milliseconds

	 */
	public Animation(String imageSequenceNamePrefix, int numberOfImagesToLoad, String fileType, int millisecondsPerFrame) {
		//asserts to check for valid inputs
		assert supportImageType(fileType): "addAnimation Error: Images of filetype: "+fileType+"not supported.\n Suported types: .gif, .jgp, tga, .png";

		_millisecondsPerFrame = millisecondsPerFrame;
		
		ArrayList<PImage> currentAnimation = new ArrayList<PImage>(); // make an ArrayList to store Animation being built

		//populates current Animation with the files named: <imageSequenceNamePrefix>i<fileType>
		//ex. Explosion4.jpg
		for (int i = 0; i < numberOfImagesToLoad; i++) { 
			PImage currentImage = Hermes.getPApplet().loadImage(imageSequenceNamePrefix + i + fileType);
			currentAnimation.add(currentImage);
		}

		_frames = currentAnimation;
	}
	
	/**
	 * Builds an Animation from several image files on disk (where each is an individual frame in the Animation), and adds it to the Sprite's collection of Animations
	 * 
	 * <p>The method loads files within the specified number range and assumes numerical contiguity
	 * <br>ex. Explosion1.jpg, Explosion2.jpg, Explosion3.jpg would have method call:
	 * <br>addAnimationFromSequenceOfImages("Explosion", 1, 3, ".jpg");</P>
	 * 
	 * <p>Works with all image filetypes supported by PImage: .gif, .jgp, tga, .png</p>
	 * 
	 * @param imageSequenceNamePrefix 	file prefix of all of the images to be loaded into this Animation ex. "Explosion"
	 * @param startIndex				starting index to load from
	 * @param endIndex					ending index to load from
	 * @param fileType					file extension including the 'dot' - supports: ".gif" ".jgp" ".tga" ".png"
	 * @param millisecondsPerFrame		amount of time each frame in the Animation is displayed, in milliseconds

	 */
	public Animation(String imageSequenceNamePrefix, int startIndex, int endIndex, String fileType, int millisecondsPerFrame) {
		//asserts to check for valid inputs
		assert supportImageType(fileType): "addAnimation Error: Images of filetype: "+fileType+"not supported.\n Suported types: .gif, .jgp, tga, .png";

		_millisecondsPerFrame = millisecondsPerFrame;
		
		ArrayList<PImage> currentAnimation = new ArrayList<PImage>(); // make an ArrayList to store Animation being built

		//populates current Animation with the files named: <imageSequenceNamePrefix>i<fileType>
		//ex. Explosion4.jpg
		for (int i = startIndex; i <= endIndex; i++) { 
			PImage currentImage = Hermes.getPApplet().loadImage(imageSequenceNamePrefix + i + fileType);
			currentAnimation.add(currentImage);
		}

		_frames = currentAnimation;
	}
	
	/**
	 * Builds a new Animation from an ArrayList of PImages and adds it to the Sprite's collection of Animations

	 * @param someArrayListOfPImages 		an ArrayList of PImages you'd like to use as an Animation for a sprite
	 * @param millisecondsPerFrame			amount of time each frame in the Animation is displayed

	 */
	public Animation(ArrayList<PImage> someArrayListOfPImages, int millisecondsPerFrame) {	

		assert someArrayListOfPImages != null : "addAnimation Error: The ArrayList of PImages you entered was null";
		//assert someArrayList.size() <= 0: "addAnimation Error: The ArrayList of PImages has no images in it";

		_millisecondsPerFrame = millisecondsPerFrame;
		
		_frames = someArrayListOfPImages; //set the provided Animation to the sprite's list
	}

	
	/**
	 * Builds a new Animation from a PImage[] and adds it to the Sprite's collection of Animations
	 * @param someArrayOfPImages 			a PImage[] you'd like to use as an Animation for a sprite
	 * @param millisecondsPerFrame			amount of time each frame in the Animation is displayed

	 */
	public Animation(PImage[] someArrayOfPImages, int millisecondsPerFrame) {

		assert someArrayOfPImages != null : "addAnimation Error: The PImage[] you entered was null";

		ArrayList<PImage> currentAnimation = new ArrayList<PImage>(someArrayOfPImages.length); // make an ArrayList to store Animation being built

		_millisecondsPerFrame = millisecondsPerFrame;

		for (int i = 0; i < someArrayOfPImages.length; i++) { //add elements of the array to the Animation's ArrayList
			currentAnimation.add(someArrayOfPImages[i]);
		}

		_frames = currentAnimation; //set the newly built Animation to the sprite's list
	}
	
	
	/**
	 * 
	 * @return		Number of frames contained in the Animation (ie: the Animations' length in frames)
	 */
	public int getNumberOfFrames() {
		return _frames.size();
	}
	
	
	/**
	 * 
	 * @param index		The index of the frame you'd like to retrieve
	 * @return			The PImage frame at the index
	 */
	public PImage getFrame(int index) {
		assert  (index>=0 && index < _frames.size()) : "getFrame Error: Index must be between 0 and the number of frames in the Animation";
		
		return _frames.get(index);	
	}

	/**
	 * 
	 * @return		How many milliseconds each Animation frame will play for
	 */
	public int getMillisecondsPerFrame() {
		return _millisecondsPerFrame;
	}
	
	/**
	 * Sets how many milliseconds each Animation frame will play for
	 * <br>Note: if you only want to change this value for one call to
	 * AnimatedSprite's setActiveAnimation, use the overrideMillisecondsPerFrame()
	 * method in the AnimatedSprite class. 
	 */
	public void setMillisecondsPerFrame(int millisecondsPerFrame) {
		_millisecondsPerFrame = millisecondsPerFrame;
	}
	
	/**
	 * 
	 * @return		True if interruptible, false otherwise
	 */
	public boolean getInterruptible() {
		return _isInterruptible;
	}
	
	/**
	 * 
	 * This is used to determine what happens when an AnimatedSprite's setActiveAnimation is called while this Animation is playing. 
	 * <p>If set to true (default), the AnimatedSprite will immediately switch to the new Animation.</p>
	 * <p>If set to false, this Animation will play to completion before changing (If it is looping, it will play to the end of the Animation. If it isn't looping, the Animation will play through the remaining cycles it has left).
	 * <br>Upon completion of uninterrupted playback, there are two cases: 
	 * <ul><li>1. If setActiveAnimation has been called one or more times, the AnimatedSprite's activeAnimation will be set to the one specified by the most recent call. 
	 * <li>2. Alternatively, if setActiveAnimation has been called 0 times, the behavior further depends on whether or not the Animation is looping:
	 * <ul><li>2a. if the Animation's isLooping is set to true, it will continue looping.
	 * <li>2b. if the Animation's isLooping is set to false, the image will be paused on the last frame of the Animation.</ul></ul></p>
	 * @param interruptible		boolean to specify if Animation should be interruptible
	 */
	public void setInterruptible(boolean interruptible) {
		_isInterruptible = interruptible;
	}
	
	/**
	 * 
	 * 
	 * @return		The number of times this is set to play.
	 */
	public int getNumberOfTimesToPlay() {
		return _numberOfTimesToPlay;
	}
	
	/**
	 * 
	 * @param numberOfTimesToPlay 	the number of times this animation is set to play through all its frames
	 * Note: use INFINITE_LOOPS to set animation to loop infinitely
	 */
	public void setNumberOfTimesToPlay(int numberOfTimesToPlay) {
		_numberOfTimesToPlay = numberOfTimesToPlay;
	}
	
	/**
	 * 
	 * @return		the index of the default frame
	 */
	public int getDefaultFrame() {
		return _defaultFrame;
	}
	
	/**
	 * 
	 * @param indexOfDefaultFrame	the index of the default frame
	 */
	public void setDefaultFrame(int indexOfDefaultFrame) {
		_defaultFrame = indexOfDefaultFrame;
	}
	

	/**
	 * Helper method for checking filetype and providing clear error messages
	 * @param fileType
	 * @return
	 */
	private boolean supportImageType(String fileType) {
		//suported types: .gif, .jgp, .tga, .png
		return (fileType.equals(".gif") || fileType.equals(".jpg") || fileType.equals(".tga") || fileType.equals(".png"));		
	}



}
