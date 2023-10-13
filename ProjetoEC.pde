//Main Flow File

//Defines
boolean debugMode = true;

//UI Graphics
PImage background;
PImage questionImage;
ClickArea[] clickableAreas;
SceneBehaviour currentBehaviour;

//Text
PFont f;

void setup(){
  size(450, 800);
  PrintMainMenu();
  
  // Create the font from the .ttf file in the data folder
  f = createFont("SNACKID.otf", 25);
  textFont(f);
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
