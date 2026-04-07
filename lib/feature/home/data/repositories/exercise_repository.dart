



import 'package:dio/dio.dart';
import 'package:exercise_app/core/network/api_client.dart';
import 'package:exercise_app/feature/home/data/model/exercise_model.dart';
import 'package:exercise_app/feature/home/domain/enitites/exercise_entity.dart';
import 'package:exercise_app/feature/home/domain/repositories/exercise_repo.dart';

class ExerciseRepositoryImp implements ExerciseRepository{
  final ApiClient apiClient;
  ExerciseRepositoryImp(this.apiClient);
  @override
   Future<List<ExerciseEntity>> getExercise() async {       
  try {
    final dio = apiClient.getDio();
    
    final response = await dio.get(
      'exercises',
      queryParameters: {'muscle': 'biceps'},
    );
    final data = response.data;

    return data.map((json) => ExerciseModel.fromJson(json)).toList().cast<ExerciseEntity>();
   
  } on DioException catch (e) {

    rethrow;
    
  } catch (e) {
   // print("DEBUG: Unexpected non-Dio error: $e");
    rethrow;
  }
}
}