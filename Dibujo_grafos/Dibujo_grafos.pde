ArrayList<Nodo> nodos = new ArrayList<Nodo>();

int numeroNodoN = 0;
String nombreNodoN = "";
boolean agregar = true;
boolean conectar = false;
void settings() {
  float alto = 8*displayHeight/10.0;
  float ancho = 8*displayWidth/10.0;
  size(int(ancho), int(alto));
}

void setup() {
  background(255);
  textSize(width/60);
}

void draw() {

  background(200);
  fill(0);
  text(frameRate, 10, 20); //Mostramos los FPS en pantalla
  text("Modo agregar: " + agregar, 120, 20); //Mostramos los FPS en pantalla
  text("Modo conectar: " + conectar, 120, 60); //Mostramos los FPS en pantalla


  if (nodos.size()>0 && agregar) { //Si el arrayList no está vacio y si está en modo agregar
  
  Nodo nodoN = nodos.get(nodos.size() - 1);    //Usamos el ultimo nodo 
    nodoN.update(mouseX, mouseY);    
    nodoN.display();  
  
  }
  
  

  displayNodos(); //Mostrar todos los Nodos en pantalla
  //displayTodasDistancias();
  if(detectarSeleccion()!=-1){
    Nodo nodoN = nodos.get(detectarSeleccion());
    nodoN.seleccion=true;
  }
  else{
    deseleccionarTodos();
  }
  
}

void keyPressed() {
  
  if (key == 'a' || key == 'A') {
    agregar = !agregar;
    conectar = false;
  }
  if (key == 's' || key == 'S') {
    agregar = false;
    conectar = !conectar;
  }
  //println((numeroNodo));
}

void mouseClicked() {

  if (!colision() && agregar) { //Si no detecta colision en el ultimo nodo, agrega uno nuevo
    numeroNodoN++;
    nombreNodoN = str(char(numeroNodoN+64));
    nodos.add(new Nodo(mouseX, mouseY, nombreNodoN));
  }
}

void displayNodos() { //Muestra todos los nodos menos el ultimo
  for (int i=0; i<nodos.size()-1; i++) {
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
      if (dist(nodoCursor1.posX, nodoCursor1.posY, nodoCursor2.posX, nodoCursor2.posY)<nodoCursor1.diametro) {
        return true;
      }
    }
  } 
  return false;
}

int detectarSeleccion() { //Retorna el index del nodo seleccionado
  for (int i=0; i<nodos.size()-1; i++) { //Recorremos todos los objetos
    Nodo nodoCursor1 = nodos.get(i); 
    if (dist(nodoCursor1.posX, nodoCursor1.posY, mouseX, mouseY)<nodoCursor1.diametro/2) { //Comprobamos si el mouse esta sobre uno de ellos
      println("Seleccion = " + i);
      return(i);  //Retornamos el index del objeto con el cual está colisionando
    } else {
      println(i);
    }
  }
  return -1;  //Si no detecta colision retorna -1
}

void deseleccionarTodos(){ //Vuelve todos los atributos "seleccion" false
  for (int i=0; i<nodos.size()-1; i++) {
     Nodo nodoCursor1 = nodos.get(i);
     nodoCursor1.seleccion = false;
  }
}
