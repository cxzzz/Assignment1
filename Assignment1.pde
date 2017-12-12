import processing.sound.*;

/*
  OOP Assignment 1 - Scifi UI
  Chenxi Zhang - C16434996
  Date: 10/12/17
*/

// Arraylist of objects from ui
ArrayList<UIObject> mainObj = new ArrayList<UIObject>();
ArrayList<UIObject> frame = new ArrayList<UIObject>();
ArrayList<UIObject> shipUIObj = new ArrayList<UIObject>();
ArrayList<UIObject> missionUIObj = new ArrayList<UIObject>();
ArrayList<ShipInfo> shipdata = new ArrayList<ShipInfo>(); 
ArrayList<StarMap> stars = new ArrayList<StarMap>();
ArrayList<UIObject> shipSimObj = new ArrayList<UIObject>();

// flags for ui control
boolean mainUI, shipUI, missionUI, shipSimUI;

// sound file var
SoundFile bgmusic;

void setup() {
  // Size of canvas
  size(800, 600);
  
  // Setting framerate to 60
  frameRate(60);
  
  // Init flags
  mainUI = true;
  shipUI = false;
  missionUI = false;
  shipSimUI = false;
  
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
  mainObj.add(new Bars(80, 525, "Signal Bar"));
  // ship screen objects
  loadData(); // loads ship data from csv
  shipUIObj.add(new Button(125, 500, "Back", 100, 30));
  shipUIObj.add(new Ship(125, 150));
  shipUIObj.add(new CircleRadar(width/2 + 250, height/2 + 175, 80));
  // mission screen objects
  loadMap();
  missionUIObj.add(new Button(125, 500, "Back", 100, 30));
  missionUIObj.add(new Map(0, 0));
  missionUIObj.add(new Button(650, 420, "Start", 100, 30));
  // ship simulation objects
  shipSimObj.add(new ShipHUD(width/2, 475));
  
  bgmusic = new SoundFile(this, "bgmusic.mp3");
  bgmusic.play();
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
    fill(random(0), random(255), random(0));
    textSize(14);
    textAlign(LEFT);
    float x = 75;
    float y = 275;
    float gap = 30;
    for (ShipInfo s : shipdata) {
      text("Ship Name: " + s.shipName, x, y);
      text("Ship Weight: " + s.weight, x, y + gap);
      text("Year Made: " + s.year, x, y + gap * 2);
    }
    for (int i = shipUIObj.size() - 1; i > -1; i--) {
      UIObject o = shipUIObj.get(i);
      o.render();
      o.update();
    }
   
    
  }
  
  if (missionUI) {
    for (int i = missionUIObj.size() - 1; i > -1; i--) {
      UIObject o = missionUIObj.get(i);
      o.render();
      o.update();
    }
    stroke(0, 255, 180);
    strokeWeight(2);
    rectMode(CENTER);
    noFill();
    rect(width/2, height/2 + 100, 660, 120);
    text("Its 2090, You are required to keep this world in peace, press start to start mission", width/2 - 70, height/2 + 60);
  }

  if (shipSimUI) {
    for (int i = shipSimObj.size() - 1; i > -1; i--) {
      UIObject o = shipSimObj.get(i);
      o.render();
      o.update();
    }          
  }  
  
  println(frameRate);
}

void mousePressed() {
  if (mainUI) {
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
        // switch to missionUI
        mainUI = !mainUI;
        missionUI = !missionUI;
      }
    }
  }
  
  if (shipUI) {
    // Detect user clicked back
    if (dist(mouseX, 500, 125, 500) < 50) {
      if (dist(125, 500, 125, mouseY) < 15) {
        // switch to mainUI
        shipUI = !shipUI;
        mainUI = !mainUI;
      }
    }
  }
  
  if (missionUI) {
    // Detect user clicked back
    if (dist(mouseX, 500, 125, 500) < 50) {
      if (dist(125, 500, 125, mouseY) < 15) {
        // switch to mainUI
        missionUI = !missionUI;
        mainUI = !mainUI;
      }
    }
    // Detect user clicked back
    if (dist(mouseX, 420, 650, 420) < 50) {
      if (dist(650, 420, 650, mouseY) < 15) {
        // switch to ship simluation UI
        missionUI = !missionUI;
        shipSimUI = !shipSimUI;
      }
    }    
  }
}


/*
  Function for loading ship's data
*/
void loadData() {
  Table table = loadTable("shipdata.csv", "header");
  // Load and add data into arraylist
  for (TableRow r : table.rows()) {
    ShipInfo s = new ShipInfo(r);
    shipdata.add(s);
    shipUIObj.add(new ContainerBars(350, 150, 100, 25, "Max Speed", s.maxSpeed));
    shipUIObj.add(new ContainerBars(350, 200, 100, 25, "FiringRate", s.firingRate));
  }
}

/*
  Function for loading the map for mission's UI
*/

void loadMap() {
  Table table = loadTable("starset.csv", "header");
  
  for (TableRow r : table.rows()) {
    StarMap star = new StarMap(r);
    stars.add(star);
  }
}