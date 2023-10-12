//Main Flow File

//Defines
boolean debugMode = true;

//UI Graphics
PImage background;
ClickArea[] clickableAreas;
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
  //Check if the tap was inside any active loaded area
  if(debugMode){
    print("\n\n\n\n\n\n\n\n\n\n\n\n\n\n");
    print("x:" + mouseX + '\n');
    print("y:" + mouseY + '\n');
  }
  
  if(clickableAreas.length > 0 ){
    for(int i = 0; i < clickableAreas.length; i++){
      if(mouseX > clickableAreas[i].topLeftX && mouseX < clickableAreas[i].bottomRightX){
          if(mouseY > clickableAreas[i].topLeftY && mouseY < clickableAreas[i].bottomRightY){
            clickableAreas[i].storedCommand.OnClick();
            //print("Called!");
          }
      }
    }
  }
}
