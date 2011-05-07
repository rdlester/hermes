/*
* This version has the "slingshot" look and a bounding box internal collisions
*
*/

//import src.template.library.*;
import src.hermes.*;
import src.hermesTest.physicsTest.*;
import src.hermesTest.postOfficeTests.*;
import src.hermes.shape.*;
import src.hermes.animation.*;
import src.hermesTest.shapeTests.*;
import src.hermesTest.core.*;
import src.hermes.physics.*;
import src.hermes.postoffice.*;
import java.util.Random;

World _world;
PostOffice _postOffice;
Camera _camera;

BallGroup _ballGroup;
BoxGroup _boxGroup;

  boolean _mousePressed;
  float _origX, _origY;
  float _dX, _dY;

final int WIDTH = 400;
final int HEIGHT = 400;

static final int POLY_POINT = 4;

int mode = 0;
static final int POLY_MODE = 0;
static final int POLY_KEY = PostOffice.VK_0;
static final int CIRCLE_MODE = 1;
static final int CIRCLE_KEY = PostOffice.VK_1;
static final int RECT_MODE = 2;
static final int RECT_KEY = PostOffice.VK_2;
static final int DELETE_KEY = PostOffice.D;

void setup() {
  size(WIDTH, HEIGHT); 
  Hermes.setPApplet(this);
 
  _camera = new Camera();
  try {
   _postOffice = new PostOffice(8080, 8000);
  } catch(Exception e) {
   _postOffice = new PostOffice(); 
  }
  _world = new World(_postOffice, _camera);
  _world.lockUpdateRate(50);
 
  _ballGroup = new BallGroup(_world);
	_postOffice.registerKeySubscription(_ballGroup, POLY_KEY);
	_postOffice.registerKeySubscription(_ballGroup, CIRCLE_KEY);
	_postOffice.registerKeySubscription(_ballGroup, RECT_KEY);
	_postOffice.registerKeySubscription(_ballGroup, DELETE_KEY);
  _postOffice.registerMouseSubscription(_ballGroup, PostOffice.LEFT_BUTTON);
  _postOffice.registerOscSubscription(_ballGroup, "/BouncingBalls/SetElasticity");
  _postOffice.registerOscSubscription(_ballGroup, "/BouncingBalls/SetMass");
  
  _boxGroup = new BoxGroup(_world);
  
  _world.registerInteraction(_ballGroup, _ballGroup, new MassedCollider(), false);
  _world.registerInteraction(_boxGroup, _ballGroup, new InsideMassedCollider(), false);

  smooth();

  _world.start(); // gets the World thread running
}


void draw() {
    background(230);
		
    if(_mousePressed) {
     line(_origX, _origY, _dX, _dY); 
    }
    
    _camera.draw(); // Camera object handles drawing all the appropriate Beings

}

class BoxGroup extends Group<Box> {
 
  BoxGroup(World world) {
    super(world);
    Box boite = new Box();
    getWorld().registerBeing(boite, true);
    this.add(boite);
  }
  
}

class BallGroup extends Group<Ball> {
  
  float _newMass = 1;
  float _newElasticity = 1;
  
  BallGroup(World world) {
   super(world); 
   _mousePressed = false;
  }

	void handleKeyMessage(KeyMessage m) {
		int key = m.getKeyCode();
		switch(key) {
			case POLY_KEY:
				mode = POLY_MODE;
				break;
			case CIRCLE_KEY:
				mode = CIRCLE_MODE;
				break;
			case RECT_KEY:
				mode = RECT_MODE;
				break;
			case DELETE_KEY:
				destroy();
				break;
		}
	}

