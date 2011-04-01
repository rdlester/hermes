package hermesTest;

import hermes.*;

public class myTestInteractor implements Interactor<myTestBeing, myTestBeing> {

	@Override
	public boolean detect(myTestBeing being1, myTestBeing being2) {
		return being1.isTestBeing() && being2.isTestBeing();
	}

	@Override
	public void handle(myTestBeing being1, myTestBeing being2) {
		System.out.println("handling interaction between test beings");
	}

}
