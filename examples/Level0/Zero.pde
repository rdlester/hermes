/**
 * The 0 at the top-left corner of the screen
 */
class Zero {
  
 int vertBarWidth = 30;
 int vertBarHeight = 60;
 
 int horizBarWidth = 60;
 int horizBarHeight = 10;
 
 int vertBarLeftX = 0;
 int vertBarRightX = 70;
 int vertBarY = horizBarHeight;

 int horizBarX = 20;
 int horizBarBottomY = horizBarHeight + vertBarHeight;
 int horizBarTopY = 0;

 void draw() {
   fill(255);
   noStroke();
   rect(horizBarX, horizBarTopY, horizBarWidth, horizBarHeight);
   rect(horizBarX, horizBarBottomY, horizBarWidth, horizBarHeight);
   rect(vertBarLeftX, vertBarY, vertBarWidth, vertBarHeight);
   rect(vertBarRightX, vertBarY, vertBarWidth, vertBarHeight);
 } 
  
}


