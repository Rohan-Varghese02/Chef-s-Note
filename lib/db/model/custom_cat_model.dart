import 'dart:typed_data';

import 'package:hive/hive.dart';

part 'custom_cat_model.g.dart';

@HiveType(typeId: 1)
class CustomCatModel extends HiveObject {
  @HiveField(0)
  int? id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  Uint8List? titlePic;
  CustomCatModel({required this.title, this.titlePic, this.id});
}
