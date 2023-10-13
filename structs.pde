//Use this file to declare data structures.

//Describes an area of the canvas that is clickable.
public class ClickArea{
  //Pos
  int left, top, right, bottom; //Trigger area click position
  public OnClickCommand storedCommand = null; //Effect from click
  
  public ClickArea(int _left, int _top, int _right, int _bottom, OnClickCommand command){
    this.top = _top;
    this.bottom = _bottom;
    this.left = _left;
    this.right = _right;
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
