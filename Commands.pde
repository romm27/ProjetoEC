//Use this file to define and extend command calls.
//I should probably have done lambdas instead of inheritance for this
//Who the fuck am I typing this for

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
