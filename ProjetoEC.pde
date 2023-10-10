import controlP5.*;
int scale = 100;

//UI Settings
int topMargin = 100;
int buttonHSize = 140;
int buttonWSize = 220;
int buttonMargin = 35;

//UI Graphics
PImage logo;
PImage logoAlt;

ControlP5 cp5;

void setup(){
  //Load Images
  logo = loadImage("logo.png");
  logoAlt = loadImage("logo_alt.png");
  
  //Main Menu
  background(165,165,255);
  cp5 = new ControlP5(this);
  
  //Extra
  image(logoAlt, 0,0, 150,90);
  
  //Buttons
  int focusY = topMargin;
  int constButtonW = (width/2)- (buttonWSize/2);
  size(450, 800);
  cp5.addButton("Conteúdo", 1f, constButtonW, focusY, buttonWSize, buttonHSize);
  focusY += buttonHSize;
  focusY += buttonMargin;
  
  cp5.addButton("Quiz", 1f, constButtonW, focusY, buttonWSize, buttonHSize);
  focusY += buttonHSize;
  focusY += buttonMargin;
  
  cp5.addButton("Configurações", 1f, constButtonW, focusY, buttonWSize, buttonHSize);
}
