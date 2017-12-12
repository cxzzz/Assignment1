class ShipHUD extends UIObject {
  
  float fuel;
  float speed;
  float theta;
  float ang1;
  float ang2;
  ArrayList<Star> stars = new ArrayList<Star>();
    
  ShipHUD(float x, float y) {
    super(x, y);
    fuel = 100.0;
    speed = 0;
    theta = 0;
    ang1 = (TWO_PI/60.0) * 0.02;
    ang2 = (TWO_PI/60.0) * 0.05;
    for (int i = 0; i < 100; i++) {
      stars.add(new Star(random(70, 660), random(70, 350)));  
    }
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
    rect(-300, -30, map(speed, 0, 90, 0, 100), 30);
    popMatrix();
    stroke(0);
    strokeWeight(1);
    line(pos.x + 150, pos.y - 50, pos.x + 300, pos.y - 50);
    line(pos.x + 150, pos.y, pos.x + 300, pos.y);
    line(pos.x + 150, pos.y + 50, pos.x + 300, pos.y + 50);
    pushMatrix();
    translate(pos.x, pos.y);
    stroke(0);
    noFill();
    rotate(ang1);
    arc(0, 0, 60, 60, 0, HALF_PI);
    arc(0, 0, 80, 80, PI, TWO_PI);
    arc(0, 0, 30, 30, 0, PI);
    rotate(ang2);
    arc(0, 0, 50, 50, HALF_PI, PI + QUARTER_PI);
    arc(0, 0, 40, 40, HALF_PI, HALF_PI + 1);
    arc(0, 0, 70, 70, QUARTER_PI, TWO_PI);
    popMatrix();
    for (Star s : stars) {
      s.render();
      s.update(speed, theta);
    }
  }
  
  void update() {
    ang1 += 0.02;
    ang2 -= 0.05;
    if (keyPressed) {
      if (fuel > 0) {
        if (key == 'w') {
          speed += 0.02 * 2;  
        }
        if (speed > 0) {
          if (key == 's') {
            speed -= 0.02 * 2;  
          }
        } else {
          speed = 0;  
        }
        
        if (key == 'a') {
          if (speed > 0) {
            theta -= 0.02; 
          }
        }
        
        if (key == 'd') {
          if (speed > 0) {
            theta += 0.02;
          }
        }
      } else {
        if (speed > 0) {
          speed -= 0.02;  
        }
      }
    }
    
    if (fuel > 0) {
      if (second() % 2 == 0) {
        fuel -= random(0.02, 0.05);
      }
    }
    if (fuel < 0) {
      fuel = 0;
    }
    
    if (fuel < 20) {
      if (speed > 0) {
      speed -= 0.02;
      } else {
        speed = 0;  
      }
      textSize(24);
      fill(255, 0, 0);
      text("Low Fuel! Press refuel to fuel up", pos.x - 150, pos.y - 250);
      text("Press x to go back to main menu", pos.x - 150, pos.y - 220); 
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
      if(key == 'x') {
        mainUI = !mainUI;
        shipSimUI = !shipSimUI;
      }
    }
  } 
}