import 'package:exercise_app/feature/onboarding/bloc/on_boarding_bloc.dart';
import 'package:exercise_app/core/utils/l10n_extension.dart';
import 'package:exercise_app/feature/onboarding/presentation/widgets/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingBody extends StatefulWidget {
  const OnboardingBody({super.key});

  @override
  State<OnboardingBody> createState() => _OnboardingBodyState();
}

class _OnboardingBodyState extends State<OnboardingBody> {
  final PageController pageController = PageController();
  final ValueNotifier<int> currentPage = ValueNotifier<int>(0);  

  @override
  void dispose() {
    pageController.dispose();
    currentPage.dispose();
    super.dispose();
  }

  @override  
  Widget build(BuildContext context) {           
    final l10n = context.l10n;
    return  Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: (index) =>  currentPage.value = index ,
        children: [
          OnboardingPageWidget(title: l10n.onboardingTitle1, description: l10n.onboardingDescription1,),
          OnboardingPageWidget(title: l10n.onboardingTitle2, description: l10n.onboardingDescription2,),
          OnboardingPageWidget(title: l10n.onboardingTitle3, description: l10n.onboardingDescription3,)
        ],                
      ),
      floatingActionButton: ValueListenableBuilder(
        valueListenable: currentPage,
        builder: (context, value, child) {
          return FloatingActionButton(
            onPressed: () {
              if (value == 2) {          
                context.read<OnBoardingBloc>().add(CompleteOnboarding());              
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
