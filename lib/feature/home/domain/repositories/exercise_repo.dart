

import 'package:exercise_app/feature/home/domain/enitites/exercise_entity.dart';

abstract class ExerciseRepository{
  Future<List<ExerciseEntity>> getExercise();
}