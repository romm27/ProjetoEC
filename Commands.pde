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
