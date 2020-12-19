class Console {
  ArrayList<Nodo> nodosSource = new ArrayList<Nodo>();
  ArrayList<Arista> aristasSource = new ArrayList<Arista>();
  float posX, posY, anchoRect, altoRect;
  Console(float positionX, float positionY, float ancho, float alto , ArrayList<Nodo> nodoS, ArrayList<Arista> aristaS) {
    posX = positionX;
    posY = positionY;
    anchoRect = ancho;
    altoRect = alto;
    nodosSource = nodoS;
    aristasSource = aristaS;
  }
  

  
  void refresh(){
   push();
   fill(255);
   rect(posX,posY,anchoRect,altoRect,4);
   fill(0);
   textAlign(CENTER,CENTER);
   text("Nodos", posX+anchoRect*0.5,posY+altoRect*0.04*0.5);
   line(posX,posY+0.06*altoRect,posX+anchoRect,posY+0.06*altoRect);
   
   //6 nodos por nivel
   float posicionXRecuadro=0,posicionYRecuadro=0;
   int j=0;
   for (int i=0; i<nodos.size()-1; i++) {
    Nodo nodoCursor1 = nodos.get(i);
    posicionXRecuadro = posX + (anchoRect*0.2* (i%5)); //Las posicionX (pegado al borde) + el ancho del cuadro 
    
    
    posicionYRecuadro = posY+0.06*altoRect + j*anchoRect*0.2; //
    
    fill(230);
    rect(posicionXRecuadro,posicionYRecuadro,anchoRect*0.2,anchoRect*0.2,5);
    fill(0);
    text(nodoCursor1.name, posicionXRecuadro + anchoRect*0.1, posicionYRecuadro + anchoRect*0.1);
    
    if(i%5==4){j++;}
  }
  line(posX,posicionYRecuadro+ anchoRect*0.2,posX+anchoRect,posicionYRecuadro+ anchoRect*0.2); //Linea al final de los nodos
  text("Aristas", posX+anchoRect*0.5, posicionYRecuadro+ anchoRect*0.2 + altoRect*0.04*0.5 );
  line(posX,posicionYRecuadro+ anchoRect*0.2+0.06*altoRect,posX+anchoRect,posicionYRecuadro+anchoRect*0.2+0.06*altoRect); //Lines despues del texto
   
   
   pop();
  }
  
  
}
