

//UI Graphics
PImage background;

void setup(){
  size(450, 800);
  //Load Images
  background = loadImage("background.png");
  
  //Main Menu
  background(165,165,255);
  image(background, 0, 0, width, height);
  
}
