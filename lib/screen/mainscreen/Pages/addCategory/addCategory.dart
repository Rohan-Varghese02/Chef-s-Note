import 'package:cook_book/const/colors.dart';
import 'package:cook_book/screen/mainscreen/Pages/addCategory/categorytile.dart';
import 'package:cook_book/screen/mainscreen/Pages/addCategory/creationscreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Addcategory extends StatelessWidget {
  const Addcategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Category',
            style: GoogleFonts.poppins(
                color: Color(primary), fontWeight: FontWeight.w400)),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Categorytile(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(
              MaterialPageRoute(builder: (ctx) => const Creationscreen()));
        },
        backgroundColor: const Color(primary),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
