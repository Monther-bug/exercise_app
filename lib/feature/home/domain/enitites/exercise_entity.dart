class ExerciseEntity {
  final String name;
  final String type;
  final String muscle;
  final String difficulty;
  final String instructions;
  final List<String> equipments;
  final String safetyInfo;
   
  ExerciseEntity({
    required this.name,
    required this.type,
    required this.muscle,
    required this.difficulty,
    required this.instructions,
    required this.equipments,
    required this.safetyInfo
  });
}