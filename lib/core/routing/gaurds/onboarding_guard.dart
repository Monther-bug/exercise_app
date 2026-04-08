import 'package:auto_route/auto_route.dart';
import 'package:exercise_app/core/di/injection_container.dart';
import 'package:exercise_app/core/routing/app_router.gr.dart';
import 'package:exercise_app/feature/Auth/presentation/bloc/auth_bloc.dart';

// class OnboardingGuard  extends AutoRouteGuard{
//   @override
//   void onNavigation(NavigationResolver resolver, StackRouter router){
    
//     final state = locator<AuthBloc>().state;
//       final authBloc = locator<AuthBloc>();
   
//     if (state is AuthInitial) {
//       authBloc.add(AppStarted());
//     }
//     if(state is Appboarded){
//       resolver.next(true);
//     }
//     if(state is AppUnonboarded){
//      router.push(OnboardingScreenRoute());
//     }
//     else if (state is AuthInitial || state is AuthLoading){
//       return;
//     }
//     else{
//       resolver.next(true);
//     }
//   }  
// }

class OnboardingGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final state = locator<AuthBloc>().state;

    if (state is AppUnonboarded) {
      router.push(OnboardingScreenRoute());
    } else {
      // Allow through if already boarded OR if still loading 
      // (let the UI handle the loading state)
      resolver.next(true);
    }
  }
}