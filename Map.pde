class Map extends UIObject {
  
  Map(float x, float y) {
    super(x, y);
    
  }
  
  void render(){
    fill(255, 0, 255);
    stroke(255, 0, 255);
    strokeWeight(1);
    for (int i = -5; i <= 5; i++) {
      float x = map(i, -5, 5, 70, 730);
      float y = map(i, -5, 5, 50, height/2);
      line(x, 50, x, height/2);
      line(70, y, 730, y); 
    }
    
    for(StarMap s : stars) {
      stroke(255, 255, 0);
      line(s.screenXY.x - 2, s.screenXY.y, s.screenXY.x  + 2, s.screenXY.y);
      line(s.screenXY.x, s.screenXY.y - 2, s.screenXY.x, s.screenXY.y + 2);
      // draw star
      stroke(255, 0, 0);
      noFill();
      ellipse(s.screenXY.x, s.screenXY.y, s.mag, s.mag);
      // display text
      fill(255);
      textAlign(LEFT, CENTER);
      text(s.displayName, s.screenXY.x + 5, s.screenXY.y);
    }
  }
  
  void update(){}
}