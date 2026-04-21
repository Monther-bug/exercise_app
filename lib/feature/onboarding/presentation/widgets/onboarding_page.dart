

import 'package:exercise_app/core/utils/responsive_extension.dart';
import 'package:exercise_app/core/utils/l10n_extension.dart';
import 'package:flutter/material.dart';
import 'package:screentasia/screentasia.dart';

class OnboardingPageWidget extends StatelessWidget {
  final String title;
  final String description;
  final String? backgroundText; // e.g., "MOVE" or "WORK"
  final bool isLastPage;
  final VoidCallback onNext;

  const OnboardingPageWidget({
    super.key,
    required this.title,
    required this.description,
    this.backgroundText,
    this.isLastPage = false,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final l10n = context.l10n;
    return Container(
      width: double.infinity,
      height: double.infinity,
      // Page 1 uses a solid blue, Page 2 uses a gradient
      decoration: BoxDecoration(
        color: !isLastPage ? const Color(0xFF0047FF) : null,
        gradient: isLastPage
            ? const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF2D3436), Color(0xFFDED9FF)],
              )
            : null,
      ),
      child: Stack(
        children: [
          // 1. BACKGROUND LARGE TEXT
          if (backgroundText != null)
            Positioned(
              top:isLastPage? 10.hp: 20.hp,
              left:  -10.wp,
              child: Opacity(
                opacity: 0.1,
                child: Text(
                  backgroundText!,
                  style: textTheme.titleLarge?.copyWith(
                    fontSize: 180,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

          // 2. MAIN CONTENT
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.wp),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (!isLastPage) ...[
                  // Style for Page 1: "STAY IN MOMENTUM"
                  Text(
                    l10n.onboardingStayInMomentum,
                    style: textTheme.titleSmall?.copyWith(
                      color: Colors.white70,
                      letterSpacing: 4,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    title, // e.g., "MOVE"
                    style: textTheme.titleLarge?.copyWith(
                      color: Colors.white,
                      fontSize: 80,
                      height: 1.1,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ] else
                  // Style for Page 2: Frosted Glass Card
                  Center(
                    child: Container(
                      padding: EdgeInsets.all(8.wp),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 20,
                          )
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title, // e.g., "READY?"
                            style: textTheme.titleLarge?.copyWith(
                              color: const Color(0xFF0047FF),
                              fontSize: 50,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                
                const SizedBox(height: 20),
                
                SizedBox(
                  width: context.isMobile?60.wp: null,
                  child: Text(
                    softWrap: true,
                    description,
                    style: textTheme.bodyLarge?.copyWith(
                      color: !isLastPage ? Colors.white.withOpacity(0.8) : const Color(0xFF74739E),
                      fontSize: 18,
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // 3. BOTTOM BUTTON
          Positioned(
            bottom: 6.hp,
            left: 10.wp,
            right: 10.wp,
            child: SizedBox(
              height: 65,
              child: ElevatedButton(
                onPressed: onNext,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0047FF),
                  shape: const StadiumBorder(),
                  elevation: 0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      isLastPage ? l10n.onboardingStartTraining : l10n.onboardingNext,
                      style: textTheme.titleMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(width: 10),
                    const Icon(Icons.arrow_forward, color: Colors.white),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}