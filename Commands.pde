//
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
