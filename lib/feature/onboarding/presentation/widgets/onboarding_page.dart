import 'package:flutter/material.dart';

class OnboardingPageWidget extends StatelessWidget {
  final String title;
  final String description;
  //final String imagePath;

  const OnboardingPageWidget({
    super.key,
    required this.title,
    required this.description,
   // required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
       // Image.asset(imagePath),
        Text(title),
        Text(description),
      ],
    );
  }
}