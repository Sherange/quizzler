import 'package:flutter/material.dart';
import './quiz_brain.dart';

QuizBrain quizBrain = QuizBrain();
void main() => runApp(const Quizzler());

class Quizzler extends StatelessWidget {
  const Quizzler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade800,
        body: const SafeArea(
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
  const QuizPage({Key? key}) : super(key: key);

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> scoreKeeper = [];

  int questionNumber = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Center(
                child: Text(
                  quizBrain.questionBank[questionNumber].questionText,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 25.0, color: Colors.white),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                ),
                onPressed: () {
                  bool correctAnswer =
                      quizBrain.questionBank[questionNumber].answerText;
                  if (correctAnswer == true) {
                    setState(() {
                      questionNumber++;
                      scoreKeeper.add(const Icon(
                        Icons.check,
                        color: Colors.green,
                      ));
                    });
                  } else {
                    setState(() {
                      questionNumber++;
                      scoreKeeper.add(const Icon(
                        Icons.close,
                        color: Colors.red,
                      ));
                    });
                  }
                },
                child: const Text(
                  'True',
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                ),
                onPressed: () {
                  bool correctAnswer =
                      quizBrain.questionBank[questionNumber].answerText;
                  if (correctAnswer == false) {
                    setState(() {
                      questionNumber++;
                      scoreKeeper.add(const Icon(
                        Icons.check,
                        color: Colors.green,
                      ));
                    });
                  } else {
                    setState(() {
                      questionNumber++;
                      scoreKeeper.add(const Icon(
                        Icons.close,
                        color: Colors.red,
                      ));
                    });
                  }
                },
                child: const Text(
                  'False',
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
              ),
            ),
          ),
          Row(
            children: scoreKeeper,
          )
        ]);
  }
}
