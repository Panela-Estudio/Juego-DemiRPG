int Pablo = 3, Selector = 1;
boolean Enter = false, Back = false, Arriba = false, Abajo = false;
void Menu() {
  textAlign(CENTER, CENTER);
  textSize(20);
  if(keyPressed && Pablo == 3){
    Pablo = 4;
  }
  if (Enter && Pablo != 3) {
    Pablo = Selector;
  } else if (Back) {
    Pablo = 4;
  } else if (Arriba && Selector > 0) {
    Selector --;
    Arriba = false;
  } else if (Abajo && Selector < 2) {
    Selector ++;
    Abajo = false;
  }
  switch(Pablo) {
  case 0://Juego como tal
  game();
    break;
  case 1://Pantalla de antes
  image(Screen, 0, 0);
  text("Presione + para salir",width/2,6*height/10);
    break;
  case 2://Pantalla con menus
  image(Screen, 0, 0);
  text("Presione + para salir",width/2,6*height/10);
    break;
  case 3://Pantalla con configuracione
  inicio();
    break;
  case 4://Si algo
  selector();
    break;
  }
}
void inicio() {
  image(Screen, 0, 0);
  fill(255);
  text("Presiona un boton para iniciar y no seas imbecil a precionar ESC", width/2, 9*height/10);
}
void selector() {
  image(Screen, 0, 0);
  switch(Selector) {
  case 0:
    fill(255, 0, 0);
    text("Empezar", width/2, 6*height/10);
    fill(255);
    text("Configuracion", width/2, height*7/10);
    text("Pablo", width/2, height*8/10);
    break;
  case 1:
    fill(255);
    text("Empezar", width/2, height*6/10);
    text("Pablo", width/2, height*8/10);
    fill(255, 0, 0);
    text("Configuracion", width/2, height*7/10);      
    break;
  case 2:
    fill(255);
    text("Empezar", width/2, height*6/10);
    text("Configuracion", width/2, height*7/10);
    fill(255, 0, 0);
    text("Pablo", width/2, height*8/10);
    break;
  }
}
void game() {
  if (!creado) {
    creador();
    jugador.gen();
    captador();
  }
  if (creado) {
    Nivel();
  }
}
