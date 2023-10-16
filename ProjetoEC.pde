//Main Flow File

//import
import java.util.Arrays;
import java.io.File;  // Import the File class
import java.io.FileNotFoundException;  // Import this class to handle errors
import java.util.Scanner; // Import the Scanner class to read text files
import ddf.minim.*;
Minim minim;
AudioPlayer song, musica;
//Defines
boolean debugMode = true;

//UI Graphics
PImage background;
PImage logo;
PImage questionImage;
ClickArea[] clickableAreas;
SceneBehaviour currentBehaviour;
ArrayList questions = new ArrayList();

//Text
PFont f;

void setup(){
  size(450, 800);
  
  PrintMainMenu();
  //Som - Anthony
  minim = new Minim(this);
  song = minim.loadFile("clicksom.mp3");
  musica = minim.loadFile("SafetyNet.mp3");
  musica.loop();
  //Reads the questions file. Let the data preloaded into the app, for a better performance
  String[] questionsLines = loadStrings("questions.tsv");
  
  for (int i = 0 ; i < questionsLines.length; i++) {
    var question = questionsLines[i].split("\t"); 
    var questionObj = new Question(question[0], question[6], question[5], Arrays.copyOfRange(question,1,5));
    questions.add(questionObj);
  }
  
}

void draw(){
  if(currentBehaviour != null){
    currentBehaviour.Update();
  }
    
  //Create the font from the file in the data folder. 
  f = createFont("SNACKID.otf", 25);
  textFont(f);
  
}

void mouseClicked(){
  CheckForTap();
}

public void CheckForTap(){
  //Check if the tap was inside any active loaded area
  if(debugMode){
    print("\n\n\n\n\n\n\n\n\n\n\n\n\n\n");
    print("x:" + mouseX + '\n');
    print("y:" + mouseY + '\n');
  }
  
  for(int i = 0; i < clickableAreas.length; i++){
    if(mouseX > clickableAreas[i].left && mouseX < clickableAreas[i].right &&
       mouseY > clickableAreas[i].top && mouseY < clickableAreas[i].bottom){
          clickableAreas[i].storedCommand.OnClick();
          print("Called!");
          song.play();
          song.rewind();
        }
    }
}
