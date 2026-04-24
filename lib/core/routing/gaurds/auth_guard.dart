import 'package:auto_route/auto_route.dart';
import 'package:exercise_app/core/di/injection_container.dart';
import 'package:exercise_app/core/routing/app_router.gr.dart';
import 'package:exercise_app/feature/Auth/presentation/bloc/auth_bloc.dart';
import 'package:exercise_app/feature/Auth/presentation/bloc/auth_status_bloc/bloc/auth_status_bloc.dart';

class AuthGuard  extends AutoRouteGuard{
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router){
    final state = locator<AuthStatusBloc>().state;  
     //final authBloc = locator<AuthBloc>();     
    
    if(state is Authenticated ){
      resolver.next(true);
    }
    else if(state is Unauthenticated){
      router.push(LoginScreenRoute());
       resolver.next(false);
    }
    else{
      resolver.next(false);
    }

  }


  
}