/**
 * 
 */

import src.hermes.*;
import src.hermesTest.physicsTest.*;
import src.hermesTest.postOfficeTests.*;
import src.hermes.shape.*;
import src.hermes.animation.*;
import src.hermesTest.shapeTests.*;
import src.hermesTest.core.*;
import src.hermes.physics.*;
import src.hermes.postoffice.*;

///////////////////////////////////////////////////
// CONSTANTS
///////////////////////////////////////////////////
/**
 * Constants should go up here
 * Making more things constants makes them easier to adjust and play with!
 */
static final int WINDOW_WIDTH = 600;
static final int WINDOW_HEIGHT = 600;

World _world;
Camera _camera;
PostOffice _postOffice;

///////////////////////////////////////////////////
// BEINGS
///////////////////////////////////////////////////
/**
 * Template being - overwrite when making your own project
 */
class MyBeing extends Being {
	MyBeing(Shape shape) {
		super(shape);
		//Add your constructor info here
	}
	
	public void draw() {
		//Add your draw method here
	}
}

///////////////////////////////////////////////////
// GROUPS
///////////////////////////////////////////////////
/**
 * Add groups here if you need custom group behavoir
 */

///////////////////////////////////////////////////
// INTERACTORS
///////////////////////////////////////////////////
/**
 * Template interactor between a MyBeing and another MyBeing - overwrite when making your own project
 */
class MyInteraction implements Interactor<MyBeing,MyBeing> {
	MyInteraction() {
		//Add your constructor info here
	}
	
	boolean detect(MyBeing being1, MyBeing being2) {
		//Add your detect method here
	}
	
	boolean handle(MyBeing being1, MyBeing being2) {
		//Add your handle method here
	}
}

///////////////////////////////////////////////////
// PAPPLET
///////////////////////////////////////////////////

void setup() {
	size(WINDOW_WIDTH, WINDOW_HEIGHT); 
	Hermes.setPApplet(this);

	_camera = new Camera();
	try {
	_postOffice = new PostOffice(8080, 8000);
	} catch(Exception e) {
	_postOffice = new PostOffice(); 
	}

	
	_world = new World(_postOffice, _camera);
	_world.lockUpdateRate(50);
}

void draw() {
	_camera.draw();
}