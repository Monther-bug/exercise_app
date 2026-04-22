

import 'package:exercise_app/core/network/network_failure.dart';
import 'package:exercise_app/feature/home/data/model/request/exercise_request.dart';
import 'package:exercise_app/feature/home/domain/enitites/exercise_entity.dart';
import 'package:fpdart/fpdart.dart';

abstract class ExerciseRepository{
  // Future<List<ExerciseEntity>> getExercise();
  Future<Either<NetworkFailure, List<ExerciseEntity>>> getExercise(EcerciseRequest request);
}