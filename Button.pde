class Button extends UIObject {
  String bName;
  float w;
  float h;
  Button(float x, float y, String s, float w, float h) {
    super(x, y);  
    bName = s;
    this.w = w;
    this.h = h;
  }
  
  void render() {
    rectMode(CENTER);
    noFill();
    stroke(0, 255, 180);
    strokeWeight(2);
    rect(pos.x, pos.y, w, h);
    fill(255);
    textSize(12);
    textAlign(CENTER, CENTER);
    text(bName, pos.x, pos.y);
  }
  
  void update() {
  
  }
}