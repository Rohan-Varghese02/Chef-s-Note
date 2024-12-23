// ignore_for_file: must_be_immutable

import 'dart:typed_data';

import 'package:cook_book/const/colors.dart';
import 'package:cook_book/db/dbnotifiers/recipe_notifier.dart';
import 'package:cook_book/db/model/recipe_model/recipe_model.dart';
import 'package:cook_book/screen/main_screen/Pages/user_page_widget/shoppingPage/shoppinglist.dart';
import 'package:cook_book/screen/recipe_screen/custom_recipe/edit_recipe_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Recipescreen extends StatefulWidget {
  RecipeModel data;
  Recipescreen({super.key, required this.data});

  @override
  State<Recipescreen> createState() => _RecipescreenState();
}

class _RecipescreenState extends State<Recipescreen> {
  bool? isFavorites;

  @override
  void initState() {
    super.initState();
    // Initialize isFavorites with the value from widget.data.isFav
    isFavorites = widget.data.isFav ?? false;
  }

  Future<void> toggleFavorite() async {
    setState(() {
      isFavorites = !isFavorites!;
      // print('worked');
      // print(isFavorites);
      // widget.data.isFav = isFavorites; // Update the widget data for consistency
    });
    favoriteRec(widget.data.id, isFavorites);
  }

  @override
  Widget build(BuildContext context) {
    //bool? isFavorites = widget.data.isFav;
    Uint8List pic = widget.data.recipePic ?? Uint8List(0);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
        backgroundColor: const Color(primary),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                toggleFavorite();
              },
              icon: Icon(
                isFavorites! ? Icons.favorite : Icons.favorite_border,
                color: isFavorites! ? Colors.red : Colors.white,
              )),
          // Edit IconButton
          IconButton(
            onPressed: () async {
              // Navigate to EditRecipeScreen and wait for result
              final updatedRecipe = await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => EditRecipeScreen(data: widget.data),
                ),
              );

              // Check if the recipe was updated and refresh the state
              if (updatedRecipe != null && updatedRecipe is RecipeModel) {
                setState(() {
                  widget.data = updatedRecipe;
                });
              }
            },
            icon: const Icon(
              Icons.edit,
              color: Colors.white,
            ),
          ),
        ],
      ),
      backgroundColor: const Color(primary),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 400,
              decoration: BoxDecoration(
                image:
                    DecorationImage(image: MemoryImage(pic), fit: BoxFit.cover),
              ),
            ),
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Center(
                        child: Column(
                          children: [
                            Text(
                              widget.data.name,
                              style: GoogleFonts.poppins(
                                  color: const Color(primary),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30),
                            ),
                            RichText(
                              text: TextSpan(
                                style: const TextStyle(
                                    color: Color(primary), fontSize: 18),
                                children: [
                                  TextSpan(
                                      text:
                                          '${widget.data.time}mins | ${widget.data.difficulty} |  '),
                                  const WidgetSpan(
                                    child: Icon(
                                      Icons.star,
                                      color: Color(primary),
                                      size: 20,
                                    ),
                                  ),
                                  TextSpan(text: widget.data.rating),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Ingredients(${widget.data.ingridients.length})',
                            style: GoogleFonts.poppins(
                                color: const Color(primary),
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: widget.data.ingridients.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    widget.data.ingridients[index],
                                    style: GoogleFonts.poppins(
                                        color: const Color(primary)),
                                  ),
                                  Text(widget.data.qty[index],
                                      style: GoogleFonts.poppins(
                                          color: const Color(primary))),
                                ],
                              ),
                              leading: const Icon(
                                Icons.circle,
                                size: 20,
                                color: Color(primary),
                              ),
                              // trailing:
                              //     Icon(Icons.check_box_outline_blank_outlined),
                            );
                          },
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Directions',
                            style: GoogleFonts.poppins(
                                color: const Color(primary),
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: widget.data.direction.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                                title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Step ${index + 1}',
                                    style: GoogleFonts.poppins(
                                        color: const Color(primary))),
                                Text(widget.data.direction[index],
                                    style: GoogleFonts.poppins(
                                        color: const Color(primary)))
                              ],
                            ));
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (ctx) => const Shoppinglist()));
        },
        backgroundColor: const Color(primary),
        child: const Icon(
          Icons.shopify,
          color: Colors.white,
        ),
      ),
    );
  }
}
