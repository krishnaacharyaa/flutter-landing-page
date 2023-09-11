import 'package:app/core/util/constants.dart';
import 'package:app/core/util/responsive/responsive_layout.dart';
import 'package:app/onboarding/presentation/widgets/about_section.dart';
import 'package:app/onboarding/presentation/widgets/award_section.dart';
import 'package:app/onboarding/presentation/widgets/community_section.dart';
import 'package:app/onboarding/presentation/widgets/feature_section.dart';
import 'package:app/onboarding/presentation/widgets/footer_section.dart';
import 'package:app/onboarding/presentation/widgets/hero_section.dart';
import 'package:app/onboarding/presentation/widgets/navbar_section.dart';
import 'package:app/onboarding/presentation/widgets/side_bar.dart';
import 'package:app/onboarding/presentation/widgets/subfeature_section.dart';
import 'package:app/onboarding/utils/constants.dart';
import 'package:flutter/material.dart';

class OnBoardingPage extends StatelessWidget {
  final GlobalKey aboutKey = GlobalKey();
  final GlobalKey featureKey = GlobalKey();
  OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: Drawer(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
        child: SideBar(aboutKey: aboutKey, featureKey: featureKey),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: _getConstraints(context),
          child: Padding(
            padding: _getPadding(context),
            child: ScrollConfiguration(
              behavior:
                  ScrollConfiguration.of(context).copyWith(scrollbars: false),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    NavBarSection(aboutKey: aboutKey, featureKey: featureKey),
                    SizedBox(height: _getHeight(context)),
                    const HeroSection(),
                    SizedBox(height: _getHeight(context)),
                    FeatureSection(featureKey: featureKey),
                    SizedBox(height: _getHeight(context)),
                    const SubFeature(),
                    SizedBox(height: _getHeight(context)),
                    const CommunitySection(),
                    const SizedBox(height: 32),
                    AboutSection(aboutKey: aboutKey),
                    SizedBox(height: _getHeight(context)),
                    const AwardsSection(),
                    SizedBox(height: _getHeight(context)),
                    const FooterSection(),
                  ],
                ),
              ),
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
    return const EdgeInsets.symmetric(horizontal: 16, vertical: 8);
  }
  return const EdgeInsets.only(bottom: 16);
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
