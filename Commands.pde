//Use this file to define and extend command calls.
//I should probably have done lambdas instead of inheritance for this

public class OnClickCommand {
  public void OnClick(){}
}

//Return to Main Menu
public class OnClickCommandOpenMainMenu extends OnClickCommand{
  public void OnClick(){
    PrintMainMenu();
  }
}

//Open Content Menu
public class OnClickCommandOpenContent extends OnClickCommand{
  public void OnClick(){
    PrintContentPage();
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
    
    if (this.shuffledAnswer.equals(this.question.answers[0])) {
      PrintCorrectAnswerPage();
      println(this.question.text);
      println(this.question.answers[0]);
      
    }
    else {
     PrintCorrectIncorrectPage();
     println(this.question.text);
     println(this.question.answers[0]);

    }
  }
}
