import 'package:cook_book/db/dbfunction/category_notifier.dart';
import 'package:cook_book/db/model/custom_cat_model.dart';
import 'package:cook_book/db/model/user_model.dart';
import 'package:cook_book/screen/splashscreen/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

const save_State = 'UserLoggin';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(UserModelAdapter());
  Hive.registerAdapter(CustomCatModelAdapter());

  // Check if the box is already open before opening it
  if (!Hive.isBoxOpen('userBox')) {
    await Hive.openBox<UserModel>('userBox');
  }
  // Check if the box is already open before opening it
  if (!Hive.isBoxOpen('catBox')) {
    await Hive.openBox<CustomCatModel>('catBox');
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Splashscreen(),
    );
  }
}