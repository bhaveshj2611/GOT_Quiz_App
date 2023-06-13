import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton(this.answerText, this.onTap, {super.key});

  final String answerText;
  final void Function() onTap;

  @override
  Widget build(context) {
    return Container(
      margin: const EdgeInsets.all(3),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          // fixedSize: const Size(20, 20),
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
          backgroundColor: const Color.fromARGB(255, 20, 30, 48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          answerText,
          textAlign: TextAlign.center,
          style: GoogleFonts.rubik(),
        ),
      ),
    );
  }
}
