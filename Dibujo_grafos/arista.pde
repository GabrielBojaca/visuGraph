class Arista{
  Nodo partida = new Nodo();
  Nodo llegada = new Nodo();
  float rotacion = random(0,2*PI);
  
  Arista(Nodo first, Nodo second){
    partida = first;
    llegada = second;
  }
  
  void display(){
   if(partida != llegada){
   line(partida.posX,partida.posY,llegada.posX,llegada.posY); 
   flecha(partida.posX,partida.posY,llegada.posX,llegada.posY,partida.diametro/2);
   }
   else{
   autoFlecha(partida.posX,partida.posY,partida.diametro);
   }
  }
  
  void autoFlecha(float posX, float posY, float diametro){
  push();
  noFill();
  pushMatrix();  
  translate(posX,posY);
  //float a = map(mouseY, 0, height, 0, 2*PI);
  rotate(rotacion);
  ellipse(-diametro,0,diametro*1.2, diametro*0.5);
  flecha(-diametro*0.8,-diametro*0.23,-diametro*0.5,-diametro*0.12,0);
  popMatrix();
  pop();
  
}
  
}
