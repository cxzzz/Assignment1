void setup() {
  // Size of canvas
  size(800, 600);
  
  // Setting framerate to 60
  frameRate(60);
  
  // Adding UI Objects
  uiObjects.add(new Border(30, height - 200, 0));
  uiObjects.add(new Border(width - 30, 200, PI));
  uiObjects.add(new Border(200, 30, HALF_PI));
  uiObjects.add(new Border(width - 200, height - 30, PI + HALF_PI));
  uiObjects.add(new Circle(width/2, height/2, 120));
  uiObjects.add(new Radar(620, 125, 250, 125));
  uiObjects.add(new Ship(width/2, height/2));
  uiObjects.add(new Button(100, 150, "Ship Detail", 100, 30));
  uiObjects.add(new Button(100, 250, "Show Mission", 100, 30));
  uiObjects.add(new Bars(575, 500, "Signal Bar"));
}

// Arraylist of objects from ui
ArrayList<UIObject> uiObjects = new ArrayList<UIObject>();


void draw() {
  background(0);

  
  // iterate through the array list to render and update UI
  for (int i = uiObjects.size() - 1; i > -1; i--) {
    UIObject uiObj = uiObjects.get(i);
    uiObj.render();
    if (!(uiObj instanceof Border)) {
      uiObj.update();
    }
  }
  println(frameRate);
}