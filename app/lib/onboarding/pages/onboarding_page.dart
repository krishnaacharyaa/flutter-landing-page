import 'package:app/onboarding/widgets/community_section.dart';
import 'package:app/onboarding/widgets/feature_section.dart';
import 'package:app/onboarding/widgets/hero_section.dart';
import 'package:app/onboarding/widgets/navbar_section.dart';
import 'package:flutter/material.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          child: ListView(
        children: const [
          ListTile(
            title: Text("Hello"),
          )
        ],
      )),
      body: ListView(
        children: const [NavBarSection()],
      ),
    );
  }
}
