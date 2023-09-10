import 'package:app/core/util/constants.dart';
import 'package:app/core/util/responsive/responsive_layout.dart';
import 'package:app/onboarding/utils/constants.dart';
import 'package:app/onboarding/presentation/widgets/common/sized_box.dart';
import 'package:app/onboarding/widgets/feature_section.dart';
import 'package:app/onboarding/widgets/hero_section.dart';
import 'package:app/onboarding/widgets/navbar_section.dart';
import 'package:app/onboarding/widgets/side_bar.dart';
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
      body: Center(
        child: ConstrainedBox(
          constraints: _getConstraints(context),
          child: Padding(
            padding: _getPadding(context),
            child: ListView(
              children: [
                // const NavBarSection(),
                // AppSizedBoxOfHeight(height: _getHeight(context)),
                // const HeroSection(),
                AppSizedBoxOfHeight(height: _getHeight(context)),
                const FeatureSection()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

BoxConstraints _getConstraints(BuildContext context) {
  if (isDesktop(context)) {
    return const BoxConstraints(maxWidth: desktopContainerWidth);
  } else if (isTablet(context)) {
    return const BoxConstraints(maxWidth: tabletContainerWidth);
  }
  return const BoxConstraints(minWidth: minMobileScreenWidth);
}

EdgeInsets _getPadding(BuildContext context) {
  if (!isDesktop(context)) {
    return const EdgeInsets.symmetric(horizontal: 16);
  }
  return EdgeInsets.zero;
}

double _getHeight(BuildContext context) {
  if (isDesktop(context)) {
    return heightBetweenElementsDesktop;
  }
  if (isTablet(context)) {
    return heightBetweenElementsTablet;
  }
  return heightBetweenElementsMobile;
}
