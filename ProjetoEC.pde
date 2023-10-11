//Arquivo Principal

//UI Graphics
PImage background;
ClickArea[] loadedAreas;
SceneBehaviour currentBehaviour;

void setup(){
  size(450, 800);
  PrintMainMenu();
}

void draw(){
  if(currentBehaviour != null){
    currentBehaviour.Update();
  }
}

void mouseClicked(){
  CheckForTap();
}

public void CheckForTap(){
  //Check if the tap was inside any active loaded area1
  if(loadedAreas.length > 0 ){
    for(int i = 0; i < loadedAreas.length; i++){
      if(mouseX > loadedAreas[i].topLeftX && mouseX < loadedAreas[i].bottomRightX){
          if(mouseX < loadedAreas[i].topLeftY && mouseX > loadedAreas[i].bottomRightY){
            loadedAreas[i].storedCommand.OnClick();
          }
      }
    }
  }
}
