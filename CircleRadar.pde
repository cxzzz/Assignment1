class CircleRadar extends UIObject {
  float freq;
  float radius;
  PVector[] vectors = new PVector[5];
    
  CircleRadar(float x, float y, float r) {
    super(x, y);
    freq = 0.1;
    radius = r;
    for (int i = 0; i < vectors.length; i++) {
      vectors[i] = new PVector(random(-radius * 0.8, radius * 0.8), random(-radius * 0.8, radius * 0.8));
    }
  }
  
  void render(){
    pushMatrix();
    translate(pos.x, pos.y);
    noFill();
    stroke(255, 180);
    strokeWeight(1);
    ellipse(0, 0, radius * 0.4, radius * 0.4);
    ellipse(0, 0, radius * 0.8, radius * 0.8);
    ellipse(0, 0, radius * 1.2, radius * 1.2);
    ellipse(0, 0, radius * 1.6, radius * 1.6);
    ellipse(0, 0, radius * 2, radius * 2);
    line(-radius , 0, radius, 0);
    line(0, -radius, 0, radius);
    stroke(0, 255, 180);
    ellipse(0, 0, radius * freq, radius * freq);
    noStroke();
    fill(255, 0, 0);
    for(int i = 0; i < vectors.length;i++) {
      ellipse(vectors[i].x, vectors[i].y, 2, 2);
    }
    popMatrix();
    
  }
  
  void update(){
    if (frameCount % 10 == 0) {
      freq += 0.13;
      if (freq > 2) {
        freq = 0.1;  
      }
    }
    
    if (second() % 10 == 0) {
      for (int i = 0; i < vectors.length; i++) {
        vectors[i].set(random(-radius * 0.8, radius * 0.8), random(-radius * 0.8, radius * 0.8));
      }        
    }
  }
}