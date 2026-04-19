
import 'package:exercise_app/core/services/local_storage_service.dart';
import 'package:exercise_app/core/utils/l10n_extension.dart';
import 'package:exercise_app/feature/Auth/domain/entities/user_entity.dart';
import 'package:exercise_app/feature/Auth/domain/repository/auth_repository.dart';
import 'package:exercise_app/feature/Auth/domain/usecases/google_sign_in_usecase.dart';
import 'package:exercise_app/feature/Auth/domain/usecases/login_usecase.dart';
import 'package:exercise_app/feature/Auth/domain/usecases/sign_up_usecase.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LocalStorageService _storage;
  final AuthRepository authRepository;
  final LoginUsecase loginUsecase;
  final SignUpUsecase signUpUsecase;
  final GoogleSignInUsecase googleSignInUsecase;
  AuthBloc(  
    this.authRepository,
    this.loginUsecase,
    this.signUpUsecase,
    this._storage,
    this.googleSignInUsecase
  ): super(AuthInitial()) {
    on<AppStarted>((event, emit) async{
      final hasSeenOnboarding = await _storage.hasSeenOnboarding();
      if(!hasSeenOnboarding){
        emit(AppUnonboarded());
      }
      else{emit(Appboarded());
      add(AuthCheck());}
    });
    on<OnboardingFinished>((event, emit){
        emit(Appboarded());
        add(AuthCheck());        
      });

    on<AuthCheck> ((event, emit) async{
      emit(AuthLoading());
      final user = authRepository.getCurrentUSer();
      if(user != null){
        emit(Authenticated());
      }
      else{
        emit(Unauthenticated());
      }
    });

    on<LoginSubmitted>((event, emit) async{       
      emit(AuthLoading());
      try{
        final user = await loginUsecase(event.email, event.password);
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
      emit(AuthLoading());
      try{
        final user = await signUpUsecase(event.name,event.email, event.password);
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
      emit(AuthLoading());
      try{
        final user = await googleSignInUsecase();
        if(user != null ){
          emit (AuthSuccess(user :user,source: AuthSource.google));
        }
        else{
          // User canceled sign-in flow.          
         emit(Unauthenticated());
        }
      }  catch (e) {
        final error = e.toString().toLowerCase();  
        if (error.contains('canceled') || error.contains('closed')) {
          emit(Unauthenticated()); 
          return;
        }
        emit(AuthFailure(e.toString())); // Only show real errors
      }
    });
    on<LogoutRequested>((event,emit) async{
      emit(AuthLoading());
      try{
        await authRepository.logout();
        emit(Unauthenticated());
      }catch(e){
        emit(AuthFailure(e.toString()));
      }
      
    });

    
  }
}
