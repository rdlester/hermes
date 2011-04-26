//package src.hermesTest.animationTests;
//import org.junit.After;
//import org.junit.Before;
//import org.junit.Test;
//
//import processing.core.*;
//import src.hermes.Hermes;
//import src.hermes.animation.Tileset;
//
//import static org.junit.Assert.*;
//
//public class AnimationJUnitTests {
//
//	testerProcessingSketch _sketch;
//	
//	@Before
//	public void setUp() {
//		_sketch = new testerProcessingSketch();
//		Hermes.setPApplet(_sketch);
//	}
//	
//	
//	@After
//	public void tearDown() {
//		_sketch = null;
//		Hermes.setPApplet(null);
//	}
//	
//	
//	//create an image of 4 tiles, each 50(row) by 100(col) pixels
//	@Test
//	public void test_all() {
//		
//		//create the image
//		PImage img = _sketch.createImage(200, 100, _sketch.ARGB);
//		img.loadPixels();
//		for(int i=0; i<img.height; i++) {
//			for(int j=0; j<img.width; j++) {
//				int g=0;
//				if(i<50) {
//					g= g+10;
//				} else {
//					g= g+20;
//				}
//				if(j<100) {
//					g = g+100;
//				} else {
//					g = g+255;
//				}
//				img.set(i, j, _sketch.color(r, g, b));
//			}
//		}
//		
//		//construct the Tileset
//		Tileset tileset = new Tileset(img, 100, 50);
//		//it should now be sliced
//		
//		//check that the right number of tiles were made (4)
//		assertEquals(2, tileset.getNumberOfRows());
//		assertEquals(2, tileset.getNumberOfCols());
//		
//		//check that each tile has correct color values
//		PImage topleft = tileset.getTile(0, 0);
//		PImage topright = tileset.getTile(0, 1);
//		PImage bottomleft = tileset.getTile(1,0);
//		PImage bottomright = tileset.getTile(1, 1);
//		assertEquals(_sketch.color(0, 0, 0), topleft.get(0, 0));
//	
//		
//		
//		
//		
//	}
//	
//	
//	private class testerProcessingSketch extends PApplet {}
//}
//
//
//

