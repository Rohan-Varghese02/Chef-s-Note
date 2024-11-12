// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecipeModelAdapter extends TypeAdapter<RecipeModel> {
  @override
  final int typeId = 2;

  @override
  RecipeModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RecipeModel(
      id: fields[0] as int?,
      categoryId: fields[6] as int?,
      recipePic: fields[1] as Uint8List?,
      name: fields[2] as String,
      ingridients: (fields[3] as List).cast<String>(),
      qty: (fields[4] as List).cast<String>(),
      direction: (fields[5] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, RecipeModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.recipePic)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.ingridients)
      ..writeByte(4)
      ..write(obj.qty)
      ..writeByte(5)
      ..write(obj.direction)
      ..writeByte(6)
      ..write(obj.categoryId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecipeModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
