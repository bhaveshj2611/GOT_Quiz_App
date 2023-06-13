import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/models/questions.dart';
import 'package:quiz_app/ques_summary.dart';

class ResultPage extends StatelessWidget {
  const ResultPage(this.chosenAnswers, this.onRetake, {super.key});

  final List<String> chosenAnswers;

  final void Function() onRetake;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'ques_index': i,
          'questions': questions[i].ques,
          'correct-answer': questions[i].answers[0],
          'user-answer': chosenAnswers[i],
        },
      );
    }
    return summary;
  }

  @override
  Widget build(context) {
    final summaryData = getSummaryData();
    int numTotalQues = questions.length;
    final numCorrectQues = summaryData.where((data) {
      return data['user-answer'] == data['correct-answer'];
    }).length;

    return Center(
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          // mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(padding: EdgeInsets.only(top: 100)),
            Text(
              'You answered $numCorrectQues of $numTotalQues ques correctly',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 22,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            QuestionsSummary(summaryData),
            const SizedBox(
              height: 19,
            ),
            TextButton.icon(
              icon: const Icon(Icons.restart_alt_rounded),
              onPressed: onRetake,
              style: TextButton.styleFrom(foregroundColor: Colors.white),
              label: const Text(
                'Retake Quiz!',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
