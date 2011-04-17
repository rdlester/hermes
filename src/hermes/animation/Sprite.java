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
	
	private ArrayList<ArrayList<PImage>> _animations; // storage container for various animations of a Sprite

	private ArrayList<PImage> _activeAnimation; //the current animation being drawn

	//Error message used for loading methods
	private String _fileTypeErrorString = "Suported types: .gif, .jgp, tga, .png";
	
	/**
	 * 
	 * @param animationIndex numerical index used to select a specific animation of a sprite
	 */
	public void setActiveAnimation(int animationIndex) {
		_activeAnimation = _animations.get(animationIndex);
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

	/**
	 * Builds an animation from several image files on disk (where each is an individual frame in the animation), and adds it to the Sprite's collection of animations
	 * 
	 * The method loads files with numbers starting from 0 to (numberOfImagesToLoad-1) and assumes numerical contiguity
	 * ex. BigBaboon0.jpg, BigBaboon1.jpg, BigBaboon2.jpg would have method call:
	 * addAnimationFromSequenceOfImages("BigBaboon", 3, ".jpg");
	 * 
	 * Works with all image filetypes supported by PImage.
	 * 
	 * @param imageSequenceNamePrefix 	file prefix of all of the images to be loaded into this animation ex. "BigBaboon"
	 * @param numberOfImagesToLoad		total number of images to load
	 * @param fileType					file extension including the 'dot' . ex ".jpg".
	 * @return							the index of the newly created animation
	 */
	public int addAnimation(String imageSequenceNamePrefix, int numberOfImagesToLoad, String fileType) {
		//asserts to check for valid inputs
		assert supportImageType(fileType): "addAnimation Error: Images of filetype: "+fileType+"not supported.\n" + _fileTypeErrorString;
		
		ArrayList<PImage> currentAnimation = new ArrayList<PImage>(); // make an ArrayList to store animation being built
		
		//populates current animation with the files named: <imageSequenceNamePrefix>i<fileType>
		//ex. BigBaboon4.jpg
		for (int i = 0; i < numberOfImagesToLoad; i++) { 
			PImage currentImage = Hermes.getPApplet().loadImage(imageSequenceNamePrefix + i + fileType);
			currentAnimation.add(currentImage);
		}
		_animations.add(currentAnimation); //add the newly built animation to the sprite's list
		
		return _animations.size() - 1; //index of most recently added animation will always be the last element
	}
	
	/**
	 * Builds a new animation from an ArrayList of PImages and adds it to the Sprite's collection of animations

	 * @param someArrayListOfPImages 		an ArrayList of PImages you'd like to use as an animation for a sprite
	 * @return 								the index of the newly created animation
	 */
	public int addAnimation(ArrayList<PImage> someArrayListOfPImages) {	
		
		assert someArrayListOfPImages != null : "addAnimation Error: The ArrayList of PImages you entered was null";
		//assert someArrayList.size() <= 0: "addAnimation Error: The ArrayList of PImages has no images in it";

		_animations.add(someArrayListOfPImages); //add the provided animation to the sprite's list
		
		return _animations.size() - 1; //index of most recently added animation will always be the last element	
	}
	
	/**
	 * Builds a new animation from a PImage[] and adds it to the Sprite's collection of animations
	 * @param someArrayOfPImages 			a PImage[] you'd like to use as an animation for a sprite
	 * @return								the index of the newly created animation
	 */
	public int addAnimation(PImage[] someArrayOfPImages) {
		
		assert someArrayOfPImages != null : "addAnimation Error: The PImage[] you entered was null";

		ArrayList<PImage> currentAnimation = new ArrayList<PImage>(someArrayOfPImages.length); // make an ArrayList to store animation being built

		for (int i = 0; i < someArrayOfPImages.length; i++) { //add elements of the array to the animation's ArrayList
			currentAnimation.add(someArrayOfPImages[i]);
		}
		
		_animations.add(currentAnimation); //add the newly built animation to the sprite's list

		return _animations.size() - 1; //index of most recently added animation will always be the last element	

	}
	
	
	
	
	
	/**
	 * Helper method for checking filetype and providing clear user messages
	 * @param fileType
	 * @return
	 */
	private boolean supportImageType(String fileType) {
		//suported types: .gif, .jgp, .tga, .png
		return (fileType.equals(".gif") || fileType.equals(".jpg") || fileType.equals(".tga") || fileType.equals(".png"));		
	}
	
	
	

}







/*

  THIS WAS OLD - dont panic. - MIGHT NEED IT?

package src.hermes;

import processing.core.*;


class Sprite {

	//Used to store each frame of an animation
	PImage[] frames;

	// loads a Sprite by importing a single image and splitting it into a tiles with given rows and cols
	Sprite(String filename, int rows, int cols) {

		PImage uncutSheet = loadImage("filename");

		for (int i = 0; i < rows; i ++) {
		}

	}

	// loads a Sprite from an image sequence in format name.#.ext
	Sprite(String name, String extension, int end, int start = 0);

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