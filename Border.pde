class Border extends UIObject {
  PShape frame;
  float theta;
  
  Border(float x, float y, float theta) {
    // getting pvec from super class UIObject
    super(x, y);
    this.theta = theta;
    // shap creation
    frame = createShape();
    frame.beginShape();
    frame.strokeWeight(1);
    frame.fill(0, 255, 180, 40);
    frame.stroke(0, 255, 180, 220);
    frame.vertex(0, 0);
    frame.vertex(0, 150);
    frame.vertex(20, 170);
    frame.vertex(160, 170);
    frame.vertex(120, 170);
    frame.vertex(110, 180);
    frame.vertex(10, 180);
    frame.vertex(-10, 160);
    frame.vertex(-10, 50);
    frame.vertex(0, 40);
    frame.endShape(CLOSE);    
  }
  
  void render() {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(theta);
    shape(frame, 0, 0);
    popMatrix();
  }
  
  void update() {}
}