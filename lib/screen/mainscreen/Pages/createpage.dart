import 'package:cook_book/const/colors.dart';
import 'package:cook_book/db/dbfunction/category_notifier.dart';
import 'package:cook_book/db/dbfunction/recipe_notifier.dart';
import 'package:cook_book/screen/mainscreen/Pages/createpagewidget/createrecipe.dart';
import 'package:cook_book/screen/mainscreen/Pages/createpagewidget/recipedis.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Createpage extends StatelessWidget {
  const Createpage({super.key});

  @override
  Widget build(BuildContext context) {
    getAllCategory();
    getRecipes();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Create Your Recpies',
          style: GoogleFonts.poppins(
              color: const Color(primary),
              fontWeight: FontWeight.bold,
              fontSize: 24),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (ctx) => const Createrecipe()));
        },
        backgroundColor: const Color(primary),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: const Recipedis(),
    );
  }
}
