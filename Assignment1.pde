void setup() {
  size(800, 600);
  frameRate(60);
  uiObjects.add(new Border(30, height - 200, 0));
  uiObjects.add(new Border(width - 30, 200, PI));
  uiObjects.add(new Border(200, 30, HALF_PI));
  uiObjects.add(new Border(width - 200, height - 30, PI + HALF_PI));
  uiObjects.add(new Circle(width/2, height/2, 100));
  uiObjects.add(new Radar(620, 125, 250, 125));
}

ArrayList<UIObject> uiObjects = new ArrayList<UIObject>();


void draw() {
  background(0);
  for (int i = uiObjects.size() - 1; i > -1; i--) {
    UIObject uiObj = uiObjects.get(i);
    uiObj.render();
    if (!(uiObj instanceof Border)) {
      uiObj.update();
    }
  }
  println(frameRate);
}