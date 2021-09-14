class Entidad {
  PVector Coord = new PVector();
  PVector Base = new PVector(2, 3);
  PVector Swif = new PVector();
  boolean MoE = false, MoJ = false, MoL = false, MoR = false, Hostil = false, Floor = false; 
  boolean Front = false, Back = false, Roof = false;
  boolean AtackL = false, AtackH = false;
  int Heal, Armord, Damage;
  float tiempo = 0, tiempoA = 0, Tiempo = 0, T_Salto = 0;
  int frame = 0, dir = 1,x_D = 0,y_D = 2;
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
    imagen();
  }
  void Movimiento(int dir) {
    x += Base.x * dir;
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
    Coord.y += - Base.y*i + 7*tiempo;
  }
  void control() {
    if (Hostil == true) {
      inteligencia();
    } else {
      comandos();
    }
  }
  void animacion(int d,int h) {
    Tiempo += 0.4;
    if (frame >= 4) {
      frame = 0;
    }
    copy(MOV_Q[d], (int)32*frame, 32*h, 32, 32, (int)Coord.x-16, (int)Coord.y, 32, 32);
    if (Tiempo >= 10) {
      Tiempo = 0;
      frame += 1 * dir;
    }
  }
  void comandos() {
    if (MoR && !Front) {
      Movimiento(-1);
      x_D = 0;
      y_D = 1;
    }
    if (MoL && !Back) {
      Movimiento(1);
      x_D = 1;
      y_D = 1;
    }
    if (AtackL) {
      ataque();
    }
    if (MoJ && !Roof) {
      salto(1);
    } else if (!MoJ || Roof){
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
  void imagen(){
    if(MoR || MoL){animacion(x_D,y_D);}
    else if(!Floor){animacion(x_D,2);} 
    else {animacion(x_D,0);}
  }
}
/***************************************************
 ***************************************************/
