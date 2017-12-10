class Bars extends UIObject {
  float w;
  float h;
  String barName;
  
  Bars(float x, float y, String barName) {
    super(x, y);
    this.barName = barName;
    w = 2;
  }
  
  void render() {
    
    noStroke();
    fill(255);
    textSize(12);
    textAlign(LEFT);
    text(barName, pos.x + 280, pos.y - 50);
    float x = pos.x;
    // Every two seconds animate random rectangles to simulate some signal
    fill(0, 255, 180);
    if (second() % 2 == 0) {
    for (int i = 0; i < 320; i++) {
      h = (float)random(-35);
      rect(x, pos.y, w, h);
      x+= w;
    }
    }
  }
  
  void update(){}
  
  
  
  
}