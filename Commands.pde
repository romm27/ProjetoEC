//Use this file to define and extend command calls.
//I should probably have done lambdas instead of inheritance for this

public class OnClickCommand {
  public void OnClick(){}
}

//Return to Main Menu
public class OnClickCommandOpenMainMenu extends OnClickCommand{
  public void OnClick(){
    waitingForQuizSwitch = false; //<-- in case the user cancels the current question
    PrintMainMenu();
  }
}

//Open Authors Page
public class OnClickCommandOpenAuthors extends OnClickCommand{
  public void OnClick(){
    PrintAuthorsPage();
  }
}

//Open Quiz
public class OnClickCommandOpenQuiz extends OnClickCommand{
  public void OnClick(){
    PrintQuizPage();
  }
}

//Open Options Menu
public class OnClickCommandOpenOptions extends OnClickCommand{
  public void OnClick(){
    PrintOptionsPage();
  }
}

//Open correct or incorrect answer page
public class OnClickCommandAnswerVerifier extends OnClickCommand{
  public Question question;
  public String shuffledAnswer;
  
  public OnClickCommandAnswerVerifier(Question question, String shuffledAnswer) {
   super();
   this.question = question;
   this.shuffledAnswer = shuffledAnswer;

  }
  
  public void OnClick(){
    asnwerOpenTime = millis();
    waitingForQuizSwitch = true;
    if (this.shuffledAnswer.equals(this.question.answers[0])) {
      PrintCorrectAnswerPage();
    }
    else {
      PrintIncorrectPage();
    }
  }
}

//Open Endgame Page
public class OnClickCommandOpenEndgame extends OnClickCommand{
  public void OnClick(){
    PrintEndgamePage();
  }
}

public class OnClickCommandSettingsOkButton extends OnClickCommand{
  public void OnClick(){
    //Check for valid grade selection
    if(!firstgrade && !secondGrade && !thirdGrade && !forthGrade && !fifthGrade){ //<-- automatically selects the first grade if all are disabled!
      firstgrade = true;
    }
    
    SaveSettings();
    PrintMainMenu();
  }
}

//Change Options
public class OnClickCommandSwitchSound extends OnClickCommand{ // Mutes/Unmutes Music
  public void OnClick(){
    playMusic = !playMusic;
    
    if(playMusic) musica.play(); else musica.pause();

    //Update Screen
    PrintOptionsPage();
  }
}

//Grade Commands
public class OnClickCommand1stGrade extends OnClickCommand{
  public void OnClick(){
    ModifySeries(1);
  }
}

public class OnClickCommand2thGrade extends OnClickCommand{
  public void OnClick(){
    ModifySeries(2);
  }
}

public class OnClickCommand3rdGrade extends OnClickCommand{
  public void OnClick(){
    ModifySeries(3);
  }
}

public class OnClickCommand4thGrade extends OnClickCommand{
  public void OnClick(){
    ModifySeries(4);
  }
}
public class OnClickCommand5thGrade extends OnClickCommand{
  public void OnClick(){
    ModifySeries(5);
  }
}
