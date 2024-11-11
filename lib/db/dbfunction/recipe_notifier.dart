import 'dart:typed_data';

import 'package:cook_book/db/model/recipe_model/recipe_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

final ValueNotifier<List<RecipeModel>> recipeListNotifier = ValueNotifier([]);
Future<void> addRecipe(RecipeModel value) async {
  final recipeDB = await Hive.openBox<RecipeModel>('recipeBox');
  final _id = await recipeDB.add(value);
  value.id = _id;
  await recipeDB.put(_id, value);
  print('Sucessful');
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
    required TextEditingController name,
    required List<TextEditingController> listcontroller,
    required List<TextEditingController> quantitycontroller,
    required List<TextEditingController> directioncontroller}) {
  final List<String> ingredient =
      listcontroller.map((controller) => controller.text).toList();
  final quantity =
      quantitycontroller.map((controller) => controller.text).toList();
  final direction =
      directioncontroller.map((controller) => controller.text).toList();
  print(quantity);
  print(ingredient);
  print(direction);
  final recipe = RecipeModel(
      recipePic: pic,
      name: name.text.trim(),
      ingridients: ingredient,
      qty: quantity,
      direction: direction);
  addRecipe(recipe);
}
