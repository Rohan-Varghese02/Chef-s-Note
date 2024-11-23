import 'dart:typed_data';
import 'package:hive/hive.dart';

part 'user_model.g.dart'; // This should match the filename

@HiveType(typeId: 0)
class UserModel extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  List<String> cuisine;

  @HiveField(2)
  Uint8List? profilePic;

  UserModel({required this.name, required this.cuisine, required this.profilePic});
}