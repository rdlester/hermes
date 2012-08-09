/**
 * Template interactor between a MyBeing and another MyBeing
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
