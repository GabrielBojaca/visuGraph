ArrayList<Nodo> nodos = new ArrayList<Nodo>();
ArrayList<Arista> aristas = new ArrayList<Arista>();

Console consola;


int numeroNodoN = 0;
String nombreNodoN = "";
boolean agregar = true;
boolean conectar = false;

int numeroConexion = 0;
int indexPrimeroSeleccionado, indexSegundoSeleccionado;


void settings() {
  float alto = 8*displayHeight/10.0;
  float ancho = 8*displayWidth/10.0;
  size(int(ancho), int(alto));
}

void setup() {
  background(255);
  textSize(width/60);
  frameRate(30);
  consola = new Console(width*0.77,height*0.05,width*0.2,height*0.9,nodos,aristas);
  
}

void draw() {

  background(200);
  fill(255);  
  fill(0);
  text(frameRate, 10, 20); //Mostramos los FPS en pantalla
  text("Modo agregar: " + agregar, 120, 20); //Mostramos los FPS en pantalla
  text("Modo conectar: " + conectar, 120, 60); //Mostramos los FPS en pantalla

  if (nodos.size()>0 && agregar) { //Si el arrayList no está vacio y si está en modo agregar
    Nodo nodoN = nodos.get(nodos.size() - 1);    //Usamos el ultimo nodo 
    nodoN.update(mouseX, mouseY);    
    nodoN.display();
  }

  displayAristas(); //Mostrar todas las Aristas en pantalla
  displayNodos(); //Mostrar todos los Nodos en pantalla
  consola.refresh();
 // displayTodasDistancias();

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
   //delay(100);
  if (detectarSeleccion()!=-1) { //Si hay seleccion
    Nodo nodoN = nodos.get(detectarSeleccion()); //Apunta al objeto seleccionado
    nodoN.seleccion=!nodoN.seleccion; //Cambia el atriburo de seleecion
  }

  if (!colision() && agregar) { //Si no detecta colision en el ultimo nodo, agrega uno nuevo
    numeroNodoN++;
    nombreNodoN = str(char(numeroNodoN+64));
    nodos.add(new Nodo(mouseX, mouseY, nombreNodoN));
  }


  if (conectar) { //Si estamos en modo conectar 
    if (detectarSeleccion() != -1) { //Si se detecta una seleccion
      if (numeroConexion==0) {  //Si la seleccion corresponde al primer nodo
        indexPrimeroSeleccionado = detectarSeleccion();  //Guardamos el index del nodo
        numeroConexion++;            //Pasamos al modo de segundo nodo
      } else if (numeroConexion==1) {  //Si está en modo segundo nodo
        indexSegundoSeleccionado = detectarSeleccion(); //Guardamos el index del segundo nodo
        numeroConexion++; //Pasamos al modo de seleccion nueva pareja
      }
      //println("Primero seleccionado = " + indexPrimeroSeleccionado + " Segundo seleccionado = " + indexSegundoSeleccionado + " Numero seleccion = " + numeroConexion);
      if (numeroConexion==2) {        
        numeroConexion=0;
        crearArista(nodos, indexPrimeroSeleccionado,indexSegundoSeleccionado);
        deseleccionarTodos();
      } //Nueva pareja
    }
  }
  

  
}

void displayNodos() { //Muestra todos los nodos menos el ultimo
  for (int i=0; i<nodos.size()-1; i++) {
    Nodo nodoCursor = nodos.get(i);   
    nodoCursor.display(); //Ejecuta el metodo display de todos los elementos del arrayList
  }
}

void displayAristas() { //Muestra todos los nodos menos el ultimo
  for (int i=0; i<=aristas.size()-1; i++) {
    Arista aristaCursor = aristas.get(i);   
    aristaCursor.display(); //Ejecuta el metodo display de todos los elementos del arrayList
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
      // println("Seleccion = " + i);
      return(i);  //Retornamos el index del objeto con el cual está colisionando
    } else {
      // println(i);
    }
  }
  return -1;  //Si no detecta colision retorna -1
}

void deseleccionarTodos() { //Vuelve todos los atributos "seleccion" false
  for (int i=0; i<nodos.size()-1; i++) {
    Nodo nodoCursor1 = nodos.get(i);
    nodoCursor1.seleccion = false;
  }
}

void crearArista(ArrayList<Nodo> arrayList ,int indexNodoPartida, int indexNodoLlegada){
  Nodo nodoPartida = nodos.get(indexNodoPartida);
  Nodo nodoLlegada = nodos.get(indexNodoLlegada);
  aristas.add(new Arista(nodoPartida, nodoLlegada));
}

void flecha(float x1, float y1, float x2, float y2, float offset) {
  push(); //Tomamos todos los estados
  float ancho = height* 0.025;  //Ancho respecto al tamaño de la pantalla
  float alto  = width * 0.008;  //Alto respecto al tamaño de la pantalla
  line(x1, y1, x2, y2);  //Dibujamos la linea de la flecha
  pushMatrix();
  translate(x2, y2);  //Trasladamos el origen a x2 y2
  //float a = atan((y2-y1)/(x2-x1));
  float a = atan2(y2-y1, x2-x1);  //obtenemos el angulo de rotacion
  rotate(a);   //rotamos
  fill(0);  
  stroke(0);
  triangle(0 - offset, 0, -ancho-offset, -alto/2, -ancho-offset, alto/2); //Dibujamos el triangulo
  popMatrix();    //Retomamos la rotacion
  pop(); //Retomamos los estados
} 
