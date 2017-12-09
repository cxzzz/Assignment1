class Circle extends UIObject {
  float radius;
  float theta;

  Circle(float x, float y, float r) {
    super(x, y);
    theta = 0;
    this.radius = r;
  }

  void render() {
    noStroke();
    noFill();
    stroke(0, 255, 255);
    strokeWeight(2);
    strokeWeight(3);
    stroke(0, 255, 255);
    ellipse(pos.x, pos.y, radius * 2, radius * 2);
    stroke(255);
    strokeCap(SQUARE);
    strokeWeight(5);
    arc(pos.x, pos.y, radius * 2, radius * 2, 0, PI);
    // arcs

    pushMatrix();
    translate(pos.x, pos.y);
    rotate(theta);

    popMatrix();
  }

  void update() {}
}