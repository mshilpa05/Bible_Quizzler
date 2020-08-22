import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blueGrey[500],
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int scoreKeeper = 0;

  void checkAnswer(String userPickedAnswer) {
    String correctAnswer = quizBrain.getCorrectAnswer();

    setState(() {
      if (quizBrain.isFinished() == true && scoreKeeper<8) {
        Alert(
          context: context,
          title: 'Finished!',
          desc: 'You\'ve reached the end of the quiz. You Score is $scoreKeeper. This quiz will be reset. Better Luck Next Time',
        ).show();

        quizBrain.reset();
        scoreKeeper = 0;
      } else if (quizBrain.isFinished() == true) {
        Alert(
          context: context,
          title: 'Finished!',
          desc: 'Well Done. You can start next level now',
        ).show();
        quizBrain.nextLevel();
        scoreKeeper =0;
      }

      else {
        if (userPickedAnswer == correctAnswer) {
          scoreKeeper++;
        }
        quizBrain.nextQuestion();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quizBrain.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.lightGreen,
              child: Text(
                quizBrain.getQuestionOption()[0],
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                //The user picked true.
                checkAnswer(quizBrain.getQuestionOption()[0]);
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.lightGreen,
              child: Text(
                quizBrain.getQuestionOption()[1],
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                //The user picked false.
                checkAnswer(quizBrain.getQuestionOption()[1]);
              },
            ),
          ),
        )
      ],
    );
  }
}

