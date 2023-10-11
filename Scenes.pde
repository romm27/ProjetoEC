//Use this file to build scenes

//Print Main Menu to Screen
public void PrintMainMenu(){
  //Load Images
  background = loadImage("mainmenu.png");
  
  //Main Menu
  background(165,165,255);
  image(background, 0, 0, width, height);
  
  //Assign
  loadedAreas = new ClickArea[3];
  loadedAreas[0] = new ClickArea(0,0,0,0, new OnClickCommandOpenContent());
}

public void PrintContentPage(){
  //Load Images
  background = loadImage("content.png");
  
  //Main Menu
  background(165,165,255);
  image(background, 0, 0, width, height);
  
  //Assign
  loadedAreas = new ClickArea[2];
  loadedAreas[0] = new ClickArea(0,0,0,0, new OnClickCommandOpenMainMenu()); //Return to main menu
}
