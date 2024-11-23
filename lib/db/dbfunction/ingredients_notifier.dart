import 'package:cook_book/db/model/shoppinglist_model/shoppinglist_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

final ValueNotifier<List<IngredientModel>> ingredientNotifier =
    ValueNotifier([]);
Future<void> addIngredient(IngredientModel value) async {
  final ingredientDB = await Hive.openBox<IngredientModel>('ingredientBox');
  final _id = await ingredientDB.add(value);
  value.id = _id;
  print(value.id);
  await ingredientDB.put(_id, value);
  ingredientNotifier.value.add(value);
  ingredientNotifier.notifyListeners();
}

Future<void> getAllIngredient() async {
  final ingredientDB = await Hive.openBox<IngredientModel>('ingredientBox');
  ingredientNotifier.value.clear();

  ingredientNotifier.value.addAll(ingredientDB.values);
  ingredientNotifier.notifyListeners();
}

Future<void> deleteIngredient(String name) async {
  final ingredientDB = await Hive.openBox<IngredientModel>('ingredientBox');

  // Find the key of the ingredient with the matching name
  final keyToDelete = ingredientDB.keys.firstWhere(
    (key) {
      final ingredient = ingredientDB.get(key);
      return ingredient?.name == name;
    },
    orElse: () => null, // Return null if no match is found
  );

  if (keyToDelete != null) {
    await ingredientDB.delete(keyToDelete); // Delete by key
    print('Deleted ingredient with name: $name');
    await getAllIngredient(); // Refresh the list
  } else {
    print('Ingredient not found: $name');
  }
}

Future<void> addIngredientAddButtonclick({
  required TextEditingController ingredientname,
  required TextEditingController qty,
}) async {
  final iName = ingredientname.text.trim();
  final iQty = qty.text.trim();
  final ingredient = IngredientModel(name: iName, quantity: iQty);
  addIngredient(ingredient);
}
