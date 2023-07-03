import 'package:flutter/material.dart';
import 'package:flutter_quizz/data/questions.dart';
import 'package:flutter_quizz/questions_screen.dart';
import 'package:flutter_quizz/results_screen.dart';
import 'package:flutter_quizz/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  //Widget? activeScreen;
  List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  //initState é executado na instanciação da classe
  // @override
  // void initState() {
  //   activeScreen = 'questions-screen';
  //   super.initState();
  // }

  void switchScreen() {
    setState(() {
      selectedAnswers = [];
      activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'results-screen';
      });
    }
  }

  // o build é executado após a execução do setState
  @override
  Widget build(BuildContext context) {
    Widget screenWidget = StartScreen(switchScreen);

    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    }

    if (activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        chosenAnswers: selectedAnswers,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 62, 10, 151),
                Color.fromARGB(255, 100, 55, 177)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
