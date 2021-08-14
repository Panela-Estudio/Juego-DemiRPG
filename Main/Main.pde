/*****
 Que es este juego, es un juego "rpg" es solo ir dando hostias con una espada
 ***/
Entidad jugador;
ArrayList <escenario> escenografia;
ArrayList <Entidad> jugadores;
escenario piso;
boolean creado = true;
int lvl = 1;
String[]Pantalla;
int[][] Lv = new int[16][33];
String []z;
void setup() {
  size(1000, 600);
  jugador = new Entidad(width/2, height/2, 3, 3, 3, false);
  jugadores = new ArrayList<Entidad>();
  jugadores.add(new Entidad(width/2, height/2, 3, 3, 3, false));
  escenografia = new ArrayList<escenario>();
  nose = new ArrayList<Ataque>();
<<<<<<< HEAD
  Loader_Image(); 
  
  Pantalla = loadStrings("Stage/"+lvl+".txt");
=======
  Loader_Image();
>>>>>>> faa441dbb474ddbb9896a2e9351ccb1c85220fdb
}
void draw() {
  background(111, 111, 132);
  Pantalla();
}
void keyPressed() {
  switch(key) {
  case 'a':
  case 'A':
    jugador.MoL = true;
    break;
  case 'd':
  case 'D':
    jugador.MoR = true;
    break;
  case 'w':
  case 'W':
    jugador.MoJ = true;
    jugador.Floor = false;
    break;
  case 's':
  case 'S':
    break;
  case 'j':
  case 'J':
    jugador.AtackL = true;
    break;
  case 'k':
  case 'K':
    break;
  }
}
void keyReleased() {
  switch(key) {
  case 'a':
  case 'A':
    jugador.MoL = false;
    break;
  case 'd':
  case 'D':
    jugador.MoR = false;
    break;
  case 'w':
  case 'W':
    jugador.MoJ = false;
    break;
  case 's':
  case 'S':
    break;
  case 'j':
  case 'J':
    jugador.AtackL = false;
    break;
  case 'k':
  case 'K':
    nose.add(new Ataque((int)jugador.Coord.x, (int)jugador.Coord.y, 1, false));
    break;
  }
}
<<<<<<< HEAD
void Nivel(){
  
  for (int i=0; i<Pantalla.length; i++){
    z = split(Pantalla[i], ',');
    for(int j = 0; j<z.length;j++){
      Lv[i][j]= int(z[j]);
    }
  
  }
  
  for(int i = 0; i < Lv.length; i++){
    for(int j = 0; j < Lv[i].length; j++){
      switch(Lv[i][j]){
        case 1:
        escenografia.add(new escenario(j*32,i*32,32,32,(int)random(0,1.9)));
=======
void Nivel() {
  for (int i = 0; i < Pantalla.length; i++) {
    for (int j = 0; j < Pantalla[i].length; j++) {
      switch(Pantalla[i][j]) {
      case 0:
        if (Pantalla[i][j - 1] == 1 && Pantalla[i-1][j] == 1) {
          escenografia.add(new escenario(j*32, i*32, 0, 0, 6));
        } else if (Pantalla[i][j + 1] == 1 && Pantalla[i-1][j] == 1){
          escenografia.add(new escenario(j*32, i*32, 0, 0, 7));
        }
>>>>>>> faa441dbb474ddbb9896a2e9351ccb1c85220fdb
        break;
      case 1:
        if (i >= 1 && Pantalla[i-1][j] == 1) {
          escenografia.add(new escenario(j*32, i*32, 32, 32, (int)random(4, 5.9)));
        } else {
          escenografia.add(new escenario(j*32, i*32, 32, 32, (int)random(0, 1.9)));
        }          
        break;
      case 2:
        escenografia.add(new escenario(j*32, i*32, 0, 0, 2));
        break;
      case 3:
        escenografia.add(new escenario(j*32, i*32, 0, 0, 3));
        break;
      }
    }
  }
  creado = false;
}
