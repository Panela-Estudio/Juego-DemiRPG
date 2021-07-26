float[] frames = {0,0,0};
int acumulativa = 0;
int[] framesM = {5,7,3};

void A_Prota(int Type,int _x,int _y){
  float Maxframe = framesM[Type];
  int ancho = 32;
  PImage Actual;
  switch(Type){
    case 0:Actual = MOV_R;break;
    case 1:Actual = MOV_A;break;
    case 2:Actual = MOV_J;break;
    default:Actual = MOV_R;break;
  }
  copy(Actual,ancho*acumulativa,0,ancho,ancho,_x,_y,32,32);
  if(acumulativa < Maxframe){frames[Type] += 0.002;}
  else if(acumulativa >= Maxframe){frames[Type] = 0;};
  acumulativa += frames[Type];
}
void A_Ene_A(){
  
}
PImage MOV_R,MOV_L,MOV_J,MOV_A;
PImage Suelo;
void Loader_Image(){
  MOV_R = loadImage("Assets/Gabriel_Caminata.png");
  MOV_J = loadImage("Assets/Gabriel_Ataque.png");
  MOV_A = loadImage("Assets/Gabriel_Salto.png");
  Suelo = loadImage("Assets/Piso.png");
}
