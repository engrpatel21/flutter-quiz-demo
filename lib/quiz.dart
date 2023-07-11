import 'package:flutter/material.dart';
import 'package:flutter_quiz_app/questions_screen.dart';
import 'package:flutter_quiz_app/quiz_start.dart';
import 'package:flutter_quiz_app/data/questions.dart';

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
      selectedAnswers = [];
      setState(() {
        activeScreen = 'quiz-start';
      });
    }
    print(activeScreen);
  }

  @override
  Widget build(BuildContext context) {
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
          child: activeScreen == 'quiz-start'
              ? QuizStart(switchScreen)
              : QuestionsScreen(onSelectAnswer: onSelectAnswer),
        ),
      ),
    );
  }
}
