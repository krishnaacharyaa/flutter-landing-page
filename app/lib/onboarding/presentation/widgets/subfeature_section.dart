import 'package:app/core/util/responsive/responsive_layout.dart';
import 'package:app/onboarding/presentation/widgets/common/section_header.dart';
import 'package:app/onboarding/utils/constants.dart';
import 'package:flutter/material.dart';

class SubFeature extends StatelessWidget {
  const SubFeature({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SectionHeader(heading: subFeatureHeading),
        _buildResponsiveSubFeatureWidget(context)
      ],
    );
  }

  Widget _buildResponsiveSubFeatureWidget(BuildContext context) {
    return !isMobile(context)
        ? const Row(
            children: [
              Flexible(child: FeatureWidget(gifPath: subFeatureGIF1)),
              SizedBox(width: 56),
              Flexible(child: FeatureWidget(gifPath: subFeatureGIF2))
            ],
          )
        : const Column(
            children: [
              FeatureWidget(gifPath: subFeatureGIF1),
              SizedBox(height: 32),
              FeatureWidget(gifPath: subFeatureGIF2)
            ],
          );
  }
}

class FeatureWidget extends StatelessWidget {
  final String gifPath;
  const FeatureWidget({super.key, required this.gifPath});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: curvedBorderRadius,
        child: Image.asset(
          gifPath,
          fit: BoxFit.fill,
          height: heightOfGIF,
        ));
  }
}
