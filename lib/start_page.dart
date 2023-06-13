import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:quiz_app/ques_page.dart';

class StartPage extends StatelessWidget {
  const StartPage(this.quizStarter, {super.key});

  final void Function() quizStarter;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 150),
          ),
          Text(
            'THRONE TRIVIA - GOT QUIZ',
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.cinzel(
              // backgroundColor: const Color.fromARGB(255, 67, 12, 8),
              color: Colors.white,
              fontSize: 20,
              letterSpacing: 2,
              wordSpacing: 4,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 100),
          ),
          Image.asset(
            'assets/images/logo-got.png',
            width: 400,
            color: Color.fromARGB(112, 141, 141, 141),
          ),
          const SizedBox(
            height: 60,
          ),
          const SizedBox(
            height: 40,
          ),
          OutlinedButton.icon(
              onPressed: quizStarter,
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                padding:
                    const EdgeInsets.symmetric(horizontal: 69, vertical: 10),
                foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                backgroundColor: Color.fromARGB(255, 20, 30, 48),
              ),
              icon: const Icon(Icons.swipe_right_alt_outlined),
              label: Text(
                'Valar Morghulis!',
                style: GoogleFonts.libreBaskerville(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              )),
          const SizedBox(height: 30),
          Container(
            width: double.infinity,
            height: 20,
            color: Colors.black,
            alignment: Alignment.center,
            child: Text(
              'Developed by @bhaveshj2611',
              textAlign: TextAlign.center,
              style: GoogleFonts.rubik(
                  color: const Color.fromARGB(176, 255, 255, 255),
                  fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
