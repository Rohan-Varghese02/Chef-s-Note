import 'package:cook_book/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Contactus extends StatelessWidget {
  const Contactus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Contact Us',
          style: GoogleFonts.poppins(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color(primary),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'If you have any questions about these Terms and Conditions, You can contact us:',
              style: GoogleFonts.poppins(color: const Color(primary)),
            ),
            Text(
              'By visiting this page on our website: \nhttp://www.CookBook.com/contact',
              style: GoogleFonts.poppins(color: const Color(primary)),
            )
          ],
        ),
      ),
    );
  }
}
