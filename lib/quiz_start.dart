import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuizStart extends StatelessWidget {
  const QuizStart(this.startQuiz, {super.key});

  final void Function() startQuiz;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset('assets/images/quiz-logo.png',
              width: 300, color: const Color.fromARGB(129, 255, 255, 255)),
          const SizedBox(
            height: 60,
          ),
          Text(
            'Flutter Quiz App',
            style: GoogleFonts.lato(
              color: const Color.fromARGB(255, 168, 174, 243),
              fontSize: 40,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            onPressed: startQuiz,
            label: const Text('Start Quiz'),
            icon: const Icon(Icons.arrow_right_alt),
          )
        ],
      ),
    );
  }
}
