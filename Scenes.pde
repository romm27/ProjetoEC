//Use this file to build scenes

//Call this function every time a scene is loaded for house keeping.
void PrintSceneBase(){
  //currentBehaviour = null;
  if(debugMode){
    print("\n Loaded clickable areas:" + str(clickableAreas.length));
  }
}

//Print Main Menu to Screen
public void PrintMainMenu(){
  //Load Images
  background = loadImage("mainmenu.png");
  logo = loadImage("logo.png");
  
  //Create the font from the file in the data folder. 
  f = createFont("SNACKID.otf", 50);
  textFont(f);
    
  //Main Menu
  background(165,165,255);
  //image(background, 0, 0, width, height);
  image(logo, 75, 30, 300 , 170);
  
  //Extra Behaviour
  currentBehaviour = null;
  
  //Buttons
  fill(255);
  stroke(0,0,0,0);
  rectMode(CENTER);

  fill(#7e7efe);
  rect(width/2+10, 297, 317, 110, 32);
  fill(255);
  rect(width/2, 287, 317, 110, 32);
  
  fill(#7e7efe);
  rect(width/2+10, 460, 317, 110, 32);
  fill(255);  fill(255);
  rect(width/2, 450, 317, 110, 32);
  
  fill(#7e7efe);
  rect(width/2+10, 623, 317, 110, 32);
  fill(255);
  rect(width/2, 613, 317, 110, 32);
  
  //Question text
  fill(#6057e0);// text color
  text("OPÇÕES", 123, 305);
  text("QUIZ", 155, 470);
  text("AUTORES", 105, 633);
  textSize(30);
  text("PUCPR", 170, 760);
    
  //Assign
  clickableAreas = new ClickArea[3];
  clickableAreas[0] = new ClickArea(66, 232, 384, 343, new OnClickCommandOpenOptions()); //Options
  clickableAreas[1] = new ClickArea(66, 396, 384, 506, new OnClickCommandOpenQuiz()); //Quiz
  clickableAreas[2] = new ClickArea(66, 558, 384, 669, new OnClickCommandOpenAuthors()); //Authors
  PrintSceneBase();
}

//Authors page
public void PrintAuthorsPage(){
  
  //Load Images
  background = loadImage("blankpage.png");
  
  //Authors Page
  background(165, 165, 255);
  image(background, 0, 0, width, height);
  
  //Extra Behaviour
  currentBehaviour = null; //<--- This page needs custom behaviour!!
  
  //Assign
  clickableAreas = new ClickArea[1];
  clickableAreas[0] = new ClickArea(15, 15, 85, 75, new OnClickCommandOpenMainMenu()); //Return to main menu
  PrintSceneBase();
}

//Quiz
public void PrintQuizPage(){
  //Load background
  background = loadImage("quiz.png");

  //Quiz Page
  background(165, 165, 255);
  image(background, 0, 0, width, height);
  
  //Extra Behaviour
  currentBehaviour = new QuizBehaviour(); //<--- This page needs custom behaviour!!
  
  //Question selection
  ArrayList grades = new ArrayList();
  grades.add("1");//Waiting for the options to select grades.
  ArrayList<Question> gradeQuestions = selectQuestionsByGrade(questions,grades);// ----> Waiting for the options to select grades.
  int selectedQuestion = selectQuestion(gradeQuestions);
  Question question = gradeQuestions.get(selectedQuestion);

  //Question text
  textSize(25);
  text(question.text, 40, 180);
  
  //Question image
  questionImage = loadImage(question.image);
  image(questionImage,(width/2-questionImage.width/2), 263);
    
  //Answers text
  String[] shuffledAnswers = question.shuffleAnswers();
  text(shuffledAnswers[0], 95, 536);//a)
  text(shuffledAnswers[1], 95, 602);//b)
  text(shuffledAnswers[2], 95, 675);//c)
  text(shuffledAnswers[3], 95, 741);//d)
  
  //Assign
  clickableAreas = new ClickArea[5];
  clickableAreas[0] = new ClickArea(15, 15, 85, 75, new OnClickCommandOpenMainMenu()); //Return to main menu
  clickableAreas[1] = new ClickArea(31, 505, 430, 547, new OnClickCommandAnswerVerifier(question, shuffledAnswers[0])); 
  clickableAreas[2] = new ClickArea(31, 574, 430, 615, new OnClickCommandAnswerVerifier(question, shuffledAnswers[1]));
  clickableAreas[3] = new ClickArea(31, 646, 430, 687, new OnClickCommandAnswerVerifier(question, shuffledAnswers[2])); 
  clickableAreas[4] = new ClickArea(31, 712, 430, 753, new OnClickCommandAnswerVerifier(question, shuffledAnswers[3])); 
  PrintSceneBase();
}

public void PrintOptionsPage(){

  //Load Images
  background = loadImage("blankpage.png");
  
  //Options page 
  background(165, 165, 255);
  image(background, 0, 0, width, height);
  
  //Extra Behaviour
  currentBehaviour = null;
  
  //Assign
  clickableAreas = new ClickArea[1];
  clickableAreas[0] = new ClickArea(15, 15, 85, 75, new OnClickCommandOpenMainMenu()); //Return to main menu

}

public void PrintCorrectAnswerPage(){
  //Load Images
  background = loadImage("correctanswer.png");
  
  //Correct answer  
  background(165, 165, 255);
  image(background, 0, 0, width, height);
  
  //Extra Behaviour
  currentBehaviour = null;
  
  //Assign
  clickableAreas = new ClickArea[2];
  clickableAreas[0] = new ClickArea(15, 15, 85, 75, new OnClickCommandOpenMainMenu()); //Return to main menu
  clickableAreas[1] = new ClickArea(149, 624, 300, 735, new OnClickCommandOpenQuiz()); //Go to the next question
  
  //Points
  right += 1;
  
  //Button
  fill(#7e7efe);
  rect(width/2+10, 690, 150, 110, 32);
  fill(255);
  rect(width/2, 680, 150, 110, 32); 
  //Button text
  textSize(50);
  fill(#6057e0);
  text("OK", 190, 700);
  
  PrintSceneBase();

  //delay(2000);
  //clickableAreas[1].storedCommand.OnClick();
}

public void PrintIncorrectPage(){
  //Load Images
  background = loadImage("incorrectanswer.png");
  
  //Incorrect page  
  background(165, 165, 255);
  image(background, 0, 0, width, height);
  
  //Extra Behaviour
  currentBehaviour = null;
  
  //Assign
  clickableAreas = new ClickArea[2];
  clickableAreas[0] = new ClickArea(15,15,85,75, new OnClickCommandOpenMainMenu()); //Return to main menu
  clickableAreas[1] = new ClickArea(149,624,300,735, new OnClickCommandOpenQuiz()); //Go to the next question
   
  //Points
  wrong += 1;
  
  //Button
  fill(#7e7efe);
  rect(width/2+10, 690, 150, 110, 32);
  fill(255);
  rect(width/2, 680, 150, 110, 32); 
  //Button text
  textSize(50);
  fill(#6057e0);
  text("OK", 190, 700);
  PrintSceneBase();

  //delay(2000);
  //clickableAreas[1].storedCommand.OnClick();
}

public void PrintEndgamePage(){
  //Load Images
  background = loadImage("endgame.jpeg"); //****needs the correct image file*****
  
  //Endgame page  
  background(165, 165, 255);
  image(background, 0, 0, width, height);
  
  //Extra Behaviour
  currentBehaviour = null;
  
  //Assign
  clickableAreas = new ClickArea[2];
  clickableAreas[0] = new ClickArea(15,15,85,75, new OnClickCommandOpenMainMenu()); //Return to main menu
  clickableAreas[1] = new ClickArea(149,624,300,735, new OnClickCommandOpenMainMenu()); //Return to main menu
  
  //Text
  textSize(50);
  fill(#21CE00);
  text(right, 110, 480);
  fill(#CE1500);
  text(wrong, 300, 480);
  
  //Button
  fill(#7e7efe);
  rect(width/2+10, 690, 150, 110, 32);
  fill(255);
  rect(width/2, 680, 150, 110, 32); 
  //Button text
  fill(#6057e0);
  text("OK", 190, 700); 
  PrintSceneBase();
}
