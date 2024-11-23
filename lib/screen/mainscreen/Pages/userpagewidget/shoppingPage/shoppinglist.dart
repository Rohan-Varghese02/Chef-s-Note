import 'package:cook_book/const/colors.dart';
import 'package:cook_book/db/dbfunction/ingredients_notifier.dart';
import 'package:cook_book/screen/mainscreen/Pages/userpagewidget/shoppingPage/widgets/getslist.dart';
import 'package:cook_book/screen/mainscreen/Pages/userpagewidget/shoppingPage/widgets/shoppinglistadder.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Shoppinglist extends StatefulWidget {
  const Shoppinglist({super.key});

  @override
  State<Shoppinglist> createState() => _ShoppinglistState();
}

class _ShoppinglistState extends State<Shoppinglist> {
  @override
  Widget build(BuildContext context) {
    getAllIngredient();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Shopping List',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(primary),
        titleTextStyle: GoogleFonts.poppins(color: Colors.white, fontSize: 30),
      ),
      body: const SafeArea(child: Getslist()),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(primary),
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (ctx) => const Shoppinglistadder()));
        },
        tooltip: 'Add Shopping List',
        focusColor: Colors.black,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
