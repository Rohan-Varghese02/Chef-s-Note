import 'package:cook_book/const/colors.dart';
import 'package:cook_book/screen/mainscreen/Pages/userpagewidget/shoppingPage/shoppinglist.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Shoppinglistbutton extends StatefulWidget {
  const Shoppinglistbutton({super.key});

  @override
  State<Shoppinglistbutton> createState() => _ShoppinglistbuttonState();
}

class _ShoppinglistbuttonState extends State<Shoppinglistbutton> {
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
        decoration:
            BoxDecoration(border: Border.all(color: const Color(primary))),
        child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Text(
                    'Shopping List',
                    style: GoogleFonts.poppins(
                        color: const Color(primary), fontSize: 20),
                  ),
                  const Icon(
                    Icons.shopping_bag,
                    size: 20,
                    color: Color(primary),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
