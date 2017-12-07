class MainUI {
  
  float border;
  
  MainUI(float border) {
    this.border = border;
  }
  
  void drawUI() {
    strokeWeight(3);
    stroke(0, 88, 88);
    line(0, border, width, border);
    line(border, 0, border, height);
    line(0, height - border, width, height - border);
    line(width - border, 0, width - border, height);
    noStroke();
    rectMode(CENTER);
    fill(0, 255, 255);
    rect(border, border, 10, 10);
    rect(border, height - border, 10, 10);
    rect(width - border, border, 10, 10);
    rect(width- border, height - border, 10, 10);
  }
}