
import 'package:exercise_app/core/services/local_storage_service.dart';
import 'package:exercise_app/feature/Auth/domain/repository/auth_repository.dart';
import 'package:exercise_app/feature/Auth/domain/usecases/login_usecase.dart';
import 'package:exercise_app/feature/Auth/domain/usecases/sign_up_usecase.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LocalStorageService _storage;
  final AuthRepository authRepository;
  final LoginUsecase loginUsecase;
  final SignUpUsecase signUpUsecase;
  AuthBloc(  
    this.authRepository,
    this.loginUsecase,
    this.signUpUsecase,
    this._storage
  ): super(AuthInitial()) {
    on<AppStarted>((event, emit) async{
      final hasSeenOnboarding = await _storage.hasSeenOnboarding();
      if(!hasSeenOnboarding){
        emit(AppUnonboarded());
      }
      else{emit(Appboarded());}
    });
    on<OnboardingFinished>((event, emit){
        emit(Appboarded());
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
          emit(AuthSuccess(user));
        }
        else{
          emit(AuthFailure("Login failed"));
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
          emit(AuthSuccess(user));
        }
        else{
          emit(AuthFailure('Sign up failed'));
        }
      } catch(e){
        emit(AuthFailure(e.toString()));
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
