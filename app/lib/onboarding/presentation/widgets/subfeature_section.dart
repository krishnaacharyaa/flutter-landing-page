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
        const SectionHeader(heading: "Create Personal Image"),
        const SizedBox(height: 32),
        _buildResponsiveSubFeatureWidget(context)
      ],
    );
  }

  Widget _buildResponsiveSubFeatureWidget(BuildContext context) {
    return !isMobile(context)
        ? const Row(
            children: [
              Flexible(child: FeatureWidget(gifPath: "gifs/subfeature_1.gif")),
              SizedBox(width: 56),
              Flexible(child: FeatureWidget(gifPath: "gifs/subfeature_2.gif"))
            ],
          )
        : const Column(
            children: [
              FeatureWidget(gifPath: "gifs/subfeature_1.gif"),
              SizedBox(height: 32),
              FeatureWidget(gifPath: "gifs/subfeature_2.gif")
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
          height: 400,
        ));
  }
}
