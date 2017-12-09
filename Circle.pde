class Circle extends UIObject {
  float radius;
  float theta;
  float speed;
  float freq;
  Circle(float x, float y, float r) {
    super(x, y);
    theta = 0;
    freq = 0.2;
    speed = (TWO_PI / 60.0) * freq;
    this.radius = r;
  }

  void render() {
    noStroke();
    noFill();
    stroke(0, 255, 255);
    strokeWeight(2);
    strokeWeight(3);
    stroke(0, 255, 180);
    ellipse(pos.x, pos.y, radius * 2, radius * 2);
    stroke(255);
    strokeCap(SQUARE);
    strokeWeight(5);
    arc(pos.x, pos.y, radius * 2, radius * 2, 0, PI);
    // arcs

    pushMatrix();
    translate(pos.x, pos.y);
    rotate(theta);
    strokeWeight(2);
    stroke(0, 255, 80);
    arc(0, 0, radius * 1.8, radius * 1.8, 0, HALF_PI - 0.2);
    arc(0, 0, radius * 1.8, radius * 1.8, PI + HALF_PI, TWO_PI - 0.2);
    arc(0, 0, radius * 1.8, radius * 1.8, HALF_PI, PI - 0.2);
    arc(0, 0, radius * 1.8, radius * 1.8, PI, PI + HALF_PI - 0.2);
    popMatrix();
  }

  void update() {
    theta += speed;
  }
}