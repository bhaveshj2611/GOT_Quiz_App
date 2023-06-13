import 'package:flutter/material.dart';
import 'package:quiz_app/models/questions.dart';
import 'package:quiz_app/result_page.dart';
import 'package:quiz_app/start_page.dart';
import 'package:quiz_app/ques_page.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var currentPage = 'start-page';

  void switchpage() {
    setState(() {
      currentPage = 'ques-page';
    });
  }

  void retakeQuiz() {
    setState(() {
      selectedAnswers = [];
      currentPage = 'ques-page';
    });
  }

  void choosenAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        currentPage = 'result-page';
      });
    }
  }

  @override
  Widget build(context) {
    Widget widgetSwitch = StartPage(switchpage);

    if (currentPage == 'ques-page') {
      widgetSwitch = QuesPage(choosenAnswer);
    } else if (currentPage == 'result-page') {
      widgetSwitch = ResultPage(selectedAnswers, retakeQuiz);
    }

    return MaterialApp(
      home: Scaffold(
        // backgroundColor: Colors.deepPurple,
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 20, 30, 48),
                Color.fromARGB(255, 36, 59, 85),
              ],
            ),
          ),
          child: widgetSwitch,
        ),
      ),
    );
  }
}
