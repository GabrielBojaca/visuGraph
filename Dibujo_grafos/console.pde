class Console {
  ArrayList<Nodo> nodosSource = new ArrayList<Nodo>();
  ArrayList<Arista> aristasSource = new ArrayList<Arista>();
  int posX, posY, anchoRect, altoRect;
  Console(int positionX, int positionY, int ancho, int alto , ArrayList<Nodo> nodoS, ArrayList<Arista> aristaS) {
    posX = positionX;
    posY = positionY;
    anchoRect = ancho;
    altoRect = alto;
    nodosSource = nodoS;
    aristasSource = aristaS;
  }
  

  
  void ejemplo(){
   println("posX = " + posX); 
  }
}
