class Radar extends UIObject {
  float w;
  float h;
  
  Radar (float x, float y, float w, float h) {
    super(x, y);
    this.w = w;
    this.h = h;
  }
  
  void render() {
    noFill();
    stroke(0 ,255, 180);
    strokeWeight(1);
    rectMode(CENTER);
    rect(pos.x, pos.y, w, h);
    if (second() % 2 == 0) {
      for (int i = 0; i < 5; i++) {
        float x = map(i, 0, 4, pos.x - w/2, pos.x + w/2);
        float y = map(i, 0, 4, pos.y - h/2, pos.y + h/2);
        line(x, pos.y - h/2, x, pos.y + h/2);
        line(pos.x - w/2 , y, pos.x + w/2, y);
      }
    }
  }
  
  void update(){
  
  }
}  