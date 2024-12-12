import 'package:cook_book/const/colors.dart';
import 'package:cook_book/screen/main_screen/Pages/user_page_widget/shoppingPage/shoppinglist.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Shoppinglistbutton extends StatelessWidget {
  const Shoppinglistbutton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (ctx) => const Shoppinglist()));
      },
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
            color: const Color(primary),
            border: Border.all(
              color: const Color(primary),
            ),
            borderRadius: BorderRadius.circular(20)),
        child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Text(
                    '  Shopping List',
                    style:
                        GoogleFonts.poppins(color: Colors.white, fontSize: 20),
                  ),
                  // const Icon(
                  //   Icons.shopping_bag,
                  //   size: 20,
                  //   color: Color(primary),
                  // )
                ],
              ),
            )),
      ),
    );
  }
}
