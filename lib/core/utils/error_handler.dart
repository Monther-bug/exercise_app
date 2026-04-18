
import 'package:dio/dio.dart';
import 'package:exercise_app/core/network/network_failure.dart';
import 'package:exercise_app/core/utils/l10n_extension.dart';


// class ErrorHandler {
//   // This is the "Translator" - it turns Dio errors into YOUR errors
//   static NetworkFailure mapDioException(DioException e) {
//     switch (e.type) {
//       case DioExceptionType.connectionError:
//       case DioExceptionType.connectionTimeout:
//         return const NoConnectionfailure();
        
//       case DioExceptionType.badResponse:
//         final statusCode = e.response?.statusCode;
//         if (statusCode == 401) return const UnauthorizedFailure();
//         return ServerFailure(e.message ?? 'Server Error');

//       default:
//         return ServerFailure(e.message ?? 'An unexpected error occurred');
//     }
//   }
// }\

class ErrorHandler extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler){
    final statusCode = err.response?.statusCode;
    final eType = err.type;

    switch(eType){
        case DioExceptionType.connectionTimeout:
        case DioExceptionType.receiveTimeout:
        case DioExceptionType.sendTimeout:
          err = err.copyWith(error : const TimeoutFailure());
          return;

        case DioExceptionType.connectionError:
          err = err.copyWith(error: const NoConnectionfailure());
          return;

        default:
          break;
      }


    if(statusCode != null){
      switch(statusCode){
        case 401: 
          err = err.copyWith(error: const UnauthorizedFailure());
          break;
        
        case 500:
          err = err.copyWith(error: const ServerFailure(AppMessageKey.serverError));
          break;

        case 400: 
        err = err.copyWith(error: const BadRequestFailure());
        break;

        case 404: 
        err = err.copyWith(error: const NotFoundFailure());
        break;

        case 422:
        err = err.copyWith(error: const ValidationFailure());
        break;

        default:
          err = err.copyWith(error: const ServerFailure(AppMessageKey.unknownServerError));
      }
    }

    

      
      handler.next(err);
    
  }
}
