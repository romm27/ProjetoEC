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
  clickAreas = new ClickArea[2];
  // 50,380  250,330
  clickAreas[0] = new ClickArea(250, 380, 50, 330, new OnClickCommandOpenContent());
  clickAreas[1] = new ClickArea(550, 630, 50, 330, new OnClickCommandOpenContent());
  //loadedAreas[1] = new ClickArea(50,550,380,630, new OnClickCommandOpenOptions());
}

//Content Picker Page
public void PrintContentPage(){
  //Load Images
  background = loadImage("content.png");
  
  //Content Page
  background(165,165,255);
  image(background, 0, 0, width, height);
  
  //Extra Behaviour
  currentBehaviour = null; //<--- This page needs custom behaviour!!
  
  //Assign
  clickAreas = new ClickArea[1];
  clickAreas[0] = new ClickArea(15,15,85,75, new OnClickCommandOpenMainMenu()); //Return to main menu
}


//Quiz
public void PrintQuizPage(){
  //Load Images
  background = loadImage("quiz.png");
  
  //Content Page
  background(165,165,255);
  image(background, 0, 0, width, height);
  
  //Extra Behaviour
  currentBehaviour = null; //<--- This page needs custom behaviour!!
  
  //Assign
  clickAreas = new ClickArea[1];
  clickAreas[0] = new ClickArea(15,15,85,75, new OnClickCommandOpenMainMenu()); //Return to main menu
}
//Ana
public void PrintOptionsPage(){
  //Load Images
  background = loadImage("blankpage.png");
  
  //Main Menu
  background(165,165,255);
  image(background, 0, 0, width, height);
  
  //Extra Behaviour
  currentBehaviour = null;
  
  //Assign
  clickAreas = new ClickArea[1];
  clickAreas[0] = new ClickArea(15,15,85,75, new OnClickCommandOpenMainMenu()); //Return to main menu
}
