import 'package:exercise_app/feature/home/domain/enitites/exercise_entity.dart';
import 'package:hive/hive.dart';

part 'exercise_local_model.g.dart';

@HiveType(typeId: 0)
class ExerciseLocalModel extends HiveObject{

  @HiveField(0)
  final String name;

  @HiveField(1)
  final String type;

  @HiveField(2)
  final String muscle;

  @HiveField(3)
  final String difficulty;

  @HiveField(4)
  final String instructions;

  @HiveField(5)
  final List<String> equipments;

  @HiveField(6)
  final String safetyInfo;

  ExerciseLocalModel({
    required this.name,
    required this.type,
    required this.muscle,
    required this.difficulty,
    required this.instructions,
    required this.equipments,
    required this.safetyInfo,
  });

  factory ExerciseLocalModel.fromEntity(ExerciseEntity entity){
    return ExerciseLocalModel(
      name: entity.name, 
      type: entity.type, 
      muscle: entity.muscle, 
      difficulty: entity.difficulty, 
      instructions: entity.instructions, 
      equipments: entity.equipments, 
      safetyInfo: entity.safetyInfo);
  }

  ExerciseEntity toEntity() {
    return ExerciseEntity(
      name: name,
      type: type,
      muscle: muscle,
      difficulty: difficulty,
      instructions: instructions,
      equipments: equipments,
      safetyInfo: safetyInfo,
    );
  }
}





