//UI Graphics
PImage background;
ClickArea[] loadedAreas;

void setup(){
  size(450, 800);
  BuildMainMenu();
}

void mouseClicked(){
  checkForAreas();
}

public void checkForAreas(){
  //Check if the tap was inside any active loaded area
  if(loadedAreas.length > 0 ){
    for(int i = 0; i < loadedAreas.length; i++){
      if(mouseX > loadedAreas[i].topLeftX && mouseX < loadedAreas[i].bottomRightX){
          if(mouseX < loadedAreas[i].topLeftY && mouseX > loadedAreas[i].bottomRightY){
            print("Clickado!");
          }
      }
    }
  }
}

//Print Main Menu to Screen
public void BuildMainMenu(){
  //Load Images
  background = loadImage("mainmenu.png");
  
  //Main Menu
  background(165,165,255);
  image(background, 0, 0, width, height);
  
  //Assign
  loadedAreas = new ClickArea[3];
  loadedAreas[0] = new ClickArea(0,0,0,0);
}
