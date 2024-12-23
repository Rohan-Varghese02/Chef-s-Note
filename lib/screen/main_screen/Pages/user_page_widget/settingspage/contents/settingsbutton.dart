import 'package:cook_book/const/colors.dart';
import 'package:cook_book/screen/main_screen/Pages/user_page_widget/settingspage/settingspage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Settingsbutton extends StatelessWidget {
  const Settingsbutton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (ctx) => const Settingspage()));
      },
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
            color: const Color(primary),
            border: Border.all(color: const Color(primary)),
            borderRadius: BorderRadius.circular(20)),
        child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Text(
                    '  Settings',
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  // const Icon(
                  //   Icons.settings,
                  //   size: 20,
                  //   color: Color(primary),
                  //)
                ],
              ),
            )),
      ),
    );
  }
}
