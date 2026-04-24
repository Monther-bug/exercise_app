

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/di/injection_container.dart';
import '../../../../../../core/utils/l10n_extension.dart';
import '../../../../data/models/request/login_request.dart';
import '../../../../data/models/request/sign_up_request.dart';
import '../../../../domain/entities/user_entity.dart';
import '../../../../domain/usecases/google_sign_in_usecase.dart';
import '../../../../domain/usecases/login_usecase.dart';
import '../../../../domain/usecases/sign_up_usecase.dart';

part 'auth_action_event.dart';
part 'auth_action_state.dart';

class AuthActionBloc extends Bloc<AuthActionEvent, AuthActionState> {
  AuthActionBloc() : super(AuthActionInitial()) {
   on<LoginSubmitted>((event, emit) async{       
      emit(AuthActionLoading ());
      try{
        final user = await locator<LoginUsecase>()(event.request);
        if(user!= null){
          emit(AuthSuccess(user:user,  source: AuthSource.login));
        }
        else{
          emit(AuthFailure(AppMessageKey.loginFailed));
        }
      } catch(e){
        emit(AuthFailure(e.toString()));
      }
    });

    on<SignUpSubmitted>((event, emit) async{       
      emit(AuthActionLoading ());
      try{
        final user = await locator<SignUpUsecase>()(event.request);
        if(user!= null){
          emit(AuthSuccess(user: user, source: AuthSource.signUp));
        }
        else{
          emit(AuthFailure(AppMessageKey.signUpFailed));
        }
      } catch(e){
        emit(AuthFailure(e.toString()));
      }
    });
    on<GoogleSignInRequested>((event, emit) async{
      emit(AuthActionLoading ());
      try{
        final user = await locator<GoogleSignInUsecase>()();
        if(user != null ){
          emit (AuthSuccess(user :user,source: AuthSource.google));
        }
        else{
          // User canceled sign-in flow.          
         emit(AuthActionInitial());
        }
      }  catch (e) {
        final error = e.toString().toLowerCase();  
        if (error.contains('canceled') || error.contains('closed')) {   
          emit(AuthActionInitial());       
          return;
        }
        emit(AuthFailure(e.toString())); // Only show real errors
      }
    });
  }
}
