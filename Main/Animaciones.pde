/*
 Animaciones y imagenes
  Apartado de animaciones de personaje y enemigos:
    Estado: En trabajo.
*/
float[] frames = {0, 0, 0};
PImage[] MOV_Q = new PImage[2]; 
PImage MOV_R, MOV_L, MOV_J, MOV_A;
PImage Suelo;
PImage Items;
PImage Screen,H_Heal,H_Item;
void Loader_Image() {
  MOV_R = loadImage("Assets/Gabriel_Caminata.png");
  MOV_A = loadImage("Assets/Gabriel_Ataque.png");
  MOV_J = loadImage("Assets/Gabriel_Salto.png");
  MOV_Q[0] = loadImage("Assets/Gabriel_Quieto(1).png");
  MOV_Q[1] = loadImage("Assets/Gabriel_Quieto(-1).png");
  Suelo = loadImage("Assets/Piso.png");
  Items = loadImage("Assets/Items.png");
  Screen = loadImage("Assets/Title_Screen.png");
  H_Heal = loadImage("Assets/HUD_Heal.png");
  H_Item = loadImage("Assets/HUD_Items.png");
}
