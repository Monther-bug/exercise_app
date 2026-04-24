

import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/di/injection_container.dart';
import '../../../../domain/usecases/get_user.dart';
import '../../../../domain/usecases/logout_usecase.dart';

part 'auth_status_event.dart';
part 'auth_status_state.dart';

class AuthStatusBloc extends Bloc<AuthStatusEvent, AuthStatusState> {
  AuthStatusBloc() : super(AuthStatusInitial()) {
    on<AuthCheck>((event, emit) {
      emit(AuthStatusLoading ());
      final user = locator<GetCurrentUSerUSeCase>()();      
      if(user != null){
        emit(Authenticated());
      }
      else{
        emit(Unauthenticated());
      }
    });

    on<LogoutRequested>((event,emit) async{
      emit(AuthStatusLoading ());
      try{
         await locator<LogoutUsecase>()();
          emit(Unauthenticated());
      }catch(_){         
      }
      emit(Unauthenticated());
      
    });
  }
}
