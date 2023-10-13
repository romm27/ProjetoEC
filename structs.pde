//Use this file to declare data structures.

//Describes an area of the canvas that is clickable.
public class ClickArea{
  //Pos
  int top, bottom, left, right; //Trigger area click position
  public OnClickCommand storedCommand = null; //Effect from click
  
  public ClickArea(int top, int bottom, int left, int right, OnClickCommand command){
    this.top = top;
    this.bottom = bottom;
    this.left = left;
    this.right = right;
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
