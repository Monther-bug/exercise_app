import 'package:dio/dio.dart';
import 'package:exercise_app/core/utils/error_handler.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';


class ApiClient{
  
   Dio getDio(){
    final Dio dio = Dio();
    final String apiKey = dotenv.env['NINJA_API_KEY'] ?? '';
    dio.options = BaseOptions(
      baseUrl: 'https://api.api-ninjas.com/v1/',
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      contentType: 'application/json',
      headers:{
        'X-Api-Key': apiKey
      }      
    );

    dio.interceptors.add(InterceptorsWrapper(
      onRequest:(options, handler) async{ 
        try{
          // /final String? token = storageService.getToken();
          // if (token != null && token.isNotEmpty) {
          //   options.headers['Authorization'] = 'Bearer $token';
          // }
        } catch(e){
          ///print("DEBUG: Failed to retrieve token from storage: $e");
        }            
        return handler.next(options);  
      },
    
      
    ));
    dio.interceptors.add(ErrorHandler());
    return dio;
  }
  
  
}