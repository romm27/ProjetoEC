import controlP5.*;
int scale = 100;

//UI
int topMargin = 50;
int buttonHSize = 200;
int buttonWSize = 100;
int buttonMargin = 50;

ControlP5 cp5;

void setup(){
  //Menu Principal
  cp5 = new ControlP5(this);
  int focusY = topMargin;
  size(450, 800);
  cp5.addButton("Conteúdo", 1f, buttonWSize, focusY, 300, buttonHSize);
  focusY += buttonHSize;
  focusY += buttonMargin;
  
  cp5.addButton("Quiz", 1f, buttonWSize, focusY, 300, buttonHSize);
  focusY += buttonHSize;
  focusY += buttonMargin;
  
  cp5.addButton("Configurações", 1f, buttonWSize, focusY, 300, buttonHSize);
}
