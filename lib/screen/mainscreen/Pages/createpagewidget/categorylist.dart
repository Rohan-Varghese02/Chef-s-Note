import 'package:cook_book/db/dbfunction/category_notifier.dart';
import 'package:cook_book/db/model/custom_cat_model.dart';
import 'package:cook_book/screen/mainscreen/Pages/createpagewidget/creationscreen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Categorylist extends StatefulWidget {
  const Categorylist({super.key});

  @override
  State<Categorylist> createState() => _CategorylistState();
}

class _CategorylistState extends State<Categorylist> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: categoryListNotifier,
      builder:
          (BuildContext ctx, List<CustomCatModel> categoryList, Widget? child) {
        return ListView.separated(
          itemCount: categoryList.length,
          itemBuilder: (context, index) {
            final category = categoryList[index];
            return ListTile(
              leading: category.titlePic != null
                  ? Image.memory(category.titlePic!)
                  : const Icon(Icons.category),
              title: Text(category.title),
              trailing: IconButton(
                  onPressed: () {
                    if (category.id != null) {
                      deleteCategory(category.id!);
                    } else {
                      print('Nothing');
                    }
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  )),
            );
          },
          separatorBuilder: (ctx, index) {
            return const Divider();
          },
        );
      },
    );
  }
}
