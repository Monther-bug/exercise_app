



import 'package:dio/dio.dart';
import 'package:exercise_app/core/network/api_client.dart';
import 'package:exercise_app/core/network/network_failure.dart';
import 'package:exercise_app/core/utils/l10n_extension.dart';
import 'package:exercise_app/feature/home/data/model/exercise_model.dart';
import 'package:exercise_app/feature/home/domain/enitites/exercise_entity.dart';
import 'package:exercise_app/feature/home/domain/repositories/exercise_repo.dart';
import 'package:fpdart/fpdart.dart';

class ExerciseRepositoryImp implements ExerciseRepository{
  final ApiClient apiClient;
  ExerciseRepositoryImp(this.apiClient);
  @override
    Future<Either<NetworkFailure, List<ExerciseEntity>>> getExercise(String? name) async {       
  try {
    final dio = apiClient.getDio(); 
    final Map<String, dynamic> params= {};
    if(name != null && name.isNotEmpty){
      params['name'] = name;    
    }
    else{
      params['muscle'] = 'biceps';
    }
    final response = await dio.get(
      'exercises',
      queryParameters: params
    );
    final List<dynamic> data = response.data;    
    final exercises = data.map((json) => ExerciseModel.fromJson(json)).toList().cast<ExerciseEntity>();

    return right(exercises);
   
  } on DioException catch (e) {
        if (e.error is NetworkFailure) {
        return left(e.error as NetworkFailure);
      }  
      return left(ServerFailure(e.message ?? AppMessageKey.unexpectedApiError));
    
  }   
}
}
