// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mindful_exercise_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MindfulExerciseModelAdapter extends TypeAdapter<MindfulExerciseModel> {
  @override
  final int typeId = 1;

  @override
  MindfulExerciseModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MindfulExerciseModel(
      category: fields[0] as String,
      name: fields[1] as String,
      description: fields[2] as String,
      instructions: (fields[3] as List).cast<String>(),
      duration: fields[4] as int,
      instructionsUrl: fields[5] as String,
      imagePath: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, MindfulExerciseModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.category)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.instructions)
      ..writeByte(4)
      ..write(obj.duration)
      ..writeByte(5)
      ..write(obj.instructionsUrl)
      ..writeByte(6)
      ..write(obj.imagePath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MindfulExerciseModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
