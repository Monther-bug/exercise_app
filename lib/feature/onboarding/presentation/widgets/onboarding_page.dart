import 'package:flutter/material.dart';

class OnboardingPageWidget extends StatelessWidget {
  final String title;
  final String description; 

  const OnboardingPageWidget({
    super.key,
    required this.title,
    required this.description,   
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [      
        Text(title),
        Text(description),
      ],
    );
  }
}