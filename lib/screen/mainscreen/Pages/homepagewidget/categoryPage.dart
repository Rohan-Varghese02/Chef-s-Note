import 'package:cook_book/db/data/dummy_data.dart';
import 'package:cook_book/screen/mainscreen/Pages/homepagewidget/categoryItem.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Categorypage extends StatelessWidget {
  const Categorypage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            childAspectRatio: 2 / 2,
            crossAxisSpacing: 10),
        children: [
          for (final category in availableCategories)
            Categoryitem(category: category)
        ],
      ),
    );
  }
}
