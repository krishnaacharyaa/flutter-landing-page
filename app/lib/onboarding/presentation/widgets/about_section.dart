import 'package:app/core/util/entities.dart';
import 'package:app/core/util/responsive/responsive_text.dart';
import 'package:app/core/util/responsive/responsive_text_style.dart';
import 'package:app/onboarding/presentation/widgets/common/section_header.dart';
import 'package:app/onboarding/utils/constants.dart';
import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  final GlobalKey aboutKey;
  const AboutSection({super.key, required this.aboutKey});

  @override
  Widget build(BuildContext context) {
    return Column(
      key: aboutKey,
      children: [
        const SectionHeader(heading: "About Us"),
        ResponsiveText(
            text: aboutUsString,
            textStyle: getResponsiveTextStyle(context, AppTextTheme.title))
      ],
    );
  }
}
