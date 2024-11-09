import 'package:cook_book/const/colors.dart';
import 'package:cook_book/db/dbfunction/category_notifier.dart';
import 'package:flutter/material.dart';

class Createpage extends StatelessWidget {
  const Createpage({super.key});

  @override
  Widget build(BuildContext context) {
    getAllCategory();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Your Recpies'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          
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
