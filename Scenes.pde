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
  background = loadImage("blankpage.png");
  
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
  questionImage = loadImage("tabela.png");
  
  //Content Page
  background(165,165,255);
  image(background, 0, 0, width, height);
  
  //Extra Behaviour
  currentBehaviour = null; //<--- This page needs custom behaviour!!
  
  //Assign
  clickableAreas = new ClickArea[1];
  clickableAreas[0] = new ClickArea(15,15,85,75, new OnClickCommandOpenMainMenu()); //Return to main menu
  
  //Question text
  fill(#6057e0);// text color
  text("Qual desses resultados está\nerrado? Qual seria a resposta\ncorreta?", 40,180);
  
  //Question image
  image(questionImage,(width/2-questionImage.width/2),263);
    
  //Answers text
  text("7 e 9", 95,536);//a)
  text("18 e 22", 95,602);//b)
  text("7 e 8", 95,675);//c)
  text("22 e 23", 95,741);//d)
  
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
