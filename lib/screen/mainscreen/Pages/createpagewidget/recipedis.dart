import 'dart:typed_data';

import 'package:cook_book/const/colors.dart';
import 'package:cook_book/db/dbfunction/recipe_notifier.dart';
import 'package:cook_book/db/model/recipe_model/recipe_model.dart';
import 'package:cook_book/screen/recipescreen/recipescreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Recipedis extends StatefulWidget {
  const Recipedis({super.key});

  @override
  State<Recipedis> createState() => _RecipedisState();
}

class _RecipedisState extends State<Recipedis> {
  @override
  Widget build(BuildContext context) {
    bool? isFavorites = true;

    return ValueListenableBuilder(
      valueListenable: recipeListNotifier,
      builder: (BuildContext ctx, List<RecipeModel> recipeList, Widget? child) {
        if (recipeList.isEmpty) {
          return Center(
            child: Column(
              children: [
                const Image(
                  image: NetworkImage(
                    'https://img.freepik.com/premium-photo/girl-cooking-with-chef-hat-sign-that-says-create-your-own_750792-65191.jpg',
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Text(
                        '“A recipe has no',
                        style: GoogleFonts.poppins(
                          fontSize: 29,
                          color: const Color(primary),
                        ),
                      ),
                      Text(
                        'soul. You as the',
                        style: GoogleFonts.poppins(
                          fontSize: 29,
                          color: const Color(primary),
                        ),
                      ),
                      Text(
                        'cook must bring',
                        style: GoogleFonts.poppins(
                          fontSize: 29,
                          color: const Color(primary),
                        ),
                      ),
                      Text(
                        ' soul to the recipe',
                        style: GoogleFonts.poppins(
                          fontSize: 29,
                          color: const Color(primary),
                        ),
                      ),
                      Text(
                        ' – Thomas Keller',
                        style: GoogleFonts.poppins(
                          fontSize: 19,
                          color: const Color(primary),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        }
        return ListView.separated(
          itemBuilder: (ctx, index) {
            final data = recipeList[index];
            isFavorites = data.isFav;
            Uint8List pic = data.recipePic ?? Uint8List(0);
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => Recipescreen(data: data)));
                },
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
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage: MemoryImage(pic),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                              onPressed: () {
                                toggleFavorite(id: data.id, index: index);
                              },
                              icon: Icon(
                                isFavorites!
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: isFavorites!
                                    ? Colors.red
                                    : const Color(primary),
                              )),
                          IconButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (ctx) {
                                      return AlertDialog(
                                        backgroundColor: const Color(primary),
                                        title: const Text(
                                          'Delete',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        content: Text(
                                          'Do you really wish to permenantly delete ${data.name}',
                                          style: const TextStyle(
                                              color: Colors.white),
                                        ),
                                        actions: [
                                          ElevatedButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: const Text(
                                                'Cancel',
                                                style: TextStyle(
                                                    color: Colors.red),
                                              )),
                                          ElevatedButton(
                                            onPressed: () {
                                              if (data.id != null) {
                                                deleteRecipe(data.id);
                                                Navigator.of(context).pop();
                                              } else {
                                                print('No such Student ID');
                                                Navigator.of(context).pop();
                                              }
                                            },
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    const Color(0xff03E079)),
                                            child: const Text('Yes',
                                                style: TextStyle(
                                                    color: Color(primary))),
                                          )
                                        ],
                                      );
                                    });
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              )),
                        ],
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
          itemCount: recipeList.length,
        );
      },
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
