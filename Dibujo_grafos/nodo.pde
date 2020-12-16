
class Nodo{
  int posX,posY;
  String name;
  Nodo(int _posX, int _posY,String _name){
   posX = _posX;
   posY = _posY;
   name = _name;
  }
  
  void show(){
   push();
   fill(255);
   strokeWeight(2);
   circle(posX,posY, width/20);
   fill(0);
   textSize(width/80);
   textAlign(CENTER, CENTER);
   text(name,posX,posY);
   pop();
  }
  
  void update(int x, int y){
  posX = x;
  posY = y;
  }
  
  
  
  
  
}
