import 'package:cook_book/const/colors.dart';
import 'package:cook_book/db/model/category.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Categoryitem extends StatelessWidget {
  const Categoryitem({super.key, required this.category});
  final Categories category;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 140,
        width: 140,
        child: Card(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
              side: const BorderSide(
                width: 2,
                color: Color(primary),
              )),
          color: const Color(0xffc5dad9),
          child: Center(
              child: Text(
            category.title,
            style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: const Color(primary)),
          )),
        ));
  }
}
