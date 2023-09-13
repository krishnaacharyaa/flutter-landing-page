import 'package:app/onboarding/presentation/widgets/about_section.dart';
import 'package:app/onboarding/presentation/widgets/award_section.dart';
import 'package:app/onboarding/presentation/widgets/community_section.dart';
import 'package:app/onboarding/presentation/widgets/feature_section.dart';
import 'package:app/onboarding/presentation/widgets/footer_section.dart';
import 'package:app/onboarding/presentation/widgets/hero_section.dart';
import 'package:app/onboarding/presentation/widgets/navbar_section.dart';
import 'package:app/onboarding/presentation/widgets/side_bar.dart';
import 'package:app/onboarding/presentation/widgets/subfeature_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:app/onboarding/presentation/pages/onboarding_page.dart';

void main() {
  testWidgets('Check if OnBoardingPage renders correctly',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1300, 800);

    await tester.pumpWidget(
      const MaterialApp(
        home: OnBoardingPage(),
      ),
    );

    expect(find.byType(NavBarSection), findsOneWidget);
    expect(find.byType(HeroSection), findsOneWidget);
    expect(find.byType(FeatureSection), findsOneWidget);
    expect(find.byType(SubFeature), findsOneWidget);
    expect(find.byType(CommunitySection), findsOneWidget);
    expect(find.byType(AboutSection), findsOneWidget);
    expect(find.byType(AwardsSection), findsOneWidget);
    expect(find.byType(FooterSection), findsOneWidget);

    await tester.pump(const Duration(seconds: 10));
  });

  testWidgets('Check if Sidebar renders correctly after menu click',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1300, 800);

    await tester.pumpWidget(
      const MaterialApp(home: OnBoardingPage()),
    );

    await tester.tap(find.byIcon(Icons.menu));
    await tester.pump(const Duration(seconds: 10));

    expect(find.byType(SideBar), findsOneWidget);
  });
}
