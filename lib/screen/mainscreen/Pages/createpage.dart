import 'package:cook_book/const/colors.dart';
import 'package:cook_book/db/dbfunction/category_notifier.dart';
import 'package:cook_book/screen/mainscreen/Pages/createpagewidget/categorylist.dart';
import 'package:cook_book/screen/mainscreen/Pages/createpagewidget/creationscreen.dart';
import 'package:flutter/material.dart';

class Createpage extends StatelessWidget {
  const Createpage({super.key});

  @override
  Widget build(BuildContext context) {
    getAllCategory();
    return Scaffold(
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
      body: const Categorylist(),
    );
  }
}
