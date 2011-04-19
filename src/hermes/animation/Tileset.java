package src.hermes.animation;

import processing.core.PImage;
import src.hermes.Hermes;

public class Tileset {

	private PImage _tileImage; //a tile set aka a tile map aka a sprite sheet
	private int _tileWidth; //width of tiles in the sheet, in pixels
	private int _tileHeight;//height of tiles in the sheet, in pixels

	private PImage[][] _slicedTiles; //we preprocess the images by cutting them up and storing them in this grid

	/**
	 * 
	 * @param tileImage			PImage of tileset to cut up
	 * @param tileWidth			width of tiles in the set, in pixels
	 * @param tileHeight		height of tiles in the set, in pixels
	 */
	public Tileset(PImage tileImage, int tileWidth, int tileHeight) {
		_tileImage = tileImage;
		_tileWidth = tileWidth;
		_tileHeight = tileHeight;

		//initialize array, figure out how many rows and cols (note: _slicedTiles[y][x])
		_slicedTiles = new PImage[tileImage.height / _tileHeight][tileImage.width / _tileWidth];

		//cut the image into slices
		for (int row = 0; row < _tileImage.height / _tileHeight; row++) {
			for (int col = 0; col < _tileImage.width / _tileWidth; col++) { 
				//Create a new image slice that corresponds to the size of the tiles in this set
				PImage slice = Hermes.getPApplet().createImage(_tileWidth, _tileHeight, Hermes.getPApplet().ARGB);
				//Copy pixels from the originally sourced image
				slice.copy(_tileImage, col * _tileWidth, row * _tileHeight, _tileWidth,  _tileHeight, 0, 0, _tileWidth, _tileHeight);

				_slicedTiles[row][col] = slice; //add the slice to our array of slices
			}
		}
	}

	/**
	 * Get a single tile from the Tilemap
	 * @param row			row that the tile is in 
	 * @param col			col that the tile is in 
	 * @return				a PImage of the tile
	 */
	public PImage getTile (int row, int col) {
		return _slicedTiles[row][col];
	}

	/**
	 * Get the width of each tile
	 * @return				the width of each tile
	 */
	public int getTileWidth() {
		return _tileWidth;
	}

	/**
	 * Get the height of each tile
	 * @return				the height of each tile
	 */
	public int getTileHeight() {
		return _tileHeight;
	}

	public int getNumberOfCols() {
		return _slicedTiles[0].length;
	}

	public int getNumberOfRows() {
		return _slicedTiles.length;
	}

	/**
	 * Get a row of PImages from the Tileset
	 * <br>Note: You might find this handy for building an Animation for an AnimatedSprite
	 * @param row		the index of the row to be returned
	 * @return			the row of PImages
	 */
	public PImage[] getRowOfTiles(int row) {
		return _slicedTiles[row];
	}



}
