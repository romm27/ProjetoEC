//Use this file to declare data structures.

//import
import java.util.Collections;
import java.util.Random;

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

class Question {
  public String text;
  public String grade;
  public String image;
  public String[] answers;
  public int id;
     
  public Question(int id, String text, String grade, String image, String[] answers) {
   this.text = text;
   this.grade = grade;
   this.image = image;
   this.answers = answers;
   this.id = id;

  }
  
  String[] shuffleAnswers() { //Shuffle the answers, so they change place on the quiz.
   var answersList = new ArrayList<>(Arrays.asList(answers));
   Collections.shuffle(answersList);

   return answersList.toArray(new String[answersList.size()]);
  }
  
  String breakLine() { //Insert breaklines on the question text.
    String question = this.text;
    String[] words = question.split(" ");
    String formattedQuestion = "";
    String line = "";
    int i = 0;
    
    while (i < words.length) {
      if ((line.length() + 1 + words[i].length()) < 30) {
        line += words[i] + " ";
        i++;
      }
      else {
        formattedQuestion += line + "\n";
        line = ""; 
       }
    }
    
    formattedQuestion += line;
    
    return formattedQuestion;
  }
  
}

ArrayList selectQuestionsByGrade(ArrayList<Question> questions, ArrayList grades) {
 ArrayList gradeQuestions = new ArrayList();

  for (int i = 0 ; i < grades.size(); i++){
    for (int j = 0 ; j < questions.size(); j++) {     
      if (questions.get(j).grade.equals(grades.get(i))) {
        gradeQuestions.add(questions.get(j));
      }
    }
  }
  
  return gradeQuestions;
}

int selectQuestion(ArrayList gradeQuestions){
  Random rand = new Random(); // Instance of random class
  
  return(rand.nextInt(gradeQuestions.size())); 

}
