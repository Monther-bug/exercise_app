import 'package:exercise_app/feature/onboarding/bloc/on_boarding_bloc.dart';
import 'package:exercise_app/core/utils/l10n_extension.dart';
import 'package:exercise_app/feature/onboarding/presentation/widgets/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class OnboardingBody extends StatefulWidget{
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

  // Helper to handle navigation logic
  void _handleNavigation(int index) {
    if (index == 1) { // 1 is the last index for a 2-page flow
      context.read<OnBoardingBloc>().add(CompleteOnboarding());
    } else {
      pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    
    return Scaffold(
      // The background color/gradient is handled inside OnboardingPageWidget
      body: PageView(
        controller: pageController,
        onPageChanged: (index) => currentPage.value = index,
        children: [
          // PAGE 1: MOVE
          OnboardingPageWidget(
            title: l10n.onboardingMoveTitle,
            backgroundText: l10n.onboardingMoveBackground,
            isLastPage: false,
            description: l10n.onboardingMoveDescription,
            onNext: () => _handleNavigation(0),
          ),
          // PAGE 2: READY?
          OnboardingPageWidget(
            title: l10n.onboardingReadyTitle,
            backgroundText: l10n.onboardingReadyBackground,
            isLastPage: true,
            description: l10n.onboardingReadyDescription,
            onNext: () => _handleNavigation(1),
          ),
        ],
      ),
      // Optional: You can keep or remove the FAB since the OnboardingPageWidget 
      // now has its own "Start Training" button. 
      
    );
  }
}
