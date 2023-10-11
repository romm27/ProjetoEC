//Use this file to declare data structures.

//Describes an area of the canvas that is clickable.
public class ClickArea{
  //Pos
  int topLeftX, topLeftY; //Trigger area click position
  int bottomRightX, bottomRightY; //Trigger area click position
  public OnClickCommand storedCommand = null; //Effect from click
  
  public ClickArea(int x1, int y1, int x2,int y2, OnClickCommand command){
    topLeftX = x1;
    topLeftY = y1;
    bottomRightX = x2;
    bottomRightY = y2;
    storedCommand = command;
  }
}

//Describes a Special behaviour from a specific scene
public class SceneBehaviour{
  public void Update(){}
}

public class QuizBehaviour extends SceneBehaviour{
  public void Update(){
    
  }
}
