/*****
Que es este juego, es un juego "rpg" es solo ir dando hostias con una espada
***/
Entidad jugador;
ArrayList <escenario> escenografia;
ArrayList <Entidad> enemigos;
escenario piso;
void setup(){
  size(1000,500);
  jugador = new Entidad(width/2,height/2,3,3,3,false);
  piso = new escenario(0,height/2 + 20,width,30);
  escenografia = new ArrayList<escenario>();
  Loader_Image();
}
void draw(){
  background(255);
  creador();
  jugador.gen();
}
void keyPressed(){
  switch(key){
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
void keyReleased(){
  switch(key){
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
    break;
  }
}
void colisionador(){
 boolean Si_suelo = false,Si_techo = false,Si_frente = false,Si_detras = false;
 Si_suelo = Si_suelo | piso.suelo;
 Si_techo = Si_techo | piso.techo;
 Si_frente = Si_frente | piso.frente;
 Si_detras = Si_detras | piso.detras;
 jugador.Floor = Si_suelo;
}
