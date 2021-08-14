class escenario {
  int xi, yi, xf, yf;
  boolean suelo = false, techo = false, frente = false, detras = false;
  int tipo = 16, Alto, Ancho, tipox, tipoy;
  escenario(int tempx, int tempy, int tempa, int temph, int _tipo) {
    xi=tempx;
    xf=tempa;
    yi=tempy;
    yf=temph;
    switch(_tipo) {
    case 0://Primer cubo
      tipox = 0;
      tipoy = 0;
      Ancho = 2;
      Alto = 2;
      break;
    case 1://Segundo cubo
      tipox = 2;
      tipoy = 0;
      Alto = 2;
      Ancho = 2;
      break;
    case 2://Ventana
      tipox = 4;
      tipoy = 0;
      Ancho = 2;
      Alto = 4;
      break;
    case 3://Gargola
      tipox = 6;
      tipoy = 0;
      Ancho = 2;
      Alto = 4; 
      break;
    case 4://bloque de debajo
      tipox = 0;
      tipoy = 2;
      Ancho = 2;
      Alto = 2;
      break;
    case 5://bloque de debajo calavera
      tipox = 2;
      tipoy = 2;
      Ancho = 2;
      Alto = 2;
      break;
    case 6:
      tipox = 10;
      tipoy = 0;
      Ancho = 2;
      Alto = 2;
      break;
    case 7:
      tipox = 10;
      tipoy = 2;
      Ancho = 2;
      Alto = 2;
      break;
    }
  }
  void gen() {
    detector();
    face();
  }
  void detector() {
    boolean sueloI = false, techoI = false, frenteI = false, detrasI = false;
    if ((jugador.Coord.x - 15 >= xi && jugador.Coord.x - 15 <= xi + xf) || (jugador.Coord.x + 15 >= xi && jugador.Coord.x + 15 <= xi + xf)) {
      if (jugador.Coord.y + 32 >= yi && jugador.Coord.y + 32 <= yi + yf/2) {
        jugador.Coord.y = yi - 32;
        sueloI = true;
      } else if (jugador.Coord.y <= yi + yf && jugador.Coord.y >= yi) {          
        techoI = true;
      }
    }
    if ((jugador.Coord.y + 30 <= yi + yf && jugador.Coord.y + 30 >= yi) || (jugador.Coord.y + 10 <= yi + yf && jugador.Coord.y + 10 >= yi)) {
      if (jugador.Coord.x + 16 >= xi && jugador.Coord.x - 16 <= xi + xf) {
        if (jugador.Coord.x + 16 <= xi + xf/2) {
          jugador.Coord.x = xi - 16; 
          frenteI = true;
        } else if (jugador.Coord.x - 16 >= xi + xf/2) {
          jugador.Coord.x = xi + xf + 16; 
          detrasI = true;
        }
      }
    }
    suelo = sueloI;
    techo = techoI;
    frente = frenteI;
    detras = detrasI;
  }
  void face() {    
    copy(Suelo, tipox*tipo, tipoy*tipo, Ancho*tipo, Alto*tipo, xi, yi, Ancho*tipo, Alto*tipo);
  }
}
/**************/
void creador() {
    Boolean Si_suelo = false, Si_techo = false, Si_frente = false, Si_detras = false;
    for (int i = escenografia.size() - 1; i >= 0; i--) {
      escenario pedazo = escenografia.get(i);
      pedazo.gen();
      Si_suelo = Si_suelo | pedazo.suelo;
      Si_techo = Si_techo | pedazo.techo;
      Si_frente = Si_frente | pedazo.frente;
      Si_detras = Si_detras | pedazo.detras;
      jugador.Floor = Si_suelo;
      jugador.Roof = Si_techo;
      jugador.Front = Si_frente;
      jugador.Back = Si_detras;
    }
  if (mousePressed) {
    escenografia.add(new escenario((int)mouseX, (int)mouseY, 32, 32, 0));
  }
}
