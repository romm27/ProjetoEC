public ArrayList GetSelectedGrades(){
    ArrayList temp = new ArrayList();
    if(firstgrade) temp.add("1");
    if(secondGrade) temp.add("2");
    if(thirdGrade) temp.add("3");
    if(forthGrade) temp.add("4");
    if(fifthGrade) temp.add("5");
    return temp;
}

public void ModifySeries(int grade){
  switch (grade) {
      case 1:
        firstgrade = !firstgrade;
        break;
      case 2:
        secondGrade = !secondGrade;
        break;
      case 3:
        thirdGrade = !thirdGrade;
        break;
      case 4:
        forthGrade = !forthGrade;
        break;
      case 5:
        fifthGrade = !fifthGrade;
        break;
    }
    //Update Page
    PrintOptionsPage();
}


public void SaveSettings(){
    ArrayList<String> keywords = new ArrayList();
    if(!playMusic) keywords.add("muted"); else keywords.add("unmuted");
    if(firstgrade) keywords.add("1"); else keywords.add("-1");
    if(secondGrade) keywords.add("2"); else keywords.add("-2");
    if(thirdGrade) keywords.add("3"); else keywords.add("-3");
    if(forthGrade) keywords.add("4"); else keywords.add("-4");
    if(fifthGrade) keywords.add("5"); else keywords.add("-5");
    String[] temp = keywords.toArray(new String[0]);
    saveStrings("settings.txt", temp);
}

public void LoadSettings(){
    //if(DoesFileSaveFileExist()){
        print("Called!");
    String[] temp = loadStrings("settings.txt");
    for(int i = 0; i < temp.length; i++){
        //Enable Grades
        if(temp[i] == "1"){
            firstgrade = true;
        }
        if(temp[i] == "2"){
            secondGrade = true;
        }
        if(temp[i] == "3"){
            thirdGrade = true;
        }
        if(temp[i] == "4"){
            forthGrade = true;
        }
        if(temp[i] == "5"){
            fifthGrade = true;
        }

        //Disable Grades
        if(temp[i] == "-1"){
            firstgrade = false;
        }
        if(temp[i] == "-2"){
            secondGrade = false;
        }
        if(temp[i] == "-3"){
            thirdGrade = false;
        }
        if(temp[i] == "-4"){
            forthGrade = false;
        }
        if(temp[i] == "-5"){
            fifthGrade = false;
        }

        //Audio
        if(temp[i] == "muted") playMusic = false;
        if(temp[i] == "unmuted") playMusic = true;
        }
    //}
    //else{
    //    SaveSettings();
    //}
}

boolean DoesFileSaveFileExist() {
    print("called");
  return new File(dataPath("settings.txt")).exists();
}