/**
 * Abstract class for balls, contains basic functionality
 * Only difference between type of balls is the type of shape used
 */
abstract class Ball extends MassedBeing {
	
	Group _group;
  color _color;

	Ball(HShape shape, PVector velocity, float mass, float elasticity) {
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

/**
 * Creates a polygonal ball
 * Uses factory method inside of Polygon to create the polygons
 */
class PolyBall extends Ball {
  PolyBall(PVector center, PVector velocity, float mass, float elasticity) {
    super(Polygon.createRegularPolygon(center,polyPoint,ballSize * mass), velocity, mass, elasticity);
    ((Polygon) getShape()).rotate(polyRot);
  }
}

/**
 * Creates a circular ball
 */
class CircleBall extends Ball {
	CircleBall(PVector center, PVector velocity, float mass, float elasticity) {
		super(new Circle(center, ballSize * mass), velocity, mass, elasticity);
	}
}

/**
 * Creates a square ball
 */
class RectBall extends Ball {
	RectBall(PVector center, PVector velocity, float mass, float elasticity) {
		super(new Rectangle(center, ballSize * mass, ballSize * mass), velocity, mass, elasticity);
	}
}
