
class Nodo{
  int posX,posY;
  int diametro = width/20;
  String name;
  Nodo(int _posX, int _posY,String _name){
   posX = _posX;
   posY = _posY;
   name = _name;
  }
  
  void display(){  //Metodo para mostrar el Nodo en pantalla
   push();
   fill(255);
   strokeWeight(2);
   circle(posX,posY, diametro);
   fill(0);
   textSize(width/80);
   textAlign(CENTER, CENTER);
   text(name,posX,posY);
   pop();
  }
  
  void update(int x, int y){ //Metodo para actualizar posicion del nodo
  posX = x;
  posY = y;
  }
  
  
  
  
  
}