	void handleMouseMessage(MouseMessage m) {
		int action = m.getAction();
		switch(action) {
			case PostOffice.MOUSE_PRESSED:
				if(!_mousePressed) {
					_mousePressed = true;
					_origX = m.getX();
					_origY = m.getY();
					_dX = m.getX();
					_dY = m.getY();
				}
				break;
			case PostOffice.MOUSE_DRAGGED:
				_dX = m.getX();
				_dY = m.getY();
				break;
			case PostOffice.MOUSE_RELEASED:
				_mousePressed = false;
				Ball ball;
				switch(mode) {
					case POLY_MODE:
						ball = new PolyBall(new PVector(_origX, _origY), new PVector(_origX-_dX, _origY-_dY), _newMass, _newElasticity);
						break;
					case CIRCLE_MODE:
						ball = new CircleBall(new PVector(_origX, _origY), new PVector(_origX-_dX, _origY-_dY), _newMass, _newElasticity);
						break;
					case RECT_MODE:
						ball = new RectBall(new PVector(_origX, _origY), new PVector(_origX-_dX, _origY-_dY), _newMass, _newElasticity);
						break;
					default:
						System.out.println("In an invalid mode");
						ball = new CircleBall(new PVector(_origX, _origY), new PVector(_origX-_dX, _origY-_dY), _newMass, _newElasticity);
						break;
				}
				getWorld().registerBeing(ball, true);
				this.add(ball);
				break;
		}
	}
   
   void handleOscMessage(OscMessage m) {
     
     String[] messages = m.getAddress().split("/");
     
     if(messages[1].equals("BouncingBalls")) {
       
       if(messages[2].equals("SetMass")) {
         _newMass = constrain(m.getAndRemoveFloat(), 0, 1);
       }
       else if(messages[2].equals("SetElasticity")) {
         _newElasticity = constrain(m.getAndRemoveFloat(), 0, 1);
       }
       
     }
     
   }
  
}

abstract class Ball extends MultisampledMassedBeing {
	
	Group _group;
  color _color;

	Ball(Shape shape, PVector velocity, float mass, float elasticity) {
		super(shape, velocity, mass, elasticity, 35, 8);
		_color = color(random(255), random(255), random(255));
	}
	
	void update() {
    if(getX() < 0)
      setX(0);
    if(getY() < 0)
      setY(0);
    if(getX() > (float)WIDTH)
      setX((float)WIDTH);
    if(getY() > (float)HEIGHT)
      setY((float)HEIGHT);
  }

	void draw() {
		fill(_color);
		getShape().draw();
	}
}

class PolyBall extends Ball {
  PolyBall(PVector center, PVector velocity, float mass, float elasticity) {
    super(makePolygon(center,mass), velocity, mass, elasticity);
  }
}

static Polygon makePolygon(PVector center, float mass) {
	float radius = 25 * mass;
	ArrayList<PVector> points = new ArrayList<PVector>();
	//Random r = new Random();
	//for(int i = 0; i < POLY_POINT; i++) {
	//	float nextX = r.nextFloat();
	//	nextX = (nextX * 2 * radius) - radius;
	//	float nextY = r.nextFloat();
	//	nextY = (nextY * 2 * radius) - radius;
	//	points.add(new PVector(nextX, nextY));
	//}
	points.add(new PVector(0,radius));
	points.add(new PVector(radius,0));
	points.add(new PVector(0,-radius));
	points.add(new PVector(-radius,0));
	return new Polygon(center,points);
}

class CircleBall extends Ball {
	CircleBall(PVector center, PVector velocity, float mass, float elasticity) {
		super(new Circle(center, 25 * mass), velocity, mass, elasticity);
	}
}

class RectBall extends Ball {
	RectBall(PVector center, PVector velocity, float mass, float elasticity) {
		super(new Rectangle(center, 25 * mass, 25 * mass), velocity, mass, elasticity);
	}
}

class Box extends MassedBeing {
  
  Box() {
   super(new Rectangle(new PVector(0,0), new PVector(0,0), new PVector((float)WIDTH,(float)HEIGHT)), new PVector(0,0), Float.POSITIVE_INFINITY, 1); 
  }
  
  void draw() {}
  
}

