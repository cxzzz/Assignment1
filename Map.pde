class Map extends UIObject {
  
  Map(float x, float y) {
    super(x, y);
    
  }
  
  void render(){
    fill(255, 0, 255);
    stroke(255, 0, 255);
    for (int i = -5; i <= 5; i++) {
      float x = map(i, -5, 5, 50, width/2 + 150);
      float y = map(i, -5, 5, 50, height/2 + 100);
      line(x, 50, x, height/2 + 100);
      line(50, y, width/2 + 150, y); 
    }
  }
  
  void update(){}
}