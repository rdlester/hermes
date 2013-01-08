Hermes
======

Hermes is an experimental game engine/framework for [Processing](http://processing.org/). It was designed to make your life easier. If you're new to building games, are making a game for a game jam, are already familiar with Processing, or have an idea you'd like to quickly prototype for play and experimentation, Hermes is for you. Hermes thinks of a game as a universe, consisting of worlds, beings, and interactions. Each piece is an easy-to-use block to which you, the game creator, simply need to add the rules defining your game. Once you've provided these rules, Hermes will bring the various worlds you've defined to life with little to no extra input.

The library consists of two parts: Hermes (the engine), and Worlds (the part you design, using our framework). When designing games with Hermes, you'll define a World, consisting of Beings that inhabit the world and Interactions between them, then hand over the World to Hermes, which will bring the World to life. Worlds must be defined and written in a somewhat specific way, although there is still plenty of room for hacking. Our specification for Worlds has been defined in such a way that it mirrors the way we design and think about games at a low level, making it easy to translate your ideas into code. In addition, the animation/sprite sub-library can be used independent of the rest of the library, and offers a number of advanced features for building and controlling sprites (see the Animation tutorial for more details).

If you have experience with other game design tools, you might think of Hermes as occupying a middle-ground - it doesn't hide code  like Game Maker or Stencyl, but it does take care of several essential functions (the game loop, separation of graphics & update threads, etc), and provides unique and helpful tools (user input, animations, physics). We've also worked to make our library easier to work with, understand, read, and comprehend than other game libraries we've worked with in the past (Cocos2D \**shakes fist*\*).

While it is incredibly easy to create prototypes and sketches in Hermes, the design philosophies making this possible come at the cost of high performance. Hermes is not meant for resources-intensive or performance-dependent games. It requires a substantial amount of overhead to get the engine running, although it scales smoothly; furthermore, the separation of the actual engine and game loop from the World specification written by the user makes it difficult to add game-specific optimizations. Of course, if these are your goals, you really shouldn't be using Processing anyways. We recommend use of something C++-based like [OpenFrameworks](http://www.openframeworks.cc/) instead.

Before getting started
----------------------

While Hermes is designed to be accessible to newcomers and professionals alike, you'll still need to understand the basics of programming, object-oriented design and Processing to get started. The best way to learn the basics on your own is to check out one of two books: Learning Processing (by Daniel Shiffman) or Getting Started With Processing (by Ben Fry and Casey Reas).

If you want a quicker way to learn, or aren't interested in buying books, take a look at the official Processing tutorials. To get started with Hermes, you should, at the least, read the Overview, Coordinate System + Shapes, Objects, and PVector tutorials. We also recommend reading the 2D transformations, Trig, and Anatomy of a Program tutorials, although they aren't strictly necessary. The video tutorials at [Plethora Project](http://www.plethora-project.com/2011/09/12/processing-tutorials/) are also worth checking out. You'll also need to understand how interfaces and inheritance work; take a look at [this Java tutorial](http://docs.oracle.com/javase/tutorial/java/IandI/index.html) to learn the basics of the two topics.

Finally, like the two books listed, we recommend laying out the structure of your program on paper before getting started, and building your program a single piece at a time. If possible, spend more time thinking about how your game should work than actually coding it. Trust us: it will save you a lot of frustration and time.

Installing Hermes
-----------------

To install Hermes, download [the zip distribution](http://github.com/paperkettle/hermes/Hermes.zip), then move the unzipped folder into the "libraries" folder of your Processing sketchbook. To import Hermes into a Processing sketch, select Sketch > Import Library > Hermes from the menu bar. However, we recommend using our template sketch to create new sketches with Hermes.

Example games
-------------

A number of simple game-prototypes/demos created with Hermes can be found in the `examples` folder. `BulletCurtain`, by Chris Novello, is a `circuit-bendable` version of Space Invaders designed for use with the [Illucia](http://illucia.com) system. `Level0`, by Ryan Lester and Jennifer Kovnats, is a prototype level designer (inspired by Marble Run) developed in a day exploring the use of arbitrary gravity fields. `bouncingpolygonsdemo` is a simple demo of the physics system. `PlatformExplorer` is a simple platformer demo of the animation system.

Tutorial
========

The following tutorial lays out the basics of using Hermes through a series of 4 examples, each of which iterates on the previous one. It should be enough to get you up and running with the framework. The completed examples can be found in the `examples` folder, named `tutorialA`, `tutorialB`, `tutorialC`, and `tutorialD`.

A number of advanced topics, such as Physics and Animation, are not covered; we're currently working on tutorials for both.

The Template
------------

The template sketch can be found in the examples folder of the library. When you want to create a new project, copy this sketch into your sketchbook, and rename the folder and the main file to the new name of your sketch. We also recommend renaming the other files to match your project specification.

The template consists of four files: `template`, `TemplateBeing`, `TemplateInteractor`, and `TemplateWorld`. The file 'template' looks like an ordinary Processing sketch file, with a `setup()` and `draw()` function. Let's get started by taking a look at this file.

	/**
	 * A template to get you started
	 * Define your beings, groups, interactors and worlds in separate tabs
	 * Put the pieces together in this top-level file!
	 */

	import hermes.*;
	import hermes.hshape.*;
	import hermes.animation.*;
	import hermes.physics.*;
	import hermes.postoffice.*;

	///////////////////////////////////////////////////
	// CONSTANTS
	///////////////////////////////////////////////////
	/**
	 * Constants should go up here
	 * Making more things constants makes them easier to adjust and play with!
	 */
	static final int WINDOW_WIDTH = 600;
	static final int WINDOW_HEIGHT = 600;
	static final int PORT_IN = 8080;
	static final int PORT_OUT = 8000; 

	World currentWorld;

	///////////////////////////////////////////////////
	// PAPPLET
	///////////////////////////////////////////////////

	void setup() {
	  size(WINDOW_WIDTH, WINDOW_HEIGHT); 
	  Hermes.setPApplet(this);

	  currentWorld = new TemplateWorld(PORT_IN, PORT_OUT);       

	  //Important: don't forget to add setup to TemplateWorld!

	  currentWorld.start(); // this should be the last line in setup() method
	}

	void draw() {
	  currentWorld.draw();
	}

At the very top, you'll notice that Hermes is already imported, meaning you don't have to worry about importing the library
into the sketch. Next, several constants are defined. The first two simply define the size of the sketch. The next two define
input and output ports, used for networking; we'll discuss Open Sound Control networking later in the `PostOffice` section.
Then, a World variable `currentWorld` is defined.

The `setup` function starts by calling size, as usual. Then, `Hermes.setPApplet(this);` is called; this call is required to give Hermes access to Processing's internals, allowing Hermes to operate at full power. Finally, a `TemplateWorld` is constructed, saved as `currentWorld`, and started. The draw function only has a single line: `world.draw()`. To understand what these two functions are doing, let's learn about the `World`.

World
-----

A `World` encapsulates a specific game state, or 'world'. Examples of `World`s might be game levels, mini-games, or menus. To define your own `World`, you simply need to define which beings and interactions should be created in the `World`. To bring the `World` to life, just construct the object and call `start()`.

Users can define their own `World`s by writing subclasses of `World` containing `setup()` functions. In the `setup()` function, the user instantiates the various objects that make up the `World`, and registers them with the `World`. When a `World` is started with a call to `start()`, Hermes will take over, handling the updating and interacting of all the various objects in the `World` with no extra input required from the user. These updates and interactions are, like Processing's draw loop, drawn on a cycle, running updates and checking for interactions a set number of times every second. This cycle runs independently of the draw loop in order to maximize performance. Finally, `world.draw()` syncs Procssing's draw loop with the World, and handles drawing the updated World based on the state of the `World`'s internal camera.

Let's take a look at `TemplateWorld` to see how `World`s are defined in detail.

	/**
	 * Template World
	 * You'll need to add stuff to setup().
	 */
	class TemplateWorld extends World {
	  TemplateWorld(int portIn, int portOut) {
	    super(portIn, portOut);
	  }

	  void setup() {
	    //IMPORTANT: put all other setup here
	  }
	}

First, note that `TemplateWorld extends World`; this means `TemplateWorld` is a subclass of `World`.

Next, the `TemplateWorld` constructor simply passes on its parameters to super. `TemplateWorld` passes the ports given to the constructor on to the super constructor, enabling networking; however, if you want to leave networking off in your game, you don't have to pass the super constructor anything at all.

Finally, the class contains a blank `setup` function; this is the part you need to fill in. However, we don't yet have anything to create in our `World`! Let's now look at creating a Being and adding it to the `World`.

Being
-----

`Being`s are the spatial inhabitants of the `World`. Anything with a size, a shape, and a location is a `Being`. For example, a platformer game would consist of the following `Being`s: the player's character, platforms, enemies, and items. `Being`s can also be slightly more abstract; menu items, GUI elements, and squares on a game-board are also examples. As with `World`s, users can define their own `Being`s by creating subclasses of `Being`.

Let's take a look at `TemplateBeing`.

	/**
	 * Template being
	 */
	class TemplateBeing extends Being {
	  TemplateBeing(HShape shape) {
	    super(shape);
	    //Add your constructor info here
	  }

	  public void update() {
	    // Add update method here
	  }

	  public void draw() {
	    // Add your draw method here
	  }
	}

As in TemplateWorld, `TemplateBeing extends Being`; `TemplateBeing` is a subclass of `Being`.

Next, the constructor takes an `HShape` and passes it on to the super constructor. An `HShape` is just an object representing a shape. Shapes available for your use include `Rectangle`, `Circle`, and `Polygon`. `Being`s need `HShape`s to define both their spatial position and shape.

Finally, there are two blank functions: `update` and `draw`. `update` specifies an internal update specific to the `Being` and independent of external contexts that the `Being` should run on every update cycle. An example of an update would be a pacing behavior for an enemy. An example of something that isn't an update is a fight exchange between an enemy and a player. Finally, the draw function handles drawing the `Being`, and is called on every step of the draw loop. While you can use all the same Processing commands as usual to draw here as in the Processing draw function, there's one slight difference. A `Being`'s draw function defines the origin, (0,0), as the `Being`'s position, as set in its shape, instead of the top left corner of the PApplet. As long as you draw your `Being` around its position, Hermes will automatically draw the `Being` at the right location, even when the `Being` is moving.

A Simple World
--------------

Now that we've covered the two basic building blocks of Hermes, let's create something! The example we're about to create is available in the `tutorialA` folder, although we recommend following along and building it on your own. Start by duplicating the template folder. Rename it to `tutorialA`, and rename the file `template.pde` to `tutorialA.pde'. If you want, rename `TemplateWorld` to `TutorialWorld` and update the reference in `tutorial.pde` accordingly; if you don't want to rename it, just leave the main tutorial file alone.

Now that we're set up, let's get coding! Let's start with making a stupidly simple `World`, just to ensure every step and operation is clear. We're going to make a `Being` that has the shape of a square and changes its color on every update. This is something that is pretty simple to do in normal Processing, but will provide a base for more complicated `World`s that aren't as simple.

The first step is defining our `Being`. We're going to rewrite the `TemplateBeing` file to look like this:

	/**
 	* An immobile flashing square --- DANGEROUS 
 	*/
	class GlitchySquare extends Being {
  		static final int WIDTH = 50;
  		static final int HEIGHT = 50;
  		color _c;

  		GlitchySquare() {
    		super(new Rectangle(WINDOW_WIDTH / 2, WINDOW_HEIGHT / 2, WIDTH, HEIGHT));
    		pickColor();
    		//Add your constructor info here
  		}
		
  		public void update() {
    		pickColor();
  		}
		
  		public void draw() {
    		fill(_c);
			noStroke();
    		_shape.draw();
  		}

  		private void pickColor() {
    		_c = color(int(random(256)), int(random(256)), int(random(256)));
  		}
	}

We have renamed our `TemplateBeing` to `GlitchySquare` to reflect its new identity. The above code defines a rectangular Being that picks a color every update, and appears as a square with color determined by pickColor. How does it work?

First, we define some constants to specify the size of our `Being`. Next, we introduce an instance variable, `_c`, that defines the square's color. In the `Being`'s constructor, we create a new `Rectangle`, with x and y set to the middle of the screen and width and height defined by our constants. The syntax for creating a `Rectangle` is the same as for Processing's `rect` command; you can even change the specifics of the syntax using Processing's `rectMode` command, as usual. Then, we set `_c` to the results of `pickColor()`, which, at the bottom of the file, picks a color at random.

Updates simply pick a new color for the `Being`, in the same way color was picked in the constructor.

In `draw`, we start by defining the draw style (setting fill to `_c` and removing the stroke border from our square), then calling `_shape.draw()`. `_shape` is how we access our Being's internal shape from inside the Being; `getShape()` can also be used, and can also be used to access the shape from outside the Being. Calling `draw` on our shape is shorthand for drawing the internal shape on screen, useful for debugging when Beings have more complex draw functions. Here, since our shape is a rectangle, `_shape.draw()` is equivalent to `rect(0, 0, WIDTH, HEIGHT)`. Note that, since the origin is already defined to be our Being's position inside the draw function, the position of rect is just (0,0). Also note that we have defined the shape's drawn style in the same way we would define style in a standard Processing sketch.

Now we need to instantiate our `Being` inside the `World`. Switch to `TemplateWorld`, and in `setup()`, add the line `register(new GlitchySquare())`. That's it.

Now run your sketch. Note that you'll either have to change the references to `TemplateBeing` in `TemplateInteractor` to the new name or delete the `Interactor` entirely for now in order to run without errors. There we go! There should be a spazzy lil' square flipping out right in the center of the screen.

Let's make things a little more interesting. If we pass in x and y parameters to our square, we can give it an arbitrary position. We'll change the constructor function to:

	GlitchySquare(int x, int y) {
    	super(new Rectangle(x, y, WIDTH, HEIGHT));
	}

Now, in TemplateWorld, give the GlitchySquare whatever position you want. Hit run, and the square will appear there. Now, let's get fancy and make lots of squares. Make a new static final variable at the top of the World class named `SQAURE_NUM`; set this number to whatever number catches your fancy. Now, change the `setup()` function to:

	void setup() {
    	for (int i = 0; i < SQUARE_NUM; i++) {
      		int x = (int) random(WINDOW_WIDTH - 50);
      		int y = (int) random(WINDOW_HEIGHT - 50);
      		registerBeing(new GlitchySquare(x, y));
		}
	}

Now hit run. We've got lots of little squares, randomly positioned, flashing away! Last (but not least), let's make our squares move a little. Let's make them "drunk walk". On each update, we'll change a square's x-position by some amount between, say, -10 and 10. To start, add a constant value (another `static final int` variable) `SHAKE_STEP` to the class, and choose a number for it (we recommend 10). Then, in update, add the line:

	_position.x += round(random(SHAKE_STEP * 2)) - SHAKE_STEP;

What is `_position`? Like `_shape`, `_position` stores the Being's position, the origin for the draw function. Position is stored as a 2-dimensional PVector (the z-value is simply ignored). If you haven't already, take a look at the [Processing vector tutorial](http://processing.org/learning/pvector/) to learn more.

Now hit run. Now our squares are drunkenly stumbling back and forth across the screen, but they're also leaving behind multi-colored trails as the sketch canvas isn't getting reset with a `background` command every draw cycle. While we could fix this by adding `background(0);` into the main draw loop before `currentWorld.draw();`, this isn't the most extensible of solutions; what if we want to switch from a trail-less World to a trailed World in the middle of a game? What if we want to apply heavier effects to specific Worlds, like pixel-level blur? What if we want to change the background? Luckily, we can override the World's draw function to define our own draw function, adding top-level draw commands onto the standard routine of drawing Beings. In `TemplateWorld`, let's add the lines:

	void draw() {
    	background(0);
    	super.draw();
	}

There we go! The first line resets the canvas, and the second line draws the Beings as usual. Hit run to see the results.

Groups
------

While we now know how to update and draw individual Beings, independent of one another, what if we want to synchronize some behavior across an entire group of Beings? Hermes provides a simple solution: `Group`s. Groups allow us to define a particular set of Beings or objects as a single entity we can update like Beings or interact with other Groups or individual Beings. At their core, `Group`s are similar to `ArrayList`s or other data structures; you can add to, remove from, and access the contained `Being`s. However, `Group`s can also have updates and interactions.

Let's modify `tutorialA` to use a `Group` update to see how they work (the finished code can be found in `tutorialB`). In our new example, the color of the squares will still be chosen at random, but on every step every square will share the same color. The following example is found in the `tutorialAgrouped` folder. First, we're going to need to make a few changes to our squares in preparation. Comment out the line `_c = pickColor();` from `GlitchySquare`'s `update` function. Then, add a new function:

	public void setColor(color c) {
		_c = c;
	}

This is the function our Group will use to set the color of the individual Squares.

Now, create a new file by clicking the arrow at the right of the tab bar in Processing, and selecting "New Tab". Name the tab "GlitchyGroup". Now, write the following code:

	/**
	 * Synchronizes the color of the GlitchySquares
	 */
	class GlitchyGroup extends Group<GlitchySquare> {
  
	  GlitchyGroup(World w) {
	    super(w);
	  }
  
	  public void update() {
	    color c = pickColor();
	    for (GlitchySquare s : getObjects()) {
	      s.setColor(c);
	    }
	  }
  
	  private color pickColor() {
	    return color(int(random(256)), int(random(256)), int(random(256)));
	  }
	  
	  public void addSquare() {
	    int x = (int) random(WINDOW_WIDTH - 50);
	    int y = (int) random(WINDOW_HEIGHT - 50);
	    GlitchySquare s = new GlitchySquare(x, y);
	    _world.register(s);
	    add(s);
	  }
	}

This is a basic Group. Again, our new `GlitchyGroup` is a subclass of `Group`; but what is `<GlitchySquare>` doing there? This part defines the type of `Being`s that will go into the `Group`. Since our Group will have `GlitchySquare`s and only `GlitchySquare`s, we put `GlitchySquares` between the brackets to tell the Group to expect these Squares. If we had a Group consisting of all kinds of different `Being`s, we'd just write `Being`.  For those of you who have worked with ArrayLists or other Java collections before, this behaves the same as it does there.

Our constructor takes a World and passes it to the super. This is required for the Group to function.

Now, we get to the interesting stuff. In `update`, we start by picking a color, then iterate through the objects in the group and set their color to our newly chosen one. Below, `pickColor` is simply a copy of `pickColor` in `GlitchySquare`.

The last function, `addSquare`, is responsible for adding `GlitchySquare`s to the group. This code is largely the same as the `World` `setup` function of the first example, with a few slight modifications. `_world` is a reference to the `World` the `Group` belongs to, passed in to the constructor. Since this code is no longer within a `World`, we have to call `_world.register()` instead of just `register`. Similarly, `g.add(s)` now becomes `g.add()`.

Why move this code from the `World` into the `Group`? It's good design. Keeping the `addSquare` function around makes it easy to create new squares after the game has started. Additionally, if you require two `Group`s of the same `GlitchySquare`s to behave differently, you can simply write two different kinds of `Group` subclasses and alter the `update` and `addSquare` functions to specify the different behaviors. In this case, the class `GlitchySquare` will simply contain all the possible functionality and behavior a Square can potentially exhibit and use. Separating the `Being`'s functionality from the `Group`'s behavior makes it easier to add more `Group`s and add new behaviors.

So, how do we get our Squares into the `Group`? We'll have to make a few changes to the `setup` of our `World`. It should now look like:

	void setup() {
	    GlitchyGroup g = new GlitchyGroup(this);
	    register(g);
    
	    for (int i = 0; i < SQUARE_NUM; i++) {
	      g.addSquare();
		}
	}

We first construct the `Group`, passing it `this` to provide it with a reference to the containing `World`, then register it with the World. In the loop, we just call the `Group`'s `addSquare` function. Simple enough. Once you've made the changes, hit run. The squares should all be the same color, yet still move independently, creating a morphing blob of glitchiness in the PApplet.

Interactors
-----------

While `Being`s and `Group`s can handle many of a game's internal mechanics, your games will usually need different kinds of interactions between objects to create meaningful play. In Hermes, these interactions are handled by objects called `Interactor`s. These objects define both the conditions for interaction and the interaction itself. An example interaction would be to register a hit on the player when a player collides with an enemy. Here, the collision is the detection condition, and the application of the hit is the result of the interaction.

Defining an `Interactor` is simple. Let's take a look at `TemplateInteractor` to see how it works.

	/**
	 * Template interactor between a TemplateBeing and another TemplateBeing
	 * Don't forget to change TemplateBeing-s to
	 * the names of the Being-types you want to interact
	 */
	class TemplateInteractor extends Interactor<TemplateBeing, TemplateBeing> {
		TemplateInteractor() {
			super();
			//Add your constructor info here
		}

		boolean detect(TemplateBeing being1, TemplateBeing being2) {
			//Add your detect method here
			return true;
		}

		void handle(TemplateBeing being1, TemplateBeing being2) {
			//Add your handle method here
		}
	}

As usual, we define a new `Interactor` by creating a subclass of `Interactor`. Note that, like `Group`s, `Interactor`s have a type. However, this type, `<TemplateBeing, TemplateBeing>`, takes two class names! These two names define the types of Beings we want to interact. Here, because there is only one type of Being defined in the template, both type parameters are the same; however, this doesn't need to be (and often won't be) the case.

The constructor doesn't require any parameters, so there's not much to worry about here. (There are in fact two parameters that can be passed in to the constructor, but these both affect low-level workings of the Interaction, and it's very probable you won't ever need to worry about them)

`Interactor`s contain two functions: `detect` and `handle`. Both take two `Being`s (respectively of the types defined in the brackets). `detect` is the condition for interaction. If the condition is satisfied, `detect` should return `true`; otherwise, it returns `false`. If `detect` returns `true`, then `handle` is run, and interaction is executed.

To get a sense of how this works, let's return to our spastic squares and make them communicate with one another. When two `GlitchySquare`s overlap, let's draw a white border around them. The following example can be found in the folder `tutorialB`.

First, let's add more functionality to `GlitchySquare` to facilitate the interaction. Add an instance variable `boolean _stroke` to the class, then add the following method:

	public void drawStroke() {
        _stroke = true;
	}

Now, we're going to edit the `draw` function. Replace `noStroke();` with:

	if(_stroke) {
        strokeWidth(5);
        stroke(255);
	} else {
        noStroke();
	}

Finally, add the line `_stroke = false;` to `update`.

What did we just do? Normally, the square will behave as before, drawing no borders around itself on `draw`. However, if `drawStroke` is called during an interaction, the square will draw a white border around itself instead. `update` (which runs before interactions are detected and handled) resets the border state.

Now, let's create our `Interactor`. Rewrite the `TemplateInteractor` to:

	/**
	 * When two GlitchySquares overlap,
	 * draw a border around them
	 */
	class SquareInteractor extends Interactor<GlitchySquare, GlitchySquare> {
		SquareInteractor() {
			super();
		}

		void detect(GlitchySquare being1, GlitchySquare being2) {
			return being1.getShape().collide(being2.getShape());
		}

		void handle(GlitchySquare being1, GlitchySquare being2) {
			being1.drawStroke();
			being2.drawStroke();
		}
	}

In `detect`, we first get the shape of the first `Being`, using `getShape`, then `collide` it with the second `Being`'s shape. `collide` is another method common to `HShape`s, which checks if the two shapes collide or overlap with one another.

In `handle`, we tell both `Being`s to draw a border the next time they draw.

To put our `Interactor` into action, we still need to register it with the `World`. Luckily, this is done with a single line, which you should add at the end of the `World`'s `setup`:

	`register(g,g,new SquareInteractor());`
	
Recall that `g` is the `Group` of squares; this line tells the `World` to interact all squares in the `Group` with every other square. That's it. Hit run (but first change `SQUARE_NUM` to be something small so squares aren't colliding with one another all the time). It works!

In fact, you can code the same interaction with even less work. Since collision is such a common condition for interactions, we've provided a helper class, `Collider`, that you can use to get the same results with less work. Instead of extending `Interactor`, just extend `Collider`; then leave out the `detect` function entirely (as that is already handled by `Collider`) and write the `handle` method as usual. The results are the same, with less boilerplate code. The adjusted demo is available in `tutorialBcollider`.

The Post Office / User Input
----------------------------

While the topics we've covered so far allow you to create a fully self-sufficient universe that runs on its own, we still haven't discussed how to add one last essential ingredient to a game: interaction. Games need to provide the player a meaningful set of interactions they can use to alter the universe. In Hermes, user input and interaction is handled with the `PostOffice`, which manages interaction between the game World and the real world.

The PostOffice collects three types of messages. The first two are types familiar to anyone who's used a computer: mouse and keyboard. Tinsohe last type is OSC, which are messages sent over a network using the simple [Open Sound Control](http://opensoundcontrol.org/introduction-osc) protocol. For the purposes of this tutorial, we'll stick to mouse and keyboard messages. Then, once every update, the PostOffice dispatches all the messages it has collected on the World's signal. Your Beings can receive messages once they've "subscribed" to a message type.

Why do you need to use the PostOffice instead of using the standard Processing keyboard and mouse methods? First, using the PostOffice allows you to reliably detect all keyboard and mouse messages, even ones that happen simultaneously, something that is rather difficult to do in Processing. Second (and more importantly), the PostOffice synchronizes with the rest of the World, ensuring that input messages are always processed at the same time during an update of the World. This prevents non-deterministic behavior caused by input timing from occurring in your game. So: don't use standard Processing input handling or your game might do weird things!

With all this in mind, let's turn back to our demo World and make it interactive.

First, we need to subscribe our Squares to Key and Mouse messages. Add the following lines to the end of `addSquare` in `GlitchyGroup`:

	_world.subscribe(s, POCodes.Key.UP);
	_world.subscribe(s, POCodes.Key.RIGHT);
	_world.subscribe(s, POCodes.Key.DOWN);
	_world.subscribe(s, POCodes.Key.LEFT);
	_world.subscribe(s, POCodes.Button.LEFT);

The `subscribe` function in `World` will tell the PostOffice to subscribe an object to the specified type of message. The first argument is always the subscriber. The next arguments specify the messages the subscriber requires using values from `POCodes`. These values are a little like zip codes on an address: they nicely specify where the message was sent from. There are four categories of `POCodes`: `Key`, which denotes keyboard buttons; `Button`, which denotes buttons on a mouse (with the special value `NO` denoting mouse movements independent of buttons); `Click`, which denotes mouse actions such as `PRESSED`, `RELEASED`, and `DRAGGED`, and also includes `MOVED`, the action that occurs when the mouse is moved while no button is held down; and `OSC`, which contains default ports for networking. In addition to specifying subscriptions, `POCodes` are also used to check and compare messages, which is needed when something is subscribed to multiple addresses.

In the above example, the first four lines subscribes our Square (`s`) to the four arrow keys, using the `UP`, `RIGHT`, `DOWN`, and `LEFT` codes from `POCodes.Key`. The last line subscribes the Square to messages from the left mouse button, using the code `LEFT` from `POCodes.LEFT`.

 The first four lines of the example subscribe the Square to messages sent by the arrow keys on the Keyboard. The last line subscribes the Square to messages sent by left clicks on the Mouse. However, we don't want our Square to be notified of every left mouse click; the Square only needs to know when it is clicked on itself. We can ask the PostOffice to send location-dependent Mouse messages by altering this last line to:

	_world.subscribe(s, POConstants.Button.LEFT, s.getShape());

Now, the PostOffice will only notify the subscribing Square of left button clicks when the click happens on it.

Now that the PostOffice is sending messages to the Squares, we need to tell the Squares what to do with the messages. Start by adding `_up`, `_right`, `_down`, and `_left` boolean variables to `GlitchySquare`, and set them all to `false` in the constructor. Now, add the following code to `GlichySquare`:

	public void receive(KeyMessage m) {
	  int code = m.getKeyCode();
	  if (m.isPressed()) {
	    if (code == POCodes.Key.UP) {
	      _up = true;
	    } 
	    else if (code == POCodes.Key.RIGHT) {
	      _right = true;
	    } 
	    else if (code == POCodes.Key.DOWN) {
	      _down = true;
	    } 
	    else if (code == POCodes.Key.LEFT) {
	      _left = true;
	    }
	  } 
	  else {
	    if (code == POCodes.Key.UP) {
	      _up = false;
	    } 
	    else if (code == POCodes.Key.RIGHT) {
	      _right = false;
	    } 
	    else if (code == POCodes.Key.DOWN) {
	      _down = false;
	    } 
	    else if (code == POCodes.Key.LEFT) {
	      _left = false;
	    }
	  }
	}

	public void receive(MouseMessage m) {
	  if (m.getAction() == POCodes.Click.PRESSED) {
	    currentWorld.delete(this);
	  }
	}

Subscribers receive messages through `receive` methods; all message handling should go in these. Each `receive` method handles one type of message: a KeyMessage, a MouseMessage, a MouseWheelMessage, or an OscMessage. This type is specified by the type of the parameter given as an argument to `receive`. Above, the first `receive` function handles KeyMessages and the second handles MouseMessages.

In the KeyMessage handler, we start by obtaining the code of the key responsible for the message with `getKeyCode`. Then, if the message is telling us the key is now pressed (found using `isPressed`), we set the corresponding direction boolean to `true`; otherwise, we set it to `false`.

In the MouseMessage handler, we simply delete the Square from the World using `delete` if it is clicked on. First, we check that the mouse is being pressed down on the Square using `getAction`. The `delete` function then removes the Square from all registered Groups, unschedules its updates, and unsubscribes the Square from the PostOffice. Note that we do not need to check the mouse button since we have only subscribed to a single button and only have a single action that will occur when the mouse interacts with the Square. If we wanted to ensure that deletion only occurs on left button clicks, we can check the button sending the message using `getButton`. Also note that we do not need to check if the mouse is inside the square, since we registered the Square's shape and location with the PostOffice when we subscribed. We could use the functions `getX`, `getY` or `getPosition` to check this, however.

Finally, we need to add the key-controlled movement code to `update`. The function should now look like:

	public void update() {
	  if (_up) {
	    _position.y -= SHAKE_STEP;
	  } 
	  if (_right) {
	    _position.x += SHAKE_STEP;
	  } 
	  if (_down) {
	    _position.y += SHAKE_STEP;
	  } 
	  if (_left) {
	    _position.x -= SHAKE_STEP;
	  }
	  _stroke = false;
	}

The new code adds and substracts a constant step-size from the Square's position on every update given the keys currently held down.

Now hit run and experiment with moving and destroying Squares!

While there's some pleasure in destroying Squares, any act of destruction should be met with an act of creation. So, let's add a way to create Squares. Add the following code to `GlitchyGroup`:

	public void receive(KeyMessage m) {
	  if (m.isPressed()) {
	    addSquare();
	  }
	}

Now, in the World's `setup`, add the line:

	subscribe(g, POCodes.Key.A);

Groups, like Beings, can also subscribe to and receive messages from the PostOffice. Here, we're simply leveraging the `addSquare` method we've already written to create a new Square every time the Group receives a key-pressed message from the `A` key. Hit run and tap the `A` key a few times to see the new code at work. 