//Use this file to declare data structures.


//Describes an area of the canvas that is clickable.
public class ClickArea{
  //Pos
  int topLeftX, topLeftY;
  int bottomRightX, bottomRightY;
  public OnClickCommand storedCommand = null;
  
  
  public ClickArea(int x1, int y1, int x2,int y2, OnClickCommand command){
    topLeftX = x1;
    topLeftY = y1;
    bottomRightX = x2;
    bottomRightY = y2;
    storedCommand = command;
  }
}
