import 'package:app/onboarding/widgets/feature_section.dart';
import 'package:app/onboarding/widgets/hero_section.dart';
import 'package:flutter/material.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [const HeroSection(), FeatureSection()],
      ),
    );
  }
}
