import 'question.dart';

class QuizBrain {
  int _questionNumber = 0;
  int level = 0;

  List<Question> _questionBank = [
    Question('What is the longest book in Bible?','Psalms',['Psalms','Proverbs']),
    Question('Which is the first book in Bible?','Genesis',['Genesis','Psalms']),
    Question('How many books have Jesus directly written','Zero',['One','Zero']),
    Question('How many books are there in Bible','66',['65','66']),
    Question('How many books in new testament','27',['27','39']),
    Question('How many books in old testament','39',['29','39']),
    Question('Was Bible the first written in English language', 'No', ['yes','No']),
    Question('In which language was New Testament written', 'Greek', ['English','Greek']),
    Question('Number of books written by Paul','13',['14','13']),
    Question('Who wrote highest number of books','Paul',['Paul','Peter']),
    Question('You love Bible?', 'Yes', ['Yes','No'])
  ];

  void nextQuestion() {
    if (_questionNumber < _questionBank.length - 1) {
      _questionNumber++;
    }
  }

  String getQuestionText() {
    return _questionBank[_questionNumber].questionText;
  }

  String getCorrectAnswer() {
    return _questionBank[_questionNumber].questionAnswer;
  }

  List<String> getQuestionOption(){
    return _questionBank[_questionNumber].questionOptions;
  }



  bool isFinished() {
    if (_questionNumber >= _questionBank.length - 1) {

      print('Now returning true');
      return true;

    } else {
      return false;
    }
  }

  void reset() {
    _questionNumber = 0;
  }
  void nextLevel() {
    level++;
  }
}
