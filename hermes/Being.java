package hermes;

import java.util.List;
import java.util.Collection;


/**
 * Basic game object class
 * Anything that is getting drawn or interacting with other game objects is a Being
 */
public abstract class Being {

	public abstract double getX();
	public abstract double getY();
	public abstract double getZ();

	/**
	 * draws the object to the screen
	 * takes a screen x and y coor
	 * the reason for this is that the being's internal x and y will be screen coordinates, not world coordinates
	 * there may be a better way to do this, with framebuffers, need to look in to this
	 */
	public abstract void draw(int x, int y);

	List<Collection> groups;
	Shape shape; 
	
	public void update() {}
	
	//TODO: need to add methods for recieving messages?
	//Has to be defined in Being

}
