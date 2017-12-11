class Ship extends UIObject {
  PShape s;
  Ship(float x, float y) {
    super(x, y);
    s = createShape();
    s.beginShape();
    s.stroke(255);
    s.noFill();
    s.vertex(0,0);
    s.vertex(-10, 70); // 15 length, 5, 5 slant mirror back
    s.vertex(0,0);
    s.vertex(10, 70);
    s.vertex(25, 70);
    s.vertex(30, 75);
    s.vertex(45, 78);
    s.vertex(45, 48);
    s.vertex(46, 98);
    s.vertex(30, 108);
    s.vertex(30, 102);
    s.vertex(20, 104);
    s.vertex(20, 125);
    s.vertex(15, 125);
    s.vertex(15, 114);
    s.vertex(0, 120);
    s.vertex(-15, 114);
    s.vertex(-15, 125);
    s.vertex(-20, 125);
    s.vertex(-20, 104);
    s.vertex(-30, 102);
    s.vertex(-30, 108);
    s.vertex(-46, 98);
    s.vertex(-45, 48);
    s.vertex(-45, 78);
    s.vertex(-30, 75);
    s.vertex(-25, 70);
    s.vertex(-10, 70);
    s.endShape();
  }
  
  void render() {
    shape(s, pos.x, pos.y - 60);
  }
  
  void update() {
  } 
}