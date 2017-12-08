abstract class UIObject {
  PVector pos;
  
  UIObject(float x, float y) {
    pos = new PVector(x, y);  
  }
  
  abstract void render();
  
}