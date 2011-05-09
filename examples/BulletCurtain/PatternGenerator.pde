public class PatternGenerator {

  //make it possible to get different widths and heights...
  //so that might mean storing the patterns that are used...
  //alternatively, could just have a couple default sizes that are auto generated, and thus setAcvtiveAnimation calls.. 


  color[] rainbowColors = {
    color(255, 51, 52), color(255, 145, 48), color(255, 254, 136), color(0, 184, 48), color(0, 210, 255)
  } 
  ;

  PatternGenerator() {
    //  PatternGenerator(int frameWidth, int frameHeight)
  }

  //Makes a generative PImage[] to be used for entities! 
  //Each PImage in the the returned PImage[] is a unique pattern, symmetrical about its horizontal axis
  PImage[] generatePatternFrames(int numberOfWidthBlocks, int numberOfHeightBlocks, int pixelsPerBlock, color mainColor, int numberOfFrames) {

    PImage[] generatedFrames = new PImage[numberOfFrames];


    ///** change this later?
    //mainColor = color(random(255),random(255),random(255));

    mainColor = rainbowColors[int(random(rainbowColors.length))];

    //for every frame.. 
    for (int frameIndex = 0; frameIndex < generatedFrames.length; frameIndex++) {

      generatedFrames[frameIndex] = createRandomFrame(numberOfWidthBlocks, numberOfHeightBlocks, pixelsPerBlock, mainColor);
    }

    return generatedFrames;
  }




  public PImage createRandomFrame (int numberOfWidthBlocks, int numberOfHeightBlocks, int pixelsPerBlock, color mainColor) {

    //Make a PImage that is the same size as the bounding box of this 'Other'
    PImage currentFrame = createImage(numberOfWidthBlocks*pixelsPerBlock, numberOfHeightBlocks*pixelsPerBlock, ARGB);     
    currentFrame.loadPixels(); //call loadPixels() so that the pixel data can be written to

    int pixelRow = 0;
    int pixelCol = 0;

    //for every column of pixels in this image.. (which is the same as the frameWidth)
    for (int col = 0; col < numberOfWidthBlocks; col++) {


      //////////////////////Don't really need to do this... just use random below...



      //generate a pattern, 1/2 the height of the image, as it will be made symetrical about the horizontal axis
      int[] pattern = new int[numberOfHeightBlocks / 2];

      //for every position in the pattern...
      for (int patternIndex = 0; patternIndex < pattern.length; patternIndex++) { 
        //build a random pattern.. 
        //***this might be more fun as a Cellular Automata eventually... or something the user can codebend somehow

        pattern[patternIndex] = int(random(2)); //generate a random number that is either 0 or 1
      }



      //////////////////////////

      //now, set all the pixels 
      for (int row = 0; row < numberOfHeightBlocks/2 ; row++) { 

        color colorToUse = color (0, 0, 0, 0); //transparent
        //If the generated pattern has a 1, 
        if (pattern[row] == 1) {
          colorToUse = mainColor;
        } // otherwise leave it as transparent;


        if (int(random(10)) == 0) {

          ///random
              colorToUse = color(random(255), random(255), random(255));
       //   colorToUse = rainbowColors[int(random(rainbowColors.length))];

          //        colorToUse = mainColor+ int(random (200));
        }

        for (int i = 0; i < pixelsPerBlock; i++) {
          for (int j = 0; j < pixelsPerBlock; j++) {

            currentFrame.set(col * pixelsPerBlock + i, row * pixelsPerBlock + j, colorToUse); // for the top half of the PImage
            int symmetricalRow = numberOfHeightBlocks - row - 1; //and the bottom half, symmetrically
            currentFrame.set(col * pixelsPerBlock + i, symmetricalRow * pixelsPerBlock + j, colorToUse); // for the top half of the PImage
          }
        }
      }
    }


    //**** maybe make sure the leftmost col has a few pixels in it.. more convincing collisions ??

    //Update the pixels of the PImage that was generated
    currentFrame.updatePixels();
    return currentFrame;
  }


  /*

   void conwayGameOfLife (int[][] oldBoard) {
   
   oldBoard.length;
   
   int[][] newBoard = new int[][ROWS];
   
   
   for (int row = ROWS-1; row >= 0; row--) { // start at the bottom row
   
   //check current row to see if it should be cleared
   for (int col = 0; col < COLS; col++) { // go cols left to right
   int numberOfNeighbors = 0;
   
   if (row > 0 && col > 0 && row < ROWS-1 && col < COLS-1) {
   
   // find neighbor count
   
   
   if (oldBoard[col+1][row+1] != null) {
   numberOfNeighbors++;
   }
   if (oldBoard[col-1][row+1] != null) {
   numberOfNeighbors++;
   }
   if (oldBoard[col+1][row-1] != null) {
   numberOfNeighbors++;
   }
   if (oldBoard[col-1][row-1] != null) {
   numberOfNeighbors++;
   }
   if (oldBoard[col][row+1] != null) {
   numberOfNeighbors++;
   }
   if (oldBoard[col][row-1] != null) {
   numberOfNeighbors++;
   }
   if (oldBoard[col+1][row] != null) {
   numberOfNeighbors++;
   }
   if (oldBoard[col-1][row] != null) {
   numberOfNeighbors++;
   }
   }
   
   
   //RULES:
   
   if (oldBoard[col][row] != null) {
   if (numberOfNeighbors < 2 || numberOfNeighbors > 3 ) { //less than two or more than three, kill it
   
   
   
   
   newBoard[col][row] = null;
   }
   
   if (numberOfNeighbors == 2 || numberOfNeighbors == 3) { // it lives.. copy it over
   newBoard[col][row] = 1; 
   
   }
   }
   
   else { // if there is no block at that position
   
   if (numberOfNeighbors == 3) {
   newBoard[col][row] = 1;
   
   
   
   }
   }
   }
   }
   
   oldBoard = newBoard; // after the loops, copy the new board over!
   }
   
   */
}

