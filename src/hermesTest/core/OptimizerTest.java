package src.hermesTest.core;

import java.util.Random;
import org.junit.*;

import processing.core.PApplet;
import static org.junit.Assert.*;

import src.hermes.*;
import src.hermes.postoffice.PostOffice;
import src.hermes.shape.*;

public class OptimizerTest {

	static class OptTestBeing extends Being {
		
		static Random r = new Random();
		
		int compares = 0;
		int handles = 0;
		
		OptTestBeing() {
			super(makeRect());
		}
		
		private static Rectangle makeRect() {
			float x = r.nextFloat() * 100;
			float y = r.nextFloat() * 100;
			return new Rectangle(x, y, 1, 1);
		}
		
	}
	
	class OptTestInter implements Interactor<OptTestBeing, OptTestBeing> {

		public boolean detect(OptTestBeing being1, OptTestBeing being2) {
			being1.compares++;
			being2.compares++;
			return true;
		}
		
		public boolean handle(OptTestBeing being1, OptTestBeing being2) {
			being1.handles++;
			being2.handles++;
			return true;
		}
		
	}
	
	class OptTestCollider extends Collider<OptTestBeing, OptTestBeing> {

		public boolean handle(OptTestBeing being1, OptTestBeing being2) {
			return true;
		}
		
	}
	
	@Test
	public void test_SelfInteractionOptimizer() {
		Hermes.setPApplet(new PApplet());
		World world = new World(new PostOffice(), new Camera());
		Group<OptTestBeing> group = new Group<OptTestBeing>(world);
		for(int i = 0; i < 100; i++) {
			group.add(new OptTestBeing());
		}
		world.update();
		world.registerInteraction(group, group, new OptTestInter(), false, 
				new SelfInteractionOptimizer<OptTestBeing>());
		world.update();
		for(OptTestBeing element : group.getObjects()) {
			assertEquals(element.compares, 99);
			assertEquals(element.handles, 99);
		}
	}
	
	@Test
	public void test_SelfInterOptPerformance() {
		World world = new World(new PostOffice(), new Camera());
		Group<OptTestBeing> group = new Group<OptTestBeing>(world);
		for(int i = 0; i < 10000; i++) {
			group.add(new OptTestBeing());
		}
		world.update();
		world.registerInteraction(group, group, new OptTestInter(), true);
		long time = System.nanoTime();
		world.update();
		long elapsed = System.nanoTime() - time;
		System.out.println("Time for 10000 unoptimized rectangle collisions: " + elapsed);
		
		world = new World(new PostOffice(), new Camera());
		group.setWorld(world);
		world.registerInteraction(group, group, new OptTestInter(), true,
				new SelfInteractionOptimizer<OptTestBeing>());
		time = System.nanoTime();
		world.update();
		elapsed = System.nanoTime() - time;
		System.out.println("Time for 10000 optimized rectangle collisions: " + elapsed);
	}
}
