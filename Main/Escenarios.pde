class escenario{
  int xi,yi,xf,yf;
  boolean suelo = false,techo = false,frente = false,detras = false;
  escenario(int tempx,int tempy,int tempa,int temph){
    xi=tempx;xf=tempa;
    yi=tempy;yf=temph;
  }
  void gen(){
    detector();
    face();
  }
  void detector(){
    boolean sueloI = false, techoI = false,frenteI = false,detrasI = false;
    if(jugador.Coord.x + 16 >= xi && jugador.Coord.x - 16 <= xi + xf){
      if((jugador.Coord.y + 32 >= yi || jugador.Coord.y + 33 >= yi )
        && jugador.Coord.y + 32 <= yi + yf/2){
        jugador.Coord.y = yi - 32;
        sueloI = true;
      } else if((jugador.Coord.y <= yi + yf  || jugador.Coord.y - 1<= yi + yf || jugador.Coord.y + 2 <= yi + yf || jugador.Coord.y + 3 <= yi + yf)
        && jugador.Coord.y >= yi){
        jugador.Coord.y = yi + yf;
        techoI = true;
      }
    }
    if(jugador.Coord.y + 30 <= yi + yf && jugador.Coord.y + 10 >= yi){
      if(jugador.Coord.x + 16 >= xi && jugador.Coord.x - 16 <= xi + xf){
        if(jugador.Coord.x + 16 <= xi + xf/2){jugador.Coord.x = xi - 16; frenteI = true;} 
        else if(jugador.Coord.x - 16 >= xi + xf/2){jugador.Coord.x = xi + xf + 16; detrasI = true;}
      } 
    }
    suelo = sueloI;
    techo = techoI;
    frente = frenteI;
    detras = detrasI;
  }
  void face(){
    noStroke();
    fill(0,0,255);
    if(suelo || techo || frente || detras){ fill(0);}
    copy(Suelo,0,0,32,32,xi,yi,32,32);
  }
}
/**************/
void creador(){
  boolean Si_suelo = false,Si_techo = false,Si_frente = false,Si_detras = false;
  for(int i = escenografia.size() - 1; i >= 0; i--){
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
  if(mousePressed){
    escenografia.add(new escenario((int)mouseX,(int)mouseY,32,32));
  }
}
