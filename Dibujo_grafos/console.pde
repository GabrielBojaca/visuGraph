class Console {
  ArrayList<Nodo> nodosSource = new ArrayList<Nodo>();
  ArrayList<Arista> aristasSource = new ArrayList<Arista>();
  float posX, posY, anchoRect, altoRect;
  Console(float positionX, float positionY, float ancho, float alto, ArrayList<Nodo> nodoS, ArrayList<Arista> aristaS) {
    posX = positionX;
    posY = positionY;
    anchoRect = ancho;
    altoRect = alto;
    nodosSource = nodoS;
    aristasSource = aristaS;
  }



  void refresh() {
    push();
    textSize(width/60);
    fill(255);
    rect(posX, posY, anchoRect, altoRect, 4);
    fill(0);
    textAlign(CENTER, CENTER);
    text("Nodos", posX+anchoRect*0.5, posY+altoRect*0.04*0.5);
    line(posX, posY+0.06*altoRect, posX+anchoRect, posY+0.06*altoRect);

    //6 nodos por nivel
    float posicionXRecuadroNodo=0, posicionYRecuadroNodo=0;
    int j=0;
    posicionYRecuadroNodo = posY+0.06*altoRect; //Se inicializa distinto de 0, evitando solapar la banda "Nodos" y "Aristas"
    for (int i=0; i<nodosSource.size()-1; i++) {
      Nodo nodoCursor1 = nodos.get(i);
      posicionXRecuadroNodo = posX + (anchoRect*0.2* (i%5)); //Las posicionX (pegado al borde) + el ancho del cuadro 


      posicionYRecuadroNodo = posY+0.06*altoRect + j*anchoRect*0.2; //

      fill(230);
      rect(posicionXRecuadroNodo, posicionYRecuadroNodo, anchoRect*0.2, anchoRect*0.2, 5);
      fill(0);
      text(nodoCursor1.name, posicionXRecuadroNodo + anchoRect*0.1, posicionYRecuadroNodo + anchoRect*0.1);

      if (i%5==4) {
        j++;
      }
    }
    line(posX, posicionYRecuadroNodo+ anchoRect*0.2, posX+anchoRect, posicionYRecuadroNodo+ anchoRect*0.2); //Linea al final de los nodos
    text("Aristas", posX+anchoRect*0.5, posicionYRecuadroNodo+ anchoRect*0.2 + altoRect*0.04*0.5 );
    line(posX, posicionYRecuadroNodo+ anchoRect*0.2+0.06*altoRect, posX+anchoRect, posicionYRecuadroNodo+anchoRect*0.2+0.06*altoRect); //Lines despues del texto


    float posicionXRecuadroArista=0, posicionYRecuadroArista=0;
    int k=0;
    posicionYRecuadroArista = posicionYRecuadroNodo+ anchoRect*0.2+0.06*altoRect; //Se inicializa distinto de 0, evitando solapar la banda "Nodos" y "Aristas"


    for (int i=0; i<=aristasSource.size()-1; i++) {
      posicionXRecuadroArista = posX + (anchoRect*0.2* (i%5));
      posicionYRecuadroArista = posicionYRecuadroNodo+ anchoRect*0.2+0.06*altoRect + (anchoRect*0.1*k);
      
      Arista aristaCursor1 = aristasSource.get(i);
      
      fill(230);
      rect(posicionXRecuadroArista,posicionYRecuadroArista,    anchoRect*0.2, anchoRect*0.1, 5);
      fill(0);
      textSize(width/90);
      text(aristaCursor1.partida.name + "->" + aristaCursor1.llegada.name, posicionXRecuadroArista + anchoRect*0.1, posicionYRecuadroArista+ anchoRect*0.05);
          
      if (i%5==4) {
        k++;
      }
    }
    pop();
  }
}
