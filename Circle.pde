class Circle extends UIObject {
  float radius;
  float theta;
  float jitter;
  float ang2;

  
  Circle(float x, float y, float r) {
    super(x, y);
    theta = 0;
    ang2 = 0;
    this.radius = r;
  }

  void render() {
    noStroke();
    noFill();
    stroke(0, 255, 255);
    strokeWeight(2);
    ellipse(pos.x, pos.y, radius * 0.3, radius * 0.3);
    strokeWeight(3);
    stroke(0, 255, 255, 50);
    ellipse(pos.x, pos.y, radius * 0.305, radius * 0.305);
    // arcs
    noFill();
    stroke(255, 0, 0);
    strokeCap(SQUARE);
    strokeWeight(10);
    
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(theta);
    arc(0, 0, radius * 2, radius * 2, 0, PI);
    popMatrix();
    
    stroke(255, 255, 0);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(ang2);
    arc(0, 0, radius * 1.4, radius * 1.4, 0, PI);
    popMatrix();
  }

  void update() {
    theta += 0.1;
    ang2 -= 0.02;
  }
}