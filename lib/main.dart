import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'class-QuestionBank.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Center(
            child: Text('Quiz App'),
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Quiz(),
          ),
        ),
      ),
    );
  }
}

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  QuestionBank q = new QuestionBank();
  List<Icon> userScore = [];
  int questionNumber = 0;
  int marks = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 5,
          child: Center(
            child: Text(
              q.getQuestion(questionNumber),
              style: TextStyle(
                fontSize: 25,
              ),
            ),
          ),
        ),
        Expanded(
          child: TextButton(
            onPressed: () {
              bool ans = q.checkAns(questionNumber, true);
              if (ans) {
                setState(() {
                  userScore.add(Icon(Icons.check));
                  marks++;
                  if (questionNumber == 12) {
                    Alert(
                      context: context,
                      title: 'Finished!',
                      desc:
                          'You\'ve reached the end of the quiz. You scored $marks/13 ',
                      buttons: [
                        DialogButton(
                          child: Text(
                            "Play Again",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                            setState(() {
                              questionNumber = 0;
                              userScore = [];
                              marks = 0;
                            });
                          },
                          width: 120,
                        )
                      ],
                    ).show();
                  }
                });
                if (questionNumber != 12) questionNumber++;
              } else {
                setState(() {
                  userScore.add(Icon(Icons.close));
                  if (questionNumber == 12) {
                    Alert(
                      context: context,
                      title: 'Finished!',
                      desc:
                          'You\'ve reached the end of the quiz. You scored $marks/13 ',
                      buttons: [
                        DialogButton(
                          child: Text(
                            "COOL, Play the Quiz Again",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: () {
                            setState(() {
                              questionNumber = 0;
                              userScore = [];
                            });
                          },
                          width: 120,
                        )
                      ],
                    ).show();
                  }
                });
                if (questionNumber != 12) questionNumber++;
              }
            },
            style: ButtonStyle(
              padding: MaterialStateProperty.all(EdgeInsets.zero),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                color: Colors.green,
                border: Border.all(color: Colors.black, width: 2.0),
              ),
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              width: double.infinity,
              child: Center(
                child: Text(
                  'True',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: TextButton(
            onPressed: () {
              bool ans = q.checkAns(questionNumber, false);
              if (ans) {
                setState(() {
                  userScore.add(Icon(Icons.check));
                  marks++;
                  if (questionNumber == 12) {
                    Alert(
                      context: context,
                      title: 'Finished!',
                      desc:
                          'You\'ve reached the end of the quiz. You scored $marks/13 ',
                      buttons: [
                        DialogButton(
                          child: Text(
                            "Play Again",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                            setState(() {
                              questionNumber = 0;
                              userScore = [];
                            });
                          },
                          width: 120,
                        )
                      ],
                    ).show();
                  }
                });
                if (questionNumber != 12) questionNumber++;
              } else {
                setState(() {
                  userScore.add(Icon(Icons.close));
                  if (questionNumber == 12) {
                    Alert(
                      context: context,
                      title: 'Finished!',
                      desc:
                          'You\'ve reached the end of the quiz. You scored $marks/13 ',
                      buttons: [
                        DialogButton(
                          child: Text(
                            "Play Again",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                            setState(() {
                              questionNumber = 0;
                              userScore = [];
                            });
                          },
                          width: 120,
                        )
                      ],
                    ).show();
                  }
                });

                if (questionNumber != 12) questionNumber++;
              }
            },
            style: ButtonStyle(
              padding: MaterialStateProperty.all(EdgeInsets.zero),
            ),
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  border: Border.all(color: Colors.black, width: 2.0),
                  color: Colors.red),
              margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              width: double.infinity,
              child: Center(
                child: Text(
                  'False',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
        Row(
          children: userScore,
        )
      ],
    );
  }
}
