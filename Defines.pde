//Use this file to define variables.
//Defines
boolean debugMode = false; //Developer mode

//Global Static
final float appVersion = 1.0f; //<-- current version of the app

//Global Settings
boolean saveStats = true;
boolean playMusic = true;
//boolean soundEffects = true;
//int secondsPerQuestion = 30;
int questionUnlockTime = 500; //In miliseconds!
ArrayList askedQuestions = new ArrayList(); //Questions answered by the user on the quiz

//Global Data
int right = 0; //<--- number of question gotten right ever since starting using the program
int wrong = 0; //<--- number of question gotten wrong ever since starting using the program

//Grades Settings
boolean firstgrade = true;
boolean secondGrade = false;
boolean thirdGrade = false;
boolean forthGrade = false;
boolean fifthGrade = false;

//Stored
int startDelayMil = 0;
int lastHighScore = 0;
