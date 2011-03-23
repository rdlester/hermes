abstract class Being {
	
	double getX();
	double getY();
	double getZ();
	
	Shape getShape;
	
	List<Group> groups;
	Shape shape;
	
}

interface interactor<A,B> {
	
	boolean detect(A, B):
	void handle(A, B);
	
}

interface Optimizer<A,B> {
	
	public void detect(A body, Interactor i);
	
}

class World {

	registerInteraction(Group A, Group B, Interactor inter, Oprimizer optimizer) {}
	
	

}