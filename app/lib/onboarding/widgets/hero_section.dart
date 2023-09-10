import 'package:app/core/util/entities.dart';
import 'package:app/core/util/responsive/responsive_text_style.dart';
import 'package:flutter/material.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text("Imagination Meets Intelligence",
            style: getResponsiveTextStyle(context, AppTextTheme.display)),
        // Image.asset("images/hero_image.png")
      ],
    );
  }
}
