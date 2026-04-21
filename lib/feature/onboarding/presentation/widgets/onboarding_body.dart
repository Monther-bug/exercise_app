import 'package:exercise_app/feature/onboarding/bloc/on_boarding_bloc.dart';
import 'package:exercise_app/core/utils/l10n_extension.dart';
import 'package:exercise_app/feature/onboarding/presentation/widgets/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// class OnboardingBody extends StatefulWidget {
//   const OnboardingBody({super.key});

//   @override
//   State<OnboardingBody> createState() => _OnboardingBodyState();
// }

// class _OnboardingBodyState extends State<OnboardingBody> {
//   final PageController pageController = PageController();
//   final ValueNotifier<int> currentPage = ValueNotifier<int>(0);  

//   @override
//   void dispose() {
//     pageController.dispose();
//     currentPage.dispose();
//     super.dispose();
//   }

//   @override  
//   Widget build(BuildContext context) {           
//     final l10n = context.l10n;
//     return  Scaffold(
//       body: PageView(
//         controller: pageController,
//         onPageChanged: (index) =>  currentPage.value = index ,
//         children: [
//           OnboardingPageWidget(
//             title:  "MOVE", 
//             backgroundText: "MOVE", 
//             isLastPage: false,
//             description: "Precision tracking meets editorial elegance. Transform your peak performance into a visual masterpiece.",
//             onNext: ,),
//           OnboardingPageWidget(title: l10n.onboardingTitle3, description: l10n.onboardingDescription3,)
//         ],                
//       ),
//       floatingActionButton: ValueListenableBuilder(
//         valueListenable: currentPage,
//         builder: (context, value, child) {
//           return FloatingActionButton(
//             onPressed: () {
//               if (value == 2) {          
//                 context.read<OnBoardingBloc>().add(CompleteOnboarding());              
//               } else {
//                 // Navigate to next page
//                 pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.ease);
//               }
//             },
//             child: Icon(value == 2 ? Icons.check : Icons.arrow_forward),
//           );
//         }
//       ),
//     );
//   }
// }
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
            title: "MOVE",
            backgroundText: "MOVE",
            isLastPage: false,
            description: "Precision tracking meets editorial elegance. Transform your peak performance into a visual masterpiece.",
            onNext: () => _handleNavigation(0),
          ),
          // PAGE 2: READY?
          OnboardingPageWidget(
            title: "READY?",
            backgroundText: "WORK",
            isLastPage: true,
            description: "Your peak performance begins at the next tap. No excuses.",
            onNext: () => _handleNavigation(1),
          ),
        ],
      ),
      // Optional: You can keep or remove the FAB since the OnboardingPageWidget 
      // now has its own "Start Training" button. 
      
    );
  }
}
