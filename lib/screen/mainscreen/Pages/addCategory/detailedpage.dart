import 'package:cook_book/const/colors.dart';
import 'package:cook_book/db/dbfunction/category_notifier.dart';
import 'package:cook_book/db/model/custom_cat_model.dart';
import 'package:cook_book/screen/mainscreen/Pages/addCategory/detailedpagewidget/detailedlist.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Detailedpage extends StatelessWidget {
  final CustomCatModel data;
  const Detailedpage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          data.title,
          style: GoogleFonts.poppins(
              color: Color(primary), fontWeight: FontWeight.w400),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                if (data.id != null) {
                  deleteCategory(data.id!);
                  Navigator.of(context).pop();
                } else {
                  print('Nothing');
                }
              },
              icon: const Icon(
                Icons.delete,
                color: Color(primary),
              ))
        ],
      ),
      body: Detailedlist(id: data.id,),
    );
  }
}
