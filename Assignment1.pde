/*
  OOP Assignment 1 - Scifi UI
  Chenxi Zhang
  Date: 10/12/17
*/

// Arraylist of objects from ui
ArrayList<UIObject> mainObj = new ArrayList<UIObject>();
ArrayList<UIObject> frame = new ArrayList<UIObject>();
ArrayList<UIObject> shipUIObj = new ArrayList<UIObject>();

// flags for ui control
boolean mainUI, shipUI, missionUI;

void setup() {
  // Size of canvas
  size(800, 600);
  
  // Setting framerate to 60
  frameRate(60);
  
  // Init flags
  mainUI = true;
  shipUI = false;
  missionUI = false;
  
  // frame "borders"
  frame.add(new Border(30, height - 200, 0));
  frame.add(new Border(width - 30, 200, PI));
  frame.add(new Border(200, 30, HALF_PI));
  frame.add(new Border(width - 200, height - 30, PI + HALF_PI));
  // main screen objects
  mainObj.add(new Circle(width/2, height/2, 120));
  mainObj.add(new Radar(620, 125, 250, 125));
  mainObj.add(new Ship(width/2, height/2));
  mainObj.add(new Button(100, 150, "Ship Detail", 100, 30));
  mainObj.add(new Button(100, 250, "Show Mission", 100, 30));
  mainObj.add(new Bars(575, 500, "Signal Bar"));
  // ship screen objects
}

void draw() {
  background(0);
  
  for (int i = frame.size() - 1; i > -1; i--) {
    UIObject border = frame.get(i);
    border.render();
  }
  
  if (mainUI) {
  // iterate through the array list to render and update UI
    for (int i = mainObj.size() - 1; i > -1; i--) {
      UIObject o = mainObj.get(i);
      o.render();
      o.update();
    }
  }
  
  if (shipUI) {
    text("Hello World", width/2, height/2);  
  }
  
  if (missionUI) {
    text("Lorem Ipsum", width/2, height/2);  
  }
  
  println(frameRate);
}

void mousePressed() {
  if (mainUI) {
    if (mousePressed) {
      // detect if first button was pressed
      if (dist(mouseX, 150, 100, 150) < 50) {
        if (dist(100, 150, 100, mouseY) < 15) {
          // switch to shipUI
          mainUI = !mainUI;
          shipUI = !shipUI;
        }
      }
      // detect if second button was pressed
      if (dist(mouseX, 250, 100, 250) < 50) {
        if (dist(100, 250, 100, mouseY) < 15) {
          // switch to shipUI
          mainUI = !mainUI;
          missionUI = !missionUI;
        }
      }
    }
  }
}