import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/models/questions.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:quiz_app/models/quiz_question.dart';
// import 'package:quiz_app/models/quiz_question.dart';

class QuesPage extends StatefulWidget {
  const QuesPage(this.onSeleceAnswer, {super.key});

  final void Function(String answer) onSeleceAnswer;

  @override
  State<QuesPage> createState() {
    return _QuesPageState();
  }
}

class _QuesPageState extends State<QuesPage> {
  int currentQueIndex = 0;
  answerQuestion(String selectedAnswer) {
    setState(() {
      widget.onSeleceAnswer(selectedAnswer);
      currentQueIndex++;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQueIndex];

    return Center(
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(padding: EdgeInsets.only(top: 30)),
            Text(
              'Valar Dohaeris...',
              textAlign: TextAlign.center,
              style: GoogleFonts.libreBaskerville(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 150)),
            Text(
              currentQuestion.ques,
              style: GoogleFonts.poppins(
                color: Color.fromARGB(222, 255, 255, 255),
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.justify,
            ),
            const SizedBox(height: 30),
            ...currentQuestion.shuffledList().map(
              (answer) {
                return AnswerButton(answer, () {
                  answerQuestion(answer);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
