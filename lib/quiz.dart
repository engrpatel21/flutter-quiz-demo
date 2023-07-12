import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/questions_screen.dart';
import 'package:flutter_quiz_app/quiz_start.dart';
import 'package:flutter_quiz_app/data/questions.dart';
import 'package:flutter_quiz_app/result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'quiz-start';

  void switchScreen() {
    setState(() {
      activeScreen = 'question-screen';
    });
  }

  void onSelectAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'quiz-start';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screen = QuizStart(switchScreen);
    if (activeScreen == 'question-screen') {
      screen = QuestionsScreen(onSelectAnswer: onSelectAnswer);
    }

    if (activeScreen == 'result-screen') {
      screen = ResultScreen(
        chosenAnsewrs: selectedAnswers,
        resetQuiz: restartQuiz,
      );
    }

    return MaterialApp(
      title: 'Flutter Tutorial',
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 52, 51, 54),
                Color.fromARGB(255, 64, 45, 186),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screen,
        ),
      ),
    );
  }
}
