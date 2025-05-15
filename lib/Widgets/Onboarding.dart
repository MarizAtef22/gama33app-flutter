import 'package:flutter/material.dart';
import 'package:flutter_product_app/models/onboarding.dart';

class OnboardingWidget extends StatelessWidget {
  const OnboardingWidget({super.key, required this.content});
  final OnBoardingContent content;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          content.image,
          height: 250,
          width: 250,
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 15),
        Text(content.mainText,
            style: const TextStyle(
              fontSize: 40,
              fontFamily: 'Overlock',
            )),
        const SizedBox(height: 20),
        Text(content.subtitle1,
            style: const TextStyle(
              fontSize: 18,
              fontFamily: 'Overlock',
            )),
      ],
    );
  }
}
