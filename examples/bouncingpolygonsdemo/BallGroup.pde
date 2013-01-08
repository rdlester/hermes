/**
 * Holds and keeps track of balls
 * Handles messages and the creation of new balls
 */
class BallGroup extends Group<Ball> {
  
  //Used in creating balls, updated via OSC
  float _newMass = 1;
  float _newElasticity = 1;
  
  BallGroup(World world) {
   super(world); 
   _mousePressed = false;
  }

  //Updates ball creation mode depending on key press
	void receive(KeyMessage m) {
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

  //Handles mouse messages for line drawing and ball creation
	void receive(MouseMessage m) {
		POCodes.Click action = m.getAction();
		switch(action) {
			case PRESSED: //Register mouse press and initialize variables
				if(!_mousePressed) {
					_mousePressed = true;
					_origX = m.getX();
					_origY = m.getY();
					_dX = m.getX();
					_dY = m.getY();
				}
				break;
			case DRAGGED: //Update mouse location
				_dX = m.getX();
				_dY = m.getY();
				break;
			case RELEASED: //Deregister mouse press and create new ball
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
				getWorld().register(ball);
				this.add(ball);
				break;
		}
	}
  
  //Updates variables influencing ball creation
	void receive(OscMessage m) {
		String[] messages = m.getAddress().split("/");
		if(messages[1].equals("BouncingBalls")) {
			if(messages[2].equals("SetMass")) {
				_newMass = constrain(m.getAndRemoveFloat(), 0, 1);
			}
			else if(messages[2].equals("SetElasticity")) {
				_newElasticity = constrain(m.getAndRemoveFloat(), 0, 1);
			}
			else if(messages[2].equals("SetSides")) {
				polyPoint = (int) m.getAndRemoveInt();
			}
			else if(messages[2].equals("SetRotate")) {
			  polyRot = constrain(m.getAndRemoveFloat(), 0, 2*PI);
			} 
    }
  }
}
