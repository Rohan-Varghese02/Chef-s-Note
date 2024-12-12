import 'package:cook_book/const/colors.dart';
import 'package:cook_book/db/dbnotifiers/category_notifier.dart';
import 'package:cook_book/db/model/custom_category/custom_cat_model.dart';
import 'package:cook_book/screen/main_screen/Pages/add_category/detailedpage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Categorytile extends StatefulWidget {
  const Categorytile({super.key});

  @override
  State<Categorytile> createState() => _CategorytileState();
}

class _CategorytileState extends State<Categorytile> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: categoryListNotifier,
        builder: (BuildContext ctx, List<CustomCatModel> categoryList,
            Widget? child) {
          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 3 / 2,
            ),
            itemBuilder: (context, index) {
              final category = categoryList[index];
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (ctx) => Detailedpage(data: category,)));
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                      side: const BorderSide(
                        width: 2,
                        color: Color(primary),
                      )),
                  color: const Color(0xffc5dad9),
                  elevation: 2,
                  child: Center(
                    child: Text(
                      category.title,
                      style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: const Color(primary)),
                    ),
                  ),
                ),
              );
            },
            itemCount: categoryList.length,
          );
        });
  }
}
