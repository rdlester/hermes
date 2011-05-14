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
import static src.hermes.HermesMath.*;

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
class MyInteractor implements Interactor<MyBeing,MyBeing> {
	MyInteraction() {
		//Add your constructor info here
	}
	
	boolean detect(MyBeing being1, MyBeing being2) {
		//Add your detect method here
	}
	
	boolean handle(MyBeing being1, MyBeing being2) {
		//Add your handle method here
                return true;
	}
}

///////////////////////////////////////////////////
// PAPPLET
///////////////////////////////////////////////////

void setup() {
	size(WINDOW_WIDTH, WINDOW_HEIGHT); 
	Hermes.setPApplet(this);

	_camera = new Camera();
	_postOffice = new PostOffice(8080, 8000);
	_world = new World(_postOffice, _camera);

         //IMPORTANT: put all other setup here        

        _world.start(); // this should be the last line in setup() method
}

void draw() {
	_camera.draw();
}
