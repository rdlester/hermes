///////////////////////////////////////////////////
// TOOLS (ACCESSABLE TO SELF)
// Contains all Tool classes
///////////////////////////////////////////////////
 
/**
 * Contains basic logic of a tool
 */
abstract class Tool extends MassedBeing {
  int _toolCode;
  double _totalRotation=0;
  
  Tool(HShape shp, PVector velocity, float mass, float elasticity, int toolCode) {
    super(shp, velocity, mass, elasticity); 
    _toolCode = toolCode;
    world.register(this, true);
    world.addToGroup(this, toolGroup);
  }

  int getToolCode() {return _toolCode;}
  
  void receive(MouseMessage m) {
   //note:assumes clicked in own cell 
   selectedTool = this;
  }
  
  void rotate(double theta) {_totalRotation = (_totalRotation + theta)%(PI*2);}
  double getRotation() {return _totalRotation;}
  
  void draw() {
    //check if is templateTool -- draw a halo around it
    if(templateTool==this) {
      noFill();
      strokeWeight(3);
      stroke(255, 150, 193);
      rect(-cellSideLength/2, -cellSideLength/2, cellSideLength, cellSideLength);
    }
    
    //check if is selectedTool
    if(selectedTool==this) {
      noFill();
      strokeWeight(3);
      stroke(253, 253, 44);
      rect(-cellSideLength/2, -cellSideLength/2, cellSideLength, cellSideLength);
    }
    
    //switch over elasticity
    if (getElasticity()==SPRINGY) {
      noFill();
      stroke(255);
      strokeWeight(2);      
    } else if(getElasticity()==PERFECT) {
      fill(0);
      stroke(255);
      strokeWeight(2);
    } else if(getElasticity()==STICKY) {
      fill(0);
      noStroke();
    }    
  }
}

/**
 * Handles key messages changing the elasticity of a tool
 */
class SelectedToolAttributeSwitcher implements KeySubscriber {
  boolean epressed = false, wpressed = false;
  
  void receive(KeyMessage m) {
    if(selectedTool!=null) {
      if (!m.isPressed()) {
        if (m.getKeyChar()=='e') {
          epressed = false;
        } else if (m.getKeyChar()=='w') {
          wpressed = false;
        }
      }
      else if (m.getKeyChar()=='e' && !epressed) {      //if 'e', change elasticity
        epressed = true;
        float elasticity = selectedTool.getElasticity();
        if (elasticity==SPRINGY) {
          selectedTool.setElasticity(STICKY);             
        } else if (elasticity==PERFECT) {
          selectedTool.setElasticity(SPRINGY);
        } else if (elasticity==STICKY) {
          selectedTool.setElasticity(PERFECT);
        }
      } else if (m.getKeyChar()=='w' && !wpressed) {     //if 'w', rotate by PI/2
        wpressed = true;
        selectedTool.rotate(PI/4);
      }
    }
  }  
}

/**
 * Factory method for creating a new tool
 */
//position is always CENTER
Tool makeTool(int toolCode, PVector position, double theta, float elasticity) {
   Tool toReturn = null;
   switch(toolCode) {
     case QUADRANGLE: toReturn = new Quadrangle(position, theta, elasticity); 
                      break;
     case TRIANGLE:   toReturn = new Triangle(position, theta, elasticity);
                      break;
     case HEXAGON:    toReturn = new Hexagon(position, theta, elasticity);
                      break;
     case CIRCLETOOL: toReturn = new HCircleTool(position, theta, elasticity);
                      break;
     case WEDGE:      toReturn = new Wedge(position, theta, elasticity);
                      break;
     default:         println("Error in makeTool: toolCode did not match any tools");
                      break;   
   } 
   return toReturn; 
}

/**
 * Dimond-shaped tool
 */
class Quadrangle extends Tool {
 
  Quadrangle(PVector center, double theta, float elasticity) {
   super(HPolygon.createRegularHPolygon(center, 4, cellSideLength/2),
         new PVector(0, 0), Float.POSITIVE_INFINITY, elasticity, QUADRANGLE);
   this.rotate(theta);
  } 
 
  void rotate(double theta) {
    super.rotate(theta);
   ((HPolygon)this.getShape()).rotate(theta);
  } 
  
  void draw() {
    super.draw();
    getShape().draw();
    /*if(getElasticity() == STICKY) {
      HPolygon p = (HPolygon) getShape();
      drawCilia(p);
    }*/
  }

}

/**
 * Triangular tool
 */
class Triangle extends Tool {
  boolean _expanded = false;
  int _timeOfLastClick = -1;
  boolean _doubleClick = false;
  
