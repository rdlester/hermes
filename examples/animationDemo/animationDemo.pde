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
class Walker extends Being {

  AnimatedSprite _sprite;	
  
  Walker(PVector position, PVector velocity) {
    super(new Rectangle(position, new PVector(200,200), CORNER), velocity);
    _sprite = new AnimatedSprite();
    int animIndex = _sprite.addAnimation(new Animation("skeilert_walk_final", 1, 24, ".png", (int)(1000.0f / 24.0f)));
    _sprite.setActiveAnimation(animIndex);
  }
	
  public void draw() {
    image(_sprite.animate(), 0, 0);
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
/*class MyInteraction implements Interactor<MyBeing,MyBeing> {
	MyInteraction() {
		//Add your constructor info here
	}
	
	boolean detect(MyBeing being1, MyBeing being2) {
		//Add your detect method here
	}
	
	boolean handle(MyBeing being1, MyBeing being2) {
		//Add your handle method here
	}
}*/

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

        Walker character = new Walker(new PVector(0,0), new PVector(0,0));	
        _world.registerBeing(character, false);

	_world.lockUpdateRate(50);
}

void draw() {
	_camera.draw();
}
