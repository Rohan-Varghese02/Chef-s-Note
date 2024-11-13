import 'dart:typed_data';

import 'package:cook_book/const/colors.dart';
import 'package:cook_book/db/dbfunction/recipe_notifier.dart';
import 'package:cook_book/db/model/recipe_model/recipe_model.dart';
import 'package:cook_book/screen/recipescreen/recipescreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Favouritepage extends StatelessWidget {
  const Favouritepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Favorite',
          style: GoogleFonts.poppins(
              color: const Color(primary),
              fontWeight: FontWeight.bold,
              fontSize: 24),
        ),
        centerTitle: true,
      ),
      body: ValueListenableBuilder(
        valueListenable: recipeListNotifier,
        builder:
            (BuildContext ctx, List<RecipeModel> recipeList, Widget? child) {
          final filteredRecipeList =
              recipeList.where((recipe) => recipe.isFav == true).toList();
          return ListView.separated(
            itemBuilder: (ctx, index) {
              final data = filteredRecipeList[index];
              Uint8List pic = data.recipePic ?? Uint8List(0);
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => Recipescreen(data: data)));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 90,
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color(primary)),
                        borderRadius: BorderRadius.circular(15)),
                    child: Center(
                      child: ListTile(
                        title: Text(
                          data.name,
                          style: GoogleFonts.poppins(
                              color: const Color(primary),
                              fontWeight: FontWeight.w700,
                              fontSize: 20),
                        ),
                        subtitle: Text(data.categoryId.toString()),
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundImage: MemoryImage(pic),
                        ),
                        trailing: IconButton(
                            onPressed: () {
                              deleteRecipe(data.id);
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.red,
                            )),
                      ),
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (ctx, index) {
              return const SizedBox();
            },
            itemCount: filteredRecipeList.length,
          );
        },
      ),
    );
  }
}
