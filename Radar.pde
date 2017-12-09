class Radar extends UIObject {
  float w;
  float h;
  float ly;
  float lx;
  float dX;
  float dY;
  
  PImage map;
  Radar (float x, float y, float w, float h) {
    super(x, y);
    this.w = w;
    this.h = h;
    lx = pos.x - w/2;
    ly = pos.y - h/2;
    dX = 0.3;
    dY = 0.2;
    map = loadImage("map.png");
  }
  
  void render() {
    noFill();
    stroke(0 ,255, 180);
    strokeWeight(1);
    rectMode(CENTER);
    rect(pos.x, pos.y, w, h, 5);
    imageMode(CENTER);
    image(map, pos.x, pos.y);
    stroke(0, 255, 255, 90);
    line(pos.x - w/2, ly, pos.x + w/2, ly);
    line(lx, pos.y - h/2, lx, pos.y + h/2);
  }
  
  void update() {
    lx += dX;
    ly += dY;
    if (ly < pos.y - h/2) {
      dY = 0.2;
    }
    if (ly > pos.y + h/2) {
      dY = -0.2;  
    }
    if (lx < pos.x - w/2) {
      dX = 0.3;
    }
    if (lx > pos.x + w/2) {
      dX = -0.3;
    }
  }
}  