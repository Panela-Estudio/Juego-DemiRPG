class Ataque {
  PVector MOV = new PVector();
  int velocidad = 5, dir, clase, angulo = 0;
  boolean tiempo, fisica;
  Ataque(int _x, int _y, int _dir, boolean _fisic) {
    MOV.x =_x - 8;
    MOV.y =_y;
    fisica = _fisic;
    dir = _dir;
  }
  void gen() {
    movimiento();
    face();
  }
  void movimiento() {
    MOV.x += velocidad*dir;
    if (fisica) {
      MOV.y -= cos(angulo*PI/180); 
      angulo += 1;
    }
  }
  void face() {
    copy(Items, 16, 16, 16, 16, (int)MOV.x, (int)MOV.y, 16, 16);
  }
}
ArrayList <Ataque> nose;
void captador() {
  for (int i = nose.size() - 1; i >= 0; i--) {
    Ataque javier = nose.get(i);
    javier.gen();
    if (javier.MOV.x >= 1000 || javier.MOV.x <= 0 || javier.MOV.y >= 500 || javier.MOV.y <= 0) {
      nose.remove(i);
    }
  }
}
