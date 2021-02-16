class Button {
  float posX, posY, anchoRect, altoRect;
  String text;
  color colorFondo;
  Button(float _posX, float _posY, float _anchoRect, float _altoRect, String _text, color _colorFondo) {
    posX = _posX;
    posY = _posY;
    anchoRect = _anchoRect;
    altoRect = _altoRect;
    text = _text;
    colorFondo = _colorFondo;
  }

  void display() {
    push();
    textAlign(CENTER, CENTER);
    fill(colorFondo);
    rect(posX, posY, anchoRect, altoRect, 4);
    fill(0);
    text(text, posX+anchoRect/2, posY + altoRect/2);
    pop();
  }


  boolean pressed() {
    if (mouseX < (posX+anchoRect)   && mouseX > (posX)) {
      if (mouseY < (posY+altoRect) && mouseY > (posY)) {
        return true;
      }
    }
    return false;
  }

  void change() {
  }
}
