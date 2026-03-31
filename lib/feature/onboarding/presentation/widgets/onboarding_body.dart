import 'package:auto_route/auto_route.dart';
import 'package:exercise_app/core/routing/app_router.gr.dart';
import 'package:exercise_app/feature/onboarding/bloc/on_boarding_bloc.dart';
import 'package:exercise_app/feature/onboarding/presentation/widgets/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingBody extends StatelessWidget {
  const OnboardingBody({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController();
     final ValueNotifier<int> currentPage = ValueNotifier<int>(0);   
      @override
      void dispose() {
        pageController.dispose();
        currentPage.dispose();
        //super.dispose();
      }
    return  Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: (index) =>  currentPage.value = index ,
        children: [
          OnboardingPageWidget(title: '1', description: 'page',),
          OnboardingPageWidget(title: '2', description: 'page',),
          OnboardingPageWidget(title: '3', description: 'page',)
        ],                
      ),
      floatingActionButton: ValueListenableBuilder(
        valueListenable: currentPage,
        builder: (context, value, child) {
          return FloatingActionButton(
            onPressed: () {
              if (value == 2) {          
                context.read<OnBoardingBloc>().add(CompleteOnboarding());
               // AutoRouter.of(context).replace( MyHomePageRoute(title: ''));
              } else {
                // Navigate to next page
                pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.ease);
              }
            },
            child: Icon(value == 2 ? Icons.check : Icons.arrow_forward),
          );
        }
      ),
    );
  }
}