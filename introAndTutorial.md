Hermes
======

Hermes is an experimental game engine/framework for Processing. It leverages the strengths of Object-Oriented Design and the simplicity of Processing to provide an architectural foundation for games and simulations, making it easy for you to give your ideas life. If you're new to building games, are making a game for a game jam, or have an idea you'd like to quickly prototype for play and experimentation, Hermes is for you. We think of Hermes as occupying a middle-ground between the 'no-code' approach of Stencyl and the intensity and specialization of large-scale libraries.

The library consists of two parts: Hermes (the engine), and Worlds (the part you design, using our framework). When designing games with Hermes, you'll define a World, consisting of Beings that inhabit the world and Interactions between them, then hand over the World to Hermes, which will bring the World to life. Worlds must be defined and written in a somewhat specific way, although there is still plenty of room for hacking. Our specification for Worlds has been defined in such a way that it mirrors the way we design and think about games at a low level, making it easy to translate your ideas into code. In addition, the animation/sprite sub-library can be used independent of the rest of the library, and offers a number of advanced features for building and controlling sprites (see the Animation tutorial for more details).

While it is incredibly easy to create prototypes and sketches in Hermes, the design philosophies making this possible come at the cost of high performance. Hermes is not meant for resources-intensive or performance-dependent games. It requires a substantial amount of overhead to get the engine running, although it scales smoothly; furthermore, the separation of the actual engine and game loop from the World specification written by the user makes it difficult to add game-specific optimizations. Of course, if these are your goals, you really shouldn't be using Processing anyways. We recommend use of something C++-based like OpenFrameworks instead.

Before getting started
----------------------

While Hermes is designed to be accessible to newcomers and professionals alike, you'll still need to understand the basics of programming, object-oriented design and Processing to get started. The best way to learn the basics on your own is to check out one of two books: Learning Processing (by Daniel Shiffman) or Getting Started With Processing (by Ben Fry and Casey Reas).

If you want a quicker way to learn, or aren't interested in buying books, take a look at the official Processing tutorials. To get started with Hermes, you should, at the least, read the Overview, Coordinate System + Shapes, Objects, and PVector tutorials. We also recommend reading the 2D transformations, Trig, and Anatomy of a Program tutorials, although they aren't strictly necessary. The video tutorials at Plethora Project are also worth checking out. You'll also need to understand how interfaces and inheritance work; take a look at [this Java tutorial](http://docs.oracle.com/javase/tutorial/java/IandI/index.html) to learn the basics of the two topics.

Finally, like the two books listed, we recommend laying out the structure of your program on paper before getting started, and building your program a single piece at a time. If possible, spend more time thinking about how your game should work than actually coding it. Trust us: it will save you a lot of frustration and time.

Installing Hermes
-----------------

