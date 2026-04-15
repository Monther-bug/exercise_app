// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exercise_local_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ExerciseLocalModelAdapter extends TypeAdapter<ExerciseLocalModel> {
  @override
  final int typeId = 0;

  @override
  ExerciseLocalModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ExerciseLocalModel(
      name: fields[0] as String,
      type: fields[1] as String,
      muscle: fields[2] as String,
      difficulty: fields[3] as String,
      instructions: fields[4] as String,
      equipments: (fields[5] as List).cast<String>(),
      safetyInfo: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ExerciseLocalModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.type)
      ..writeByte(2)
      ..write(obj.muscle)
      ..writeByte(3)
      ..write(obj.difficulty)
      ..writeByte(4)
      ..write(obj.instructions)
      ..writeByte(5)
      ..write(obj.equipments)
      ..writeByte(6)
      ..write(obj.safetyInfo);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ExerciseLocalModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
