import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});
  final List<Map<String, Object>> summaryData;

  @override
  Widget build(context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 25,
                  height: 25,
                  padding: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(80),
                  ),
                  child: Text(
                    ((data['ques_index'] as int) + 1).toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      // backgroundColor: Colors.red,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        child: Text(
                          data['questions'] as String,
                          textAlign: TextAlign.justify,
                          style: GoogleFonts.rubik(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        alignment: const Alignment(-1, 0),
                        child: Text(data['user-answer'] as String,
                            textAlign: TextAlign.left,
                            style: GoogleFonts.rubik(
                              color: const Color.fromARGB(170, 233, 30, 98),
                              fontSize: 12,
                            )),
                      ),
                      Container(
                        alignment: const Alignment(-1, 0),
                        child: Text(
                          data['correct-answer'] as String,
                          textAlign: TextAlign.left,
                          style: GoogleFonts.rubik(
                            color: const Color.fromARGB(171, 0, 187, 212),
                            fontSize: 12,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                )
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
