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
     
  public Question(String text, String grade, String image, String[] answers) {
   this.text = text;
   this.grade = grade;
   this.image = image;
   this.answers = answers;

  }
  
  String[] shuffleAnswers() {
   var answersList = new ArrayList<>(Arrays.asList(answers));
   Collections.shuffle(answersList);

   return answersList.toArray(new String[answersList.size()]);
  }
  
}

ArrayList selectQuestionsByGrade(ArrayList<Question> questions, String grade) {
 ArrayList gradeQuestions = new ArrayList();
  
 for (int j = 0 ; j < questions.size(); j++) {     
    if (questions.get(j).grade.equals(grade)) {
     gradeQuestions.add(questions.get(j));
   }
 }
  
  return gradeQuestions;
}

int selectQuestion(ArrayList gradeQuestions){
  Random rand = new Random(); // Instance of random class
  
  return(rand.nextInt(gradeQuestions.size())); 

}
