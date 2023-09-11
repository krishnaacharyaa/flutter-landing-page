import 'package:app/core/util/entities.dart';
import 'package:app/core/util/responsive/responsive_text.dart';
import 'package:app/core/util/responsive/responsive_text_style.dart';
import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String heading;
  const SectionHeader({super.key, required this.heading});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ResponsiveText(
            text: heading,
            textStyle: getResponsiveTextStyle(context, AppTextTheme.headline)),
        const SizedBox(height: 16),
        Container(
          color: Theme.of(context).primaryColor,
          height: 6,
          width: 80,
          padding: const EdgeInsets.symmetric(horizontal: 16),
        )
      ],
    );
  }
}
