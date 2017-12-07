MainUI ui;

void setup() {
  size(800, 600);
  ui = new MainUI(30);
}


void draw() {
  background(0);
  ui.drawUI();
}