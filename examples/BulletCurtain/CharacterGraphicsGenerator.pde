/*
This makes generative patterns for use as blocky pixel character graphics.
Visually, the hope is to make something in between look classic video game aliens/spaceships, and patterns from cellular automata.
*/

public class CharacterGraphicsGenerator {

  //Pallette of colors used for characters
  color[] colorPalette = {
    color(255, 51, 52), color(255, 145, 48), color(255, 254, 136), color(0, 184, 48), color(0, 210, 255)
  };

  /*
  Makes a generative PImage[] to be used for creatures/ships. 
  Each PImage in the the returned PImage[] is a unique pattern, symmetrical about its horizontal axis
  patterns are built out of "blocks," where each block has a number of pixels per block
  this is to basically scaling - the character generated can be any size, but still retain a classic pixelated/blocky look
  */
  public PImage[] generate(int numberOfWidthBlocks, int numberOfHeightBlocks, int pixelsPerBlock, color mainColor, int numberOfAnimationFrames) {

    //make a PImage[] of frames for the animation 
    PImage[] generatedFrames = new PImage[numberOfAnimationFrames];

    //use colors from the colorPalette
    mainColor = colorPalette[int(random(colorPalette.length))];

    //for every frame.. 
    for (int frameIndex = 0; frameIndex < generatedFrames.length; frameIndex++) {
      //generate a random frame of desired width&height.
      generatedFrames[frameIndex] = createRandomFrame(numberOfWidthBlocks, numberOfHeightBlocks, pixelsPerBlock, mainColor);
    }

    return generatedFrames;
  }

  private PImage createRandomFrame (int numberOfWidthBlocks, int numberOfHeightBlocks, int pixelsPerBlock, color mainColor) {

    //Make a pattern, return it as a PImage 
    PImage currentFrame = createImage(numberOfWidthBlocks*pixelsPerBlock, numberOfHeightBlocks*pixelsPerBlock, ARGB);     
    
    //call loadPixels() to prep pixel buffer for writing 
    currentFrame.loadPixels(); 

    int pixelRow = 0;
    int pixelCol = 0;

    //for every column of pixels in this image.. (which is the same as the frameWidth)
    for (int col = 0; col < numberOfWidthBlocks; col++) {

      //generate a pattern, 1/2 the height of the image, as it will be made symetrical about the horizontal axis
      int[] pattern = new int[numberOfHeightBlocks / 2];

      //for every position in the pattern...
      for (int patternIndex = 0; patternIndex < pattern.length; patternIndex++) { 
        //build a random pattern.. 
        //***this might be more fun as a Cellular Automata eventually... or something the user can codebend somehow
        pattern[patternIndex] = int(random(2)); //generate a random number that is either 0 or 1
      }

      //now, set all the pixels 
      for (int row = 0; row < numberOfHeightBlocks/2 ; row++) { 

        color colorToUse = color (0, 0, 0, 0); //transparent
        //If the generated pattern has a 1, 
        if (pattern[row] == 1) {
          colorToUse = mainColor;
        } // otherwise leave it as transparent;
        
        //Spice the colors up a bit...
        if (int(random(10)) == 0) {
          //Make a random secondary color
          colorToUse = color(random(255), random(255), random(255));
        }

        //now iterate through all the pixels in this block and set their color
        for (int i = 0; i < pixelsPerBlock; i++) {
          for (int j = 0; j < pixelsPerBlock; j++) {

            currentFrame.set(col * pixelsPerBlock + i, row * pixelsPerBlock + j, colorToUse); // for the top half of the PImage
            int symmetricalRow = numberOfHeightBlocks - row - 1; //and the bottom half, symmetrically
            currentFrame.set(col * pixelsPerBlock + i, symmetricalRow * pixelsPerBlock + j, colorToUse); // for the top half of the PImage
          }
        }
      }
    }

    //Consider a mod: maybe make sure the leftmost col has a few pixels in it.. more convincing collisions ??

    //Lastly, update the pixels of the PImage that was generated
    currentFrame.updatePixels();
    return currentFrame;
  }
}

