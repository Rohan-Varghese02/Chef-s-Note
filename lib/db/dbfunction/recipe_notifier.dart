import 'dart:typed_data';

import 'package:cook_book/db/model/recipe_model/recipe_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

final ValueNotifier<List<RecipeModel>> recipeListNotifier = ValueNotifier([]);
Future<void> addRecipe(RecipeModel value) async {
  final recipeDB = await Hive.openBox<RecipeModel>('recipeBox');
  final _id = await recipeDB.add(value);
  value.id = _id;
  value.isFav = false;
  await recipeDB.put(_id, value);
  // print('Sucessful');
  // print(value.isFav);
  recipeListNotifier.value.add(value);
  recipeListNotifier.notifyListeners();
}

Future<void> getRecipes() async {
  final recipeDB = await Hive.openBox<RecipeModel>('recipeBox');
  recipeListNotifier.value.clear();

  recipeListNotifier.value.addAll(recipeDB.values);
  recipeListNotifier.notifyListeners();
}

Future<void> deleteRecipe(int? id) async {
  final recipeDB = await Hive.openBox<RecipeModel>('recipeBox');
  await recipeDB.delete(id);
  getRecipes();
}

void storeRecipe(
    {required Uint8List? pic,
    required int? categoryId,
    required TextEditingController name,
    required List<TextEditingController> listcontroller,
    required List<TextEditingController> quantitycontroller,
    required List<TextEditingController> directioncontroller,
    required TextEditingController time,
    required TextEditingController rating,
    required String? difficulty}) {
  final List<String> ingredient =
      listcontroller.map((controller) => controller.text).toList();
  final quantity =
      quantitycontroller.map((controller) => controller.text).toList();
  final direction =
      directioncontroller.map((controller) => controller.text).toList();
  final timedata = time.text.trim();
  final ratingdata = rating.text.trim();
  // print(quantity);
  // print(ingredient);
  // print(direction);
  // print(categoryId);
  final recipe = RecipeModel(
    recipePic: pic,
    name: name.text.trim(),
    ingridients: ingredient,
    qty: quantity,
    direction: direction,
    categoryId: categoryId,
    time: timedata,
    rating: ratingdata,
    difficulty: difficulty!,
  );
  addRecipe(recipe);
}

Future<void> favoriteRec(int? key, bool? isFavor) async {
  // Open the Hive box for RecipeModel objects
  final recipeDB = await Hive.openBox<RecipeModel>('recipeBox');

  // Retrieve the existing RecipeModel object by key
  RecipeModel? recipe = recipeDB.get(key);

  // Check if the recipe exists
  if (recipe != null) {
    // Update the isFav property
    recipe.isFav = isFavor;

    // Save the modified recipe back to the box with the same key
    await recipeDB.put(key, recipe);
    getRecipes();
  }
}
