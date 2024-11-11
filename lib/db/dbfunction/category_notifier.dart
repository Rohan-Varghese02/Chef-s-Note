import 'package:cook_book/db/model/custom_cat_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';

final ValueNotifier<List<CustomCatModel>> categoryListNotifier =
    ValueNotifier([]);

Future<void> addCategory(CustomCatModel value) async {
  final categoryDB = await Hive.openBox<CustomCatModel>('catBox');
  //print('Success');
  final _id = await categoryDB.add(value);
  value.id = _id;
  await categoryDB.put(_id, value);
  categoryListNotifier.value.add(value);
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
