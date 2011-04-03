package src.hermesTest.stupidTests;

import java.util.ArrayList;

import src.hermes.*;

public class myTestWorld extends World {

	myTestWorld() {
		super();
		ArrayList<myTestBeing> group = new ArrayList<myTestBeing>();
		ArrayList<myTestBeing> group2 = new ArrayList<myTestBeing>();
		group.add(new myTestBeing());
		group2.add(new myTestBeing());
		group2.add(new myTestBeing());
		registerInteraction(group, group2, 
				new myTestInteractor(), true);
	}

	public static void main(String args[]) {
		myTestWorld world = new myTestWorld();
		world.start();
	}

	@Override
	public void setup() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void cleanup() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void preUpdate() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void postUpdate() {
		// TODO Auto-generated method stub
		
	}
	
}
