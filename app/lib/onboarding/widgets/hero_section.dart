import 'package:app/responsive.dart';
import 'package:flutter/material.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Imagination Meets Intelligence",
          style: Responsive.isDesktop(context)
              ? const TextStyle(fontSize: 48)
              : const TextStyle(fontSize: 24),
        ),
        Image.asset("images/hero_image.png")
      ],
    );
  }
}
