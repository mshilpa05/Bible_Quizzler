class Question {
  String questionText;
  String questionAnswer;
  List<String> questionOptions=[];

  Question(String q, String a, List<String> o) {
    questionText = q;
    questionAnswer = a;
    questionOptions = o;
  }
}
