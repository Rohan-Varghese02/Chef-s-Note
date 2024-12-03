import 'package:hive/hive.dart';

part 'shoppinglist_model.g.dart';

@HiveType(typeId: 4) // Unique typeId for this model
class IngredientModel extends HiveObject {
  @HiveField(0)
  int? id;

  @HiveField(1)
  final String name;

  @HiveField(2)
   String quantity;

  IngredientModel({this.id,required this.name, required this.quantity});
}
