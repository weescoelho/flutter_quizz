import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  //Sintax sugar para binding da prop passada no construtor
  const StartScreen(this.startQuiz, {super.key});

  // Realiza o binding da classe
  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 250,
            color: const Color.fromARGB(
                150, 255, 255, 255), // Abordagem para aplicar opacidade
          ),
          const SizedBox(
            height: 80,
          ),
          Text('Learn Flutter the fun way!',
              style: GoogleFonts.lato(
                  fontSize: 24,
                  color: const Color.fromARGB(255, 206, 143, 243))),
          const SizedBox(
            height: 40,
          ),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text(
              'Start Quiz',
            ),
          )
        ],
      ),
    );
  }
}
