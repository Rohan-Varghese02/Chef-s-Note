import 'package:cook_book/const/colors.dart';
import 'package:cook_book/screen/mainscreen/Pages/searchpage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Searchbar extends StatelessWidget {
  const Searchbar({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (ctx) => Searchpage()));
      },
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: const Color(primary)),
            borderRadius: BorderRadius.circular(50)),
        width: double.infinity,
        height: 55,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'What do u want to eat...',
                  style: GoogleFonts.poppins(
                      fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const Icon(Icons.search)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
