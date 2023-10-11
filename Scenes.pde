//Use this file to build scenes

//Call this function every time a scene is loaded for house keeping.
void PrintSceneBase(){
  currentBehaviour = null;
}

//Print Main Menu to Screen
public void PrintMainMenu(){
  //Load Images
  background = loadImage("mainmenu.png");
  
  //Main Menu
  background(165,165,255);
  image(background, 0, 0, width, height);
  
  //Extra Behaviour
  currentBehaviour = null;
  
  //Assign
  loadedAreas = new ClickArea[1];
  loadedAreas[0] = new ClickArea(0,0,0,0, new OnClickCommandOpenContent());
}

public void PrintContentPage(){
  //Load Images
  background = loadImage("content.png");
  
  //Main Menu
  background(165,165,255);
  image(background, 0, 0, width, height);
  
  //Extra Behaviour
  currentBehaviour = null;
  
  //Assign
  loadedAreas = new ClickArea[1];
  loadedAreas[0] = new ClickArea(0,0,0,0, new OnClickCommandOpenMainMenu()); //Return to main menu
}