To install Hermes, download [the zip distribution](http://github.com/paperkettle/hermes/Hermes.zip), then move the unzipped folder into the "libraries" folder of your Processing sketchbook. To import Hermes into a Processing sketch, select Sketch > Import Library > Hermes from the menu bar. However, we recommend using our template sketch to create new sketches with Hermes.

Tutorial
========

The Template
------------

The template sketch can be found in the examples folder of the library. When you want to create a new project, copy this sketch into your sketchbook, and rename the folder and the main file to the new name of your sketch. We also recommend renaming the other files to match your project specification.

The template consists of four files: template, TemplateBeing, TemplateInteractor, and TemplateWorld. The file 'template' looks like an ordinary Processing sketch file, with a setup() and draw() function. Let's get started by walking through this file, looking at what each line does. At the very top, you'll notice that Hermes is already imported, meaning you don't have to worry about importing the library into the sketch. You'll also notice two `import static` statements. These statements make it easy to access a number of helper functions and constants (which we'll discuss later), and while we recommend including them, they aren't strictly necessary. Next, several constants are defined. The first two simply define the size of the sketch. The next two define input and output ports, used for networking; we'll discuss OSC networking later in the PostOffice section. Then, a World variable `currentWorld` is defined.

The setup function starts by calling size, as usual. Then, `Hermes.setPApplet(this);` is called; this call is required to give Hermes access to Processing's internals, allowing Hermes to operate at full power. Finally, a `TemplateWorld` is constructed, saved as `currentWorld`, and started. The draw function only has a single line: `world.draw()`. To understand what these two functions are doing, let's learn about the World.

World
-----

A World encapsulates a specific game state, or 'world'. Examples of worlds might be game levels, mini-games, or menus. Users can define their own Worlds by writing subclasses of World containing `setup()` functions. In the `setup()` function, the user instantiates all the Beings, HObjects, and Interactions that make up the World, and registers them with the World. When a world is started with a call to `start()`, Hermes will take over, handling the updating and interacting of all the various objects in the World with no extra input required from the user. These updates and interactions are, like Processing's draw loop, drawn on a cycle, running updates and checking for interactions a set number of times every second. This cycle runs independently of the draw loop in order to maximize performance. Finally, `world.draw()` syncs Procssing's draw loop with the World, and handles drawing the updated World based on the state of the World's internal camera.

A template for defining your own World is found in TemplateWorld. Again, let's walk through the code line by line to understand what is required. First, note that `TemplateWorld extends World`; this means TemplateWorld is a subclass of World. Next, the TemplateWorld constructor simply passes on its parameters to super. TemplateWorld passes the ports given to the constructor on to the super constructor, enabling networking; however, if you want to leave networking off in your game, you don't have to pass the super constructor anything at all. Finally, the class contains a blank setup function; this is the part you need to fill in. However, we don't yet have anything to create in our World! Let's now look at creating a Being and adding it to the World.

Being
-----

Beings are the spatial inhabitants of the World. Anything with a size, a shape, and a location is a Being. For example, a platformer game would consist of the following Beings: the player's character, platforms, enemies, and items. Beings can also be slightly more abstract; menu items, GUI elements, and squares on a game-board are also examples. As with Worlds, users can define their own Beings by creating subclasses of `Being`.

A template for defining your own Being is found in TemplateBeing. As in TemplateWorld, `TemplateBeing extends Being`. Next, the constructor takes an `HShape` and passes it on to the super constructor. An HShape is just an object representing a shape. Shapes available for your use include Rectangle, Circle, and Polygon. Beings need HShapes to define both their spatial position and shape. Finally, there are two blank functions: update and draw. Update specifies an internal update specific to the Being and independent of external contexts that the Being should run on every update cycle. An example of an update would be a pacing behavior for an enemy. An example of something that isn't an update is a fight exchange between an enemy and a player. Finally, the draw function handles drawing the Being, and is called on every step of the draw loop. While you can use all the same Processing commands as usual to draw here as in the Processing draw function, there's one slight difference. A Being's draw function defines the origin, (0,0), as the Being's position, as set in its shape, instead of the top left corner of the PApplet. As long as you draw your Being around its position, Hermes will automatically draw the Being at the right location, even when the Being is moving.

A Simple World
--------------

Now that we've covered the two basic building blocks of Hermes, let's create something! The following example is available in the `tutorial` folder, although we recommend following along and building it on your own. Start by duplicating the template folder. Rename it to `tutorial`, and rename the file `template.pde` to `tutorial.pde'. If you want, rename `TemplateWorld` to `TutorialWorld` and update the reference in tutorial.pde accordingly; if you don't want to rename it, just leave the main tutorial file alone.

Now that we're set up, let's get coding! Let's start with making a stupidly simple World, just to ensure every step and operation is clear. We're going to make a being that has the shape of a square and changes its color on every update. This is something that is pretty simple to do in normal Processing, but will provide a base for more complicated Worlds that aren't as simple.

The first step is defining our Being. We're going to rewrite the `TemplateBeing` file to look like this:

`/**
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
    _shape.draw();
  }

  private void pickColor() {
    _c = color(int(random(256)), int(random(256)), int(random(256)));
  }
}`

We have renamed our `TemplateBeing` to `GlitchySquare` to reflect its new identity. The above code defines a rectangular Being that picks a color every update, and appears as a square with color determined by pickColor. How does it work? First, we define some constant to define the size of our Being. Next, we introduce an instance variable, `_c`, that defines the square's color. In the Being's constructor, we create a new rectangle, with x and y set to the middle of the screen and width and height defined by our constants. The syntax for creating a Rectangle is the same as for Processing's `rect` command; you can even change the specifics of the syntax using Processing's `rectMode` command. Then, we set `_c` to the results of `pickColor()`, which, at the bottom of the file, picks a color at random. Updates pick a new color for the Being. In draw, we start by calling `fill` with `_c`, then calling `_shape.draw()`. `_shape` is how we access our Being's internal shape from inside the Being; it can also be obtained using `this.getShape()`. Calling draw on our shape is shorthand for drawing the internal shape on screen, useful for debugging when Beings have more complex draw functions. Here, since our shape is a rectangle, `_shape.draw()` is equivalent to `rect(0, 0, WIDTH, HEIGHT)`. Note that, since the origin is already defined to be our Being's position inside the draw function, the position of rect is just (0,0).

Now we need to instantiate our Being inside the World. Switch to TemplateWorld, and in `setup()`, add the line `registerBeing(new GlitchySquare())`. That's it.

Now hit run. There we go! There should be a spazzy lil' square flipping out right in the center of the screen.

Let's make things a little more interesting. If we pass in x and y parameters to our square, we can give it an arbitrary position. We'll change the constructor function to:

`GlitchySquare(int x, int y) {
    super(new Rectangle(x, y, WIDTH, HEIGHT));`

Now, in TemplateWorld, give the GlitchySquare whatever position you want. Hit run, and the square will appear there. Now, let's get fancy and make lots of squares. Make a new static final variable at the top of the World class named `SQAURE_NUM`; set this number to whatever number catches your fancy. Now, change the `setup()` function to:

`void setup() {
    for (int i = 0; i < SQUARE_NUM; i++) {
      int x = (int) random(WINDOW_WIDTH - 50);
      int y = (int) random(WINDOW_HEIGHT - 50);
      registerBeing(new GlitchySquare(x, y));
}`

Now hit run. We've got lots of little squares, flashing away! Last (but not least), let's make our squares shake in spastic glory. 