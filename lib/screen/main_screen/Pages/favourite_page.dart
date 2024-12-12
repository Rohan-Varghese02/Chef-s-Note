// ignore_for_file: dead_code

import 'dart:typed_data';

import 'package:cook_book/const/colors.dart';
import 'package:cook_book/db/dbnotifiers/recipe_notifier.dart';
import 'package:cook_book/db/model/recipe_model/recipe_model.dart';
import 'package:cook_book/screen/recipe_screen/custom_recipe/recipescreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    bool? isFavorites = true;
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
          if (filteredRecipeList.isEmpty) {
            return Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 80,
                ),
                Text(
                  'Add your own Recipes ',
                  style: GoogleFonts.poppins(
                    fontSize: 29,
                    color: const Color(primary),
                  ),
                ),
                Text(
                  'and press above icon ',
                  style: GoogleFonts.poppins(
                    fontSize: 29,
                    color: const Color(primary),
                  ),
                ),
                Text(
                  'to appear here',
                  style: GoogleFonts.poppins(
                    fontSize: 29,
                    color: const Color(primary),
                  ),
                ),
              ],
            ));
          }
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
                      color: Colors.white, // Background color of the container
                      borderRadius: BorderRadius.circular(
                          10), // Optional: Rounded corners
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromARGB(255, 77, 172, 167)
                              .withOpacity(0.5), // Shadow color and opacity
                          spreadRadius: 2, // How much the shadow spreads
                          blurRadius: 5, // How soft the shadow is
                          offset: const Offset(
                              2, 3), // Horizontal and vertical shadow offsets
                        ),
                      ],
                    ),
                    child: Center(
                      child: ListTile(
                        title: Text(
                          data.name,
                          style: GoogleFonts.poppins(
                              color: const Color(primary),
                              fontWeight: FontWeight.w700,
                              fontSize: 20),
                        ),
                        subtitle: Row(
                          children: [
                            const Icon(Icons.star,
                                size: 20, color: Color(primary)),
                            Text(
                              data.rating,
                              style: GoogleFonts.poppins(fontSize: 16),
                            ),
                            const SizedBox(
                              width: 35,
                            ),
                            const Icon(Icons.shopify,
                                size: 20, color: Color(primary)),
                            Text(
                              data.ingridients.length.toString(),
                              style: GoogleFonts.poppins(fontSize: 16),
                            ),
                            const SizedBox(
                              width: 35,
                            ),
                            const Icon(Icons.timer,
                                size: 20, color: Color(primary)),
                            Text(
                              data.ingridients.length.toString(),
                              style: GoogleFonts.poppins(fontSize: 16),
                            ),
                          ],
                        ),
                        trailing: IconButton(
                            onPressed: () {
                              toggleFavorite(id: data.id, index: index);
                            },
                            icon: Icon(
                              isFavorites
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: isFavorites
                                  ? Colors.red
                                  : const Color(primary),
                            )),
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundImage: MemoryImage(pic),
                        ),
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

  Future<void> toggleFavorite({required int? id, required int index}) async {
    // Toggle the isFav state of the specific recipe in recipeListNotifier
    recipeListNotifier.value[index].isFav =
        !recipeListNotifier.value[index].isFav!;
    recipeListNotifier
        .notifyListeners(); // Notify the listeners about the update
    favoriteRec(
        id, recipeListNotifier.value[index].isFav); // Update in the database
  }
}
