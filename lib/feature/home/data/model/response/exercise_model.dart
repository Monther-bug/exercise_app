import 'package:exercise_app/feature/home/domain/enitites/exercise_entity.dart';

class ExerciseModel extends ExerciseEntity{

ExerciseModel({
    required super.name,
    required super.type,
    required super.muscle,
    required super.equipments,
    required super.difficulty,   
    required super.instructions,
    required super.safetyInfo
});

factory ExerciseModel.fromJson(Map<String, dynamic> json) {
  //  final rawEquipments = json['equipments'];
  // final rawEquipment = json['equipment'];

  
    return ExerciseModel(
      name: json['name'] ?? '',
      type: json['type'] ?? '',
      muscle: json['muscle'] ?? '',
      difficulty: json['difficulty']?? '',
      // equipments: json['equipments'] ?? '',
      equipments: List<String>.from(json['equipments']??[]),
      // equipments: rawEquipments is List
      //     ? List<String>.from(rawEquipments)
      //     : rawEquipment is String && rawEquipment.isNotEmpty
      //         ? [rawEquipment]
      //         : <String>[],
      instructions: json['instructions'] ?? '',
      safetyInfo: json['safety_info'] ?? ''
    );
  }
  ExerciseEntity toEntity() => ExerciseEntity(
        name: name,
        type: type,
        muscle: muscle,
        difficulty: difficulty,
        instructions: instructions,
        equipments: equipments,
        safetyInfo: safetyInfo
      );
}
  
