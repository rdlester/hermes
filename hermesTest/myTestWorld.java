package hermesTest;

import java.util.ArrayList;

import hermes.*;

public class myTestWorld extends World {

	myTestWorld() {
		super();
		ArrayList<myTestBeing> group = new ArrayList<myTestBeing>();
		group.add(new myTestBeing());
		registerInteraction(group, group, 
				new myTestInteractor(), true);
	}

	public static void main(String args[]) {
		myTestWorld world = new myTestWorld();
		world.run();
	}
	
}
