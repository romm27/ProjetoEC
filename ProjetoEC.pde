//Main Flow File

//Defines
boolean debugMode = true;

//UI Graphics
PImage background;
ClickArea[] clickableAreas;
SceneBehaviour currentBehaviour;

// Click areas <- ArrayList push 


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
  
  for(int i = 0; i < clickableAreas.length; i++){
    if(mouseX > clickableAreas[i].left && mouseX < clickableAreas[i].right &&
       mouseY > clickableAreas[i].top && mouseY < clickableAreas[i].bottom){
          clickableAreas[i].storedCommand.OnClick();
          print("Called!");
        }
    }
}
