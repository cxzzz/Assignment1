class Star {
  float x;
  float y;
  float r;
  
  
  Star(float x, float y) {
    this.x = x;
    this.y = y;
    r = 1;
  }
  
  void render() {
    fill(255);
    noStroke();
    ellipse(x, y, r, r);
  }
  
  void update(float speed, float theta) {
    
    if (speed > 0 && theta > 0) {
      x += speed * 0.03;
      y += 0;
    }
    
    if (speed > 0 && theta < 0) {
      x -= speed * 0.03;  
    }
    
    if (x > 660 || x < 70) {
      x = random(70, 660);  
    }
  }
}