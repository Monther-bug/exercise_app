
import 'package:exercise_app/feature/home/domain/enitites/exercise_entity.dart';

abstract class FavoritesRepository {
  Future<void> toggleFavorites(ExerciseEntity exercise);
  Future<List<ExerciseEntity>> getFavorites();
}