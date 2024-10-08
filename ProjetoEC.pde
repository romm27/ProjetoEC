//Main Flow File

//import
import java.util.Arrays;
import java.io.File;  // Import the File class
import java.io.FileNotFoundException;  // Import this class to handle errors
import java.util.Scanner; // Import the Scanner class to read text files
import ddf.minim.*;
Minim minim;
AudioPlayer song, musica;


//UI Graphics
PImage background;
PImage logo;
PImage questionImage;
ClickArea[] clickableAreas;
SceneBehaviour currentBehaviour;
ArrayList questions = new ArrayList();

//Video
Movie credits;

//Text
PFont f;

//Quiz Timer
boolean waitingForQuizSwitch = false;
int asnwerOpenTime = 0;

void setup(){
  size(450, 800);
  //LoadSettings();1

  //Load Video
  credits = new Movie(this, "credits.mp4");
  credits.loop();


  PrintMainMenu();
  //Som - Anthony
  minim = new Minim(this);
  song = minim.loadFile("clicksom.mp3");
  musica = minim.loadFile("SafetyNet.mp3");
  musica.loop();

  //Load Settings
  if(playMusic) musica.play(); else musica.pause();


  //Reads the questions file. Let the data preloaded into the app, for a better performance
  String[] questionsLines = loadStrings("questions.tsv");
  
  for (int i = 0 ; i < questionsLines.length; i++) {
    var question = questionsLines[i].split("\t"); 
    var questionObj = new Question(i, question[0], question[6], question[5], Arrays.copyOfRange(question,1,5));
    questions.add(questionObj);
  }


  //Create the font from the file in the data folder. 
  f = createFont("SNACKID.otf", 25);
  textFont(f);
}

void draw(){
  if(currentBehaviour != null){
    currentBehaviour.Update();
  }

  //Gambiarra
  if(waitingForQuizSwitch){
    if(millis() >= asnwerOpenTime + 1500){
      PrintQuizPage();
      waitingForQuizSwitch = false;
    }
  }
}

void mouseClicked(){
  CheckForTap();
}

public void CheckForTap(){
//Check if the tap was inside any active clickable area
  if(debugMode){
    print("\n\n\n\n\n\n\n\n\n\n\n\n\n\n");
    print("x:" + mouseX + '\n');
    print("y:" + mouseY + '\n');
  }
  
  for(int i = 0; i < clickableAreas.length; i++){
    if(mouseX > clickableAreas[i].left && mouseX < clickableAreas[i].right &&
       mouseY > clickableAreas[i].top && mouseY < clickableAreas[i].bottom){
          clickableAreas[i].storedCommand.OnClick();
          //print("Called!");
          song.play();
          song.rewind();
        }
    }
}
