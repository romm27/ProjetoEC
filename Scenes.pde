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
  clickableAreas = new ClickArea[3];
  clickableAreas[0] = new ClickArea(75, 230, 380, 340, new OnClickCommandOpenContent()); //Conteúdo
  clickableAreas[1] = new ClickArea(70, 390, 390, 500, new OnClickCommandOpenQuiz()); //Desafios
  clickableAreas[2] = new ClickArea(70,540,380,640, new OnClickCommandOpenOptions()); //Opções
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
  clickableAreas = new ClickArea[1];
  clickableAreas[0] = new ClickArea(15,15,85,75, new OnClickCommandOpenMainMenu()); //Return to main menu
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
  clickableAreas = new ClickArea[1];
  clickableAreas[0] = new ClickArea(15,15,85,75, new OnClickCommandOpenMainMenu()); //Return to main menu
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
  clickableAreas = new ClickArea[1];
  clickableAreas[0] = new ClickArea(15,15,85,75, new OnClickCommandOpenMainMenu()); //Return to main menu
}
