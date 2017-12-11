class ContainerBars extends UIObject {
  float w;
  float h;
  String barName;
  float barLen;
  float barControl;
  
  ContainerBars(float x, float y, float w, float h, String barName, float barLen) {
    super(x, y);
    this.w = w;
    this.h = h;
    this.barName = barName;
    this.barLen = barLen;
  }
  
  void render() {
    fill(255);
    text(barName, pos.x - 100, pos.y);
    rectMode(CENTER);
    noFill();
    stroke(0, 255, 180);
    rect(pos.x, pos.y, w, h);
    rectMode(CORNER);
    noStroke();
    fill(0, 255, 0, 100);
    rect(pos.x - w/2, pos.y - h/2, barControl, h);
    fill(255);
    text(nf(barLen, 0, 1), pos.x + w * 1.1, pos.y);
  }
  
  
  void update() {
    
    if (barControl > map(barLen, 0, 100, w/2, w)) {
      if(second() % 5 == 0) {
        barControl = 0;  
      }
    } else {
      barControl += 0.8;  
    }
  }
}