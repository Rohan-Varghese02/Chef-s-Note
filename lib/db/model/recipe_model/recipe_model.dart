import 'dart:typed_data';

import 'package:hive/hive.dart';
part 'recipe_model.g.dart';

@HiveType(typeId: 2)
class RecipeModel extends HiveObject {
  @HiveField(0)
  int? id;
  @HiveField(1)
  Uint8List? recipePic;
  @HiveField(2)
  final String name;
  @HiveField(3)
  final List<String> ingridients;
  @HiveField(4)
  final List<String> qty;
  @HiveField(5)
  final List<String> direction;
  @HiveField(6)
  final int? categoryId;
  @HiveField(7)
  bool? isFav;
  @HiveField(8)
  final String time;
  @HiveField(9)
  final String rating;
  @HiveField(10)
  final String difficulty;

  RecipeModel(
      {this.id,
      required this.categoryId,
      required this.recipePic,
      required this.name,
      required this.time,
      required this.rating,
      required this.difficulty,
      required this.ingridients,
      required this.qty,
      required this.direction,
      this.isFav});
}
