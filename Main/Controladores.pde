int Pablo = 0;
int SI = 0;
void Pantalla() {
  if (keyPressed && key != ESC) {
    Pablo ++;
  } else if (key == ESC) {
    key = '1';
    Pablo = 0;
  }
  if (Pablo >= 1) { 
    if (!creado) {
      creador();
      jugador.gen();
      captador();
    }
    if (creado) {
      Nivel();
    }
  } else {
    image(Screen, 0, 0);
    fill(2*SI);
    textSize(20);
    textAlign(CENTER,CENTER);
    text("Presiona un boton para iniciar y no seas imbecil a precionar ESC",width/2,9*height/10);
    if(SI >= 125){SI = 50;}
    SI++;
  }
}
