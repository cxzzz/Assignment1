class ShipHUD extends UIObject {
  
  float fuel;
  float speed;
  
  ShipHUD(float x, float y) {
    super(x, y);
    fuel = 100.0;
  }
  
  void render(){
    noStroke();
    fill(255, 255, 255);
    rectMode(CENTER);
    rect(pos.x, pos.y, 700, 150);
    pushMatrix();
    translate(pos.x, pos.y);
    strokeWeight(1);
    stroke(0, 0, 0);
    fill(0);
    textSize(12);
    textAlign(LEFT);
    text("Fuel " + nf(fuel, 1, 1), -190, -55);
    text("Speed " + nf(speed, 1, 1), -190, -15);
    noFill();
    rect(-250, -55, 100, 30);
    rect(-250, -15, 100, 30);
    fill(0, 255, 0);
    rectMode(CORNER);
    rect(-300, -70, fuel, 30);
    popMatrix();
    if (keyPressed) {
      if (keyCode == 'w') {
          
      }
    }
  }
  
  void update(){
    if (fuel > 0) {
      if (second() % 3 == 0) {
        fuel -= random(0.01, 0.03);  
      }
    }
    if (fuel < 0) {
      fuel = 0;
    }
    
    if (fuel < 20) {
      textSize(20);
      fill(255, 0, 0);
      text("Low Fuel!", width/2, height/2);
      pushMatrix();
      translate(pos.x, pos.y);
      rectMode(CENTER);
      stroke(0);
      fill(255, 255, 0, 50);
      rect(-250, 25, 100, 30, 5);
      fill(0, 255, 0);
      textSize(12);
      textAlign(CENTER);
      text("Refuel", -250, 30);
      popMatrix();
      if (mousePressed) {
        if (dist(mouseX, pos.y + 25, pos.x - 250 , pos.y + 25) < 50) {
          if (dist(pos.x -250, pos.y + 25, pos.x - 250, mouseY) < 15) {
            fuel = 100.0;
          }
        }      
      }
    }
  } 
}