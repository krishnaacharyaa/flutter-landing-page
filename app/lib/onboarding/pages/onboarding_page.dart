import 'package:app/onboarding/widgets/navbar_section.dart';
import 'package:app/onboarding/widgets/sidebar.dart';
import 'package:flutter/material.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const Drawer(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        child: SideBar(),
      ),
      body: ListView(
        children: const [NavBarSection()],
      ),
    );
  }
}
