class Entidad {
  PVector Coord = new PVector();
  PVector Base = new PVector(2, 3);
  PVector Swif = new PVector();
  boolean MoE = false, MoJ = false, MoL = false, MoR = false, Hostil = false, Floor = false; 
  boolean Front = false, Back = false, Roof = false;
  boolean AtackL = false, AtackH = false;
  int Heal, Armord, Damage;
  float tiempo = 0, tiempoA = 0, Tiempo = 0;
  int frame = 0, dir = 1;
  Entidad(float tempx, float tempy, int tempH, int tempA, int tempD, boolean tempHo) {
    Coord.x = tempx;
    Coord.y = tempy;
    Heal = tempH;
    Damage = tempD;
    Armord = tempA;
    Hostil = tempHo;
  }  
  void gen() {
    control();
    comandos();
    animacion();
    imagen();
  }
  void Movimiento(int dir) {
    Coord.x += Base.x * dir;
  }
  void ataque() {
    tiempoA += 2;
    if (tiempoA >= 180 ) {
      tiempoA = 0;
    }
    Swif.x = Coord.x + 10*cos(tiempoA*(TWO_PI)/180);
    Swif.y = Coord.y + 5;
  }
  void salto(int i) {
    if (Floor) {
      tiempo = 0;
    } else if (!Floor) {
      tiempo += 0.01;
    }
    Coord.y += - Base.y*i + 6*tiempo;
  }
  void control() {
    if (Hostil == true) {
      inteligencia();
    } else {
      comandos();
    }
  }
  void animacion() {
    Tiempo += 0.2;
    if (Tiempo >= 10) {
      Tiempo = 0;
      frame += 1 * dir;
    } 
    if (frame >= 2 || frame <= 0) {
      dir = -1*dir;
    }
    copy(MOV_Q, (int)32*frame, 0, 32, 32, (int)Coord.x-16, (int)Coord.y, 32, 32);
  }
  void comandos() {
    if (MoR && !Front) {
      Movimiento(1);
    }
    if (MoL && !Back) {
      Movimiento(-1);
    }
    if (AtackL) {
      ataque();
    }
    if (MoJ && !Roof) {
      salto(1);
    } else if (!MoJ || Roof) {
      salto(0);
    }
  }
  void inteligencia() {
    if (jugador.Coord.x >= Coord.x + 32) {
      Movimiento(1);
    } else if (jugador.Coord.x <= Coord.x - 32) {
      Movimiento(-1);
    }
    if (jugador.Coord.x < Coord.x + 32 && jugador.Coord.x > Coord.x - 32) {
      ataque();
    }
  }
  void imagen() {
    fill(255, 0, 0);

    if (AtackL) {
      fill(0, 255, 0);
      rect(Swif.x, Swif.y, 30, 10);
    }
  }
}
/***************************************************
 ***************************************************/
