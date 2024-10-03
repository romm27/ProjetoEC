import processing.video.*;

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
  
  //Reset score
  lastHighScore = right;
  right = 0;
  wrong = 0;
  askedQuestions = new ArrayList();
  
}

//Authors page
public void PrintAuthorsPage(){
  
  //Load Images
  background = loadImage("blankpage.png");
  
  //Authors Page
  background(165, 165, 255);
  image(background, 0, 0, width, height);
  
  //Extra Behaviour
  currentBehaviour = new AuthorsPageBehaviour(); //<--- This page needs custom behaviour!!
  
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
  ArrayList grades = GetSelectedGrades();
  ArrayList<Question> gradeQuestions = selectQuestionsByGrade(questions, grades);//////***** Waiting for the options to select grades.******
  ArrayList<Question> availableQuestion = new ArrayList();
  
  for (int i = 0 ; i < gradeQuestions.size(); i++){
    if (!askedQuestions.contains(gradeQuestions.get(i).id)){
      availableQuestion.add(gradeQuestions.get(i));
    }
  }

  if (availableQuestion.size() == 0){
    PrintEndgamePage();
    return;
  }

  int selectedQuestion = selectQuestion(availableQuestion);
  Question question = availableQuestion.get(selectedQuestion);
  askedQuestions.add(question.id);
  
  //Question image
  questionImage = loadImage(question.image);
  image(questionImage,(width/2-questionImage.width/2), 263);

  //Question text
  textSize(25);
  text(question.breakLine(), 40, 180);
    
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
  background = loadImage("purplepage.png");
  
  //Options page 
  background(165, 165, 255);
  image(background, 0, 0, width, height);
  
  //Extra Behaviour
  currentBehaviour = null;
  
  //White background rectangle
  rectMode(CENTER);
  fill(#7e7efe);
  rect(width/2 + 10, 410, 410, 510, 32);
  fill(255);
  rect(width/2, 400, 410, 510, 32);
  
  color selectedColor = #AF1CAD;
  color unselectedColor = #909090;
  //text
  fill(#7e7efe);
  textSize(40);
  text("Escolha as séries", 55, 210);
  if(firstgrade) fill(selectedColor); else fill(unselectedColor);
  text("1", 90, 260);
  if(secondGrade) fill(selectedColor); else fill(unselectedColor);
  text("2", 150, 260);
  if(thirdGrade) fill(selectedColor); else fill(unselectedColor);
  text("3", 210, 260);
  if(forthGrade) fill(selectedColor); else fill(unselectedColor);
  text("4", 275, 260);
  if(fifthGrade) fill(selectedColor); else fill(unselectedColor);
  text("5", 336, 260);
  
  fill(#7e7efe);
  text("Música", 160, 350);
  if(playMusic) fill(selectedColor); else fill(unselectedColor);
  text("Ligado", 50, 400);
  if(!playMusic) fill(selectedColor); else fill(unselectedColor);
  text("Desligado", 220, 400);
  
  fill(#7e7efe);
  text("Última pontuação:", 50, 550);
  String score = str(lastHighScore);
  text(score, 200, 610);//// Precisa colocar a pontuação correta
  
  //Button
  fill(#7e7efe);
  rect(width/2 + 10, 740, 150, 110, 32);
  fill(255);
  rect(width/2, 730, 150, 110, 32); 
  //Button text
  textSize(50);
  fill(#6057e0);
  text("OK", 190, 745); 
  
  //Assign
  clickableAreas = new ClickArea[8];
  clickableAreas[0] = new ClickArea(15, 15, 85, 75, new OnClickCommandOpenMainMenu()); //Return to main menu
  clickableAreas[1] = new ClickArea(40, 350, 400, 400, new OnClickCommandSwitchSound()); //Switch Sound
  clickableAreas[2] = new ClickArea(80, 220, 110, 260, new OnClickCommand1stGrade()); //1 Grade
  clickableAreas[3] = new ClickArea(150, 220, 180, 260, new OnClickCommand2thGrade()); //2 Grade
  clickableAreas[4] = new ClickArea(200, 220, 240, 260, new OnClickCommand3rdGrade()); //3 Grade
  clickableAreas[5] = new ClickArea(270, 220, 300, 260, new OnClickCommand4thGrade()); //4 Grade
  clickableAreas[6] = new ClickArea(330, 220, 360, 260, new OnClickCommand5thGrade()); //5 Grade
  clickableAreas[7] = new ClickArea(170, 675, 300, 780, new OnClickCommandSettingsOkButton()); //Ok 
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
  clickableAreas = new ClickArea[1];
  clickableAreas[0] = new ClickArea(15, 15, 85, 75, new OnClickCommandOpenMainMenu()); //Return to main menu1
  
  //Points
  right += 1;
  
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
  clickableAreas = new ClickArea[1];
  clickableAreas[0] = new ClickArea(15,15,85,75, new OnClickCommandOpenMainMenu()); //Return to main menu
   
  //Points
  wrong += 1;
  
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