 Triangle(PVector center, double theta, float elasticity) {
   super(HPolygon.createRegularHPolygon(center, 3, cellSideLength/2),
         new PVector(0, 0), Float.POSITIVE_INFINITY, elasticity, TRIANGLE);
   this.rotate(theta);
 }

 void rotate(double theta) {
   super.rotate(theta);
   ((HPolygon)this.getShape()).rotate(theta);
 } 
 
 void draw() {
  super.draw();
  getShape().draw();
  /*if(getElasticity() == STICKY) {
    HPolygon p = (HPolygon) getShape();
    drawCilia(p);
  }*/
  //TODO: add handle
 }  
}

/**
 * Hexagonal tool
 */
class Hexagon extends Tool {
 
  Hexagon(PVector center, double theta, float elasticity) {
   super(HPolygon.createRegularHPolygon(center, 6, cellSideLength/2),
         new PVector(0, 0), Float.POSITIVE_INFINITY, elasticity, HEXAGON);
   this.rotate(theta);
  } 
 
  void rotate(double theta) {
   super.rotate(theta);
   ((HPolygon)this.getShape()).rotate(theta);
  } 
  
  void draw() {
    super.draw();
    getShape().draw();
    /*if(getElasticity() == STICKY) {
      HPolygon p = (HPolygon) getShape();
      drawCilia(p);
    }*/
  }

}

/**
 * Circular tool
 */
class HCircleTool extends Tool {
 
  HCircleTool(PVector center, double theta, float elasticity) {
   super(new HCircle(center, cellSideLength/2),
         new PVector(0, 0), Float.POSITIVE_INFINITY, elasticity, CIRCLETOOL);
  } 
  
  void draw() {
    super.draw();
    pushMatrix();
    getShape().draw();
    popMatrix();
    /*if(getElasticity() == STICKY) {
      stroke(0);
      HCircle c = (HCircle) getShape();
      float r = c.getRadius();
      PVector initDir = new PVector(0,1); //Set the initial direction for silia
      initDir.mult(r); // Multiply it out to the edge of the circle
      float rot = 2*PI / ciliaNum;
      float rotCounter = 0;
      for(int i = 0; i < ciliaNum; i++) {
        //Rotate and draw a small line at the edge of the circle
        HermesMath.rotate(initDir,rot);
        rotCounter += rot;
        line(initDir.x,initDir.y,initDir.x+(csize * cos(rotCounter)),initDir.y+(csize * sin(rotCounter)));
      }
    }*/
  }
}

/**
 * Triangular tool, shaped like half of a square when cut down the diagonal
 */
class Wedge extends Tool {
  
  int _sector = 0;
  
  Wedge(PVector center, double theta, float elasticity) {
    super(generateWedge(center), new PVector(0,0), Float.POSITIVE_INFINITY, elasticity, WEDGE);
    this.rotate(theta);
  }
  
  void rotate(double theta) {
    super.rotate(theta);
    ((HPolygon) getShape()).rotate(theta);
    /*double rot = (_totalRotation + PI/4) % (2*PI);
    int sector = ((Double) (rot/(PI*2))).intValue();
    if(sector != _sector) {
      HPolygon p = (HPolygon) getShape();
      int alter = sector - _sector;
      p.rotate(PI/2 * alter);
    }*/
  }
  
  void draw() {
    super.draw();
    getShape().draw();
    /*if(getElasticity() == STICKY) {
      HPolygon p = (HPolygon) getShape();
      drawCilia(p);
    }*/
  }
}

/**
 * Factory method for generating wedge polygons
 * Required for super of wedge
 */
HPolygon generateWedge(PVector center) {
  ArrayList<PVector> points = new ArrayList<PVector>();
  points.add(new PVector(cellSideLength/2,cellSideLength/2));
  points.add(new PVector(-cellSideLength/2,cellSideLength/2));
  points.add(new PVector(-cellSideLength/2,-cellSideLength/2));
  return new HPolygon(center,points);
}

/**
 * Helper method for drawing cilia on sides of sticky objects
 * Currently not used
 */
void drawCilia(HPolygon p) {
  stroke(0);
  ArrayList<PVector> points = p.getPointsCopy();
  int psize = points.size();
  int ciliaPerSide = ciliaNum / psize;
  ArrayList<PVector> axes = p.getAxesCopy();
  PVector pre = points.get(0);
  for(int i = 1; i < psize + 1; i++) {
    pushMatrix();
    PVector curr = points.get(i % psize);
    translate(curr.x,curr.y);
    PVector dir = PVector.sub(pre, curr);
    float angle = HermesMath.angle(dir);
    rotate(angle);
    float dist = dir.mag() / ciliaPerSide;
    for(int j = 0; j < ciliaPerSide; j++) {
      translate(dist,0);
      line(0,0,0,csize);
    }
    popMatrix();
  }
}


