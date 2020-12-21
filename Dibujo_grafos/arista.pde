class Arista{
  Nodo partida = new Nodo();
  Nodo llegada = new Nodo();
  
  Arista(Nodo first, Nodo second){
    partida = first;
    llegada = second;
  }
  
  void display(){
   line(partida.posX,partida.posY,llegada.posX,llegada.posY); 
   flecha(partida.posX,partida.posY,llegada.posX,llegada.posY,partida.diametro/2);
  }
  
  
}
