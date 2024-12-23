import 'package:cook_book/db/model/custom_category/custom_cat_model.dart';
import 'package:cook_book/db/model/recipe_model/recipe_model.dart';
import 'package:cook_book/db/model/shoppinglist_model/shoppinglist_model.dart';
import 'package:cook_book/db/model/usermodel/user_model.dart';
import 'package:cook_book/screen/splash_screen/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
  Hive.registerAdapter(CustomCatModelAdapter());
  Hive.registerAdapter(RecipeModelAdapter());
  Hive.registerAdapter(IngredientModelAdapter());
  // Check if the box is already open before opening it
  if (!Hive.isBoxOpen('userBox')) {
    await Hive.openBox<UserModel>('userBox');
  }
  // Check if the box is already open before opening it
  if (!Hive.isBoxOpen('catBox')) {
    await Hive.openBox<CustomCatModel>('catBox');
  }
  // Check if the box is already open before opening it
  if (!Hive.isBoxOpen('recipeBox')) {
    await Hive.openBox<RecipeModel>('recipeBox');
  }
  if (!Hive.isBoxOpen('ingredientBox')) {
    await Hive.openBox<IngredientModel>('ingredientBox');
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splashscreen(),
    );
  }
}
