

Nodo A = new Nodo(200,200, "A");

void settings() {
  float alto = 8*displayHeight/10.0;
  float ancho = 8*displayWidth/10.0;
  size(int(ancho),int(alto));
}

void setup(){
  background(255);
  
}

void draw(){
  background(200);
  A.update(mouseX,mouseY);
  A.show();
  //circle(200,200,4);
}
