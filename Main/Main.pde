/*****
 Que es este juego, es un juego "rpg" es solo ir dando hostias con una espada
 ***/
Entidad jugador;
ArrayList <escenario> escenografia;
ArrayList <Entidad> enemigos;
escenario piso;
boolean creado = true;
int [][]Pantalla = {
  {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}, 
  {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1}, 
  {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1}, 
  {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1}, 
  {1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1}, 
  {1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1}, 
  {1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1}, 
  {1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1}, 
  {1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}, 
  {1, 1, 0, 0, 0, 1, 0, 0, 2, 0, 0, 2, 0, 0, 2, 0, 0, 2, 0, 0, 2, 0, 0, 2, 0, 0, 2, 0, 0, 2, 0, 1}, 
  {1, 0, 0, 0, 0, 1, 0, 0, 5, 0, 0, 5, 0, 0, 5, 0, 0, 0, 0, 0, 5, 0, 0, 5, 0, 0, 5, 0, 0, 5, 0, 1}, 
  {1, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 1}, 
  {1, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1}, 
  {1, 1, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 3, 0, 0, 0, 1}, 
  {1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0, 0, 1}, 
  {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}};
void setup() {
  size(1000, 600);
  jugador = new Entidad(width/2, height/2, 3, 3, 3, false);
  escenografia = new ArrayList<escenario>();
  nose = new ArrayList<Ataque>();
  Loader_Image(); 
}
void draw() {
  background(111,111,132);
  if(!creado){creador();jugador.gen();captador();}
  if(creado){Nivel();}
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
    nose.add(new Ataque((int)jugador.Coord.x,(int)jugador.Coord.y,1,false));
    break;
  }
}
void Nivel(){
  for(int i = 0; i < Pantalla.length; i++){
    for(int j = 0; j < Pantalla[i].length; j++){
      switch(Pantalla[i][j]){
        case 1:
        escenografia.add(new escenario(j*32,i*32,32,32,(int)random(0,1.9)));
        break;
        case 2:
        escenografia.add(new escenario(j*32,i*32,0,0,2));
        break;
        case 3:
        escenografia.add(new escenario(j*32,i*32,0,0,3));
        break;
      }
    }
  }
  creado = false;
}