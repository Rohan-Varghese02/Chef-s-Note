import 'package:cook_book/db/model/custom_category/custom_cat_model.dart';
import 'package:flutter/foundation.dart';
// import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';

final ValueNotifier<List<CustomCatModel>> categoryListNotifier =
    ValueNotifier([]);

Future<void> addCategory(CustomCatModel value) async {
  final categoryDB = await Hive.openBox<CustomCatModel>('catBox');
  //print('Success');
  final id = await categoryDB.add(value);
  value.id = id;
  await categoryDB.put(id, value);
  categoryListNotifier.value.add(value);
  // ignore: invalid_use_of_protected_member
  categoryListNotifier.notifyListeners();
}

Future<void> getAllCategory() async {
  final categoryDB = await Hive.openBox<CustomCatModel>('catBox');
  categoryListNotifier.value.clear();

  categoryListNotifier.value.addAll(categoryDB.values);
  categoryListNotifier.notifyListeners();
}

Future<void> deleteCategory(int id) async {
  final categoryDB = await Hive.openBox<CustomCatModel>('catBox');
  await categoryDB.delete(id);
  getAllCategory();
}
