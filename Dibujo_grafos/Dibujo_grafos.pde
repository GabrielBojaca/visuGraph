ArrayList<Nodo> nodos = new ArrayList<Nodo>();

int numeroNodoN = 0;
String nombreNodoN = "";

void settings() {
  float alto = 8*displayHeight/10.0;
  float ancho = 8*displayWidth/10.0;
  size(int(ancho), int(alto));
}

void setup() {
  background(255);
}

void draw() {
  if (!colision()) {

    background(200);
  } else {
    background(200,0,0);
  }
  text(frameRate, 10, 20);

  if (nodos.size()>0) {
    Nodo nodoN = nodos.get(nodos.size() - 1); 
    nodoN.update(mouseX, mouseY);    
    nodoN.display();
  }
  displayNodos();
  //displayTodasDistancias();
}

void keyPressed() {
  if (!colision()) { //Si no detecta colision en el ultimo nodo, agrega uno nuevo
    numeroNodoN++;
    nombreNodoN = str(char(numeroNodoN+64));
    nodos.add(new Nodo(mouseX, mouseY, nombreNodoN));
  }
  //println((numeroNodo));
}

void displayNodos() { //Muestra todos los nodos
  for (int i=0; i<=nodos.size()-1; i++) {
    Nodo nodoCursor = nodos.get(i);   
    nodoCursor.display(); //Ejecuta el metodo display de todos los elementos del arrayList 
  }
}

void displayTodasDistancias() {  //Muestra todas las distancias de los nodos
  push();
  for (int i=0; i<=nodos.size()-1; i++) {
    Nodo nodoCursor1 = nodos.get(i);   
    for (int j = 0; j<=nodos.size()-1; j++) {
      if (i!=j) {
        Nodo nodoCursor2 = nodos.get(j);
        //println(dist(nodoCursor1.posX, nodoCursor1.posY, nodoCursor2.posX, nodoCursor2.posY));
        if (dist(nodoCursor1.posX, nodoCursor1.posY, nodoCursor2.posX, nodoCursor2.posY)<nodoCursor1.diametro) {
          stroke(255, 0, 0);
        } else {
          stroke(0);
        }
        line(nodoCursor1.posX, nodoCursor1.posY, nodoCursor2.posX, nodoCursor2.posY);
        fill(0);
        text(dist(nodoCursor1.posX, nodoCursor1.posY, nodoCursor2.posX, nodoCursor2.posY), (nodoCursor1.posX + nodoCursor2.posX)/2, (nodoCursor1.posY+nodoCursor2.posY)/2 );
      }
    }
  }
  pop();
}

void displayDistancias() {  //Muestra las distancias del ultimo nodo 
  push();
  for (int i=0; i<=nodos.size()-1; i++) {
    Nodo nodoCursor1 = nodos.get(i);   
    Nodo nodoCursor2 = nodos.get(nodos.size()-1);
    if (dist(nodoCursor1.posX, nodoCursor1.posY, nodoCursor2.posX, nodoCursor2.posY)<nodoCursor1.diametro) {
      stroke(255, 0, 0);
    } else {
      stroke(0);
    }

    line(nodoCursor1.posX, nodoCursor1.posY, nodoCursor2.posX, nodoCursor2.posY);
    fill(0);
    text(dist(nodoCursor1.posX, nodoCursor1.posY, nodoCursor2.posX, nodoCursor2.posY), (nodoCursor1.posX + nodoCursor2.posX)/2, (nodoCursor1.posY+nodoCursor2.posY)/2 );
  }
  pop();
}

boolean colision() { //retorna True si detecta colision
  if (nodos.size()>1) {
    Nodo nodoCursor2 = nodos.get(nodos.size()-1);
    for (int i=0; i<nodos.size()-1; i++) {
      Nodo nodoCursor1 = nodos.get(i);           
      if (dist(nodoCursor1.posX, nodoCursor1.posY, nodoCursor2.posX, nodoCursor2.posY)<width/20) {
        return true;
      }
    }
  } 
  return false;
}
