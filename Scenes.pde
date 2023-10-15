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
  clickableAreas[0] = new ClickArea(75, 230, 380, 340, new OnClickCommandOpenContent()); //Content
  clickableAreas[1] = new ClickArea(70, 390, 390, 500, new OnClickCommandOpenQuiz()); //Qiz
  clickableAreas[2] = new ClickArea(70,540,380,640, new OnClickCommandOpenOptions()); //Options
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
  //Load background
  background = loadImage("quiz.png");
  
  //Content Page
  background(165,165,255);
  image(background, 0, 0, width, height);
  
  //Extra Behaviour
  currentBehaviour = null; //<--- This page needs custom behaviour!!
  
  //Question selection
  ArrayList<Question> gradeQuestions = selectQuestionsByGrade(questions,"1");// ----> grade is not selected by user yet
  int selectedQuestion = selectQuestion(gradeQuestions);
  Question question = gradeQuestions.get(selectedQuestion);
  print(question);

  //Question text
  fill(#6057e0);// text color
  text(question.text , 40,180);
  
  //Question image
  questionImage = loadImage(question.image);
  image(questionImage,(width/2-questionImage.width/2),263);
    
  //Answers text
  String[] shuffledAnswers = question.shuffleAnswers();
  text(shuffledAnswers[0], 95,536);//a)
  text(shuffledAnswers[1], 95,602);//b)
  text(shuffledAnswers[2], 95,675);//c)
  text(shuffledAnswers[3], 95,741);//d)
  
  //Assign
  clickableAreas = new ClickArea[5];
  clickableAreas[0] = new ClickArea(15,15,85,75, new OnClickCommandOpenMainMenu()); //Return to main menu
  clickableAreas[1] = new ClickArea(31, 505, 430, 547, new OnClickCommandAnswerVerifier(question, shuffledAnswers[0])); 
  clickableAreas[2] = new ClickArea(31, 574, 430, 615, new OnClickCommandAnswerVerifier(question, shuffledAnswers[1]));
  clickableAreas[3] = new ClickArea(31,646,430,687, new OnClickCommandAnswerVerifier(question, shuffledAnswers[2])); 
  clickableAreas[4] = new ClickArea(31,712,430,753, new OnClickCommandAnswerVerifier(question, shuffledAnswers[3])); 
  
}

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

public void PrintCorrectAnswerPage(){
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
  
  //Text
  text("Resposta correta!", 40,180); 
  
  //Points
  right += 1;
  print(right);
  
}

public void PrintCorrectIncorrectPage(){
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
  
  //Text
  text("Resposta incorreta!", 40,180);
  
  //Points
  wrong += 1;
  print(wrong);
  
}
