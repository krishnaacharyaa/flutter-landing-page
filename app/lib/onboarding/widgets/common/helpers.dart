import 'package:flutter/material.dart';

class SizedBoxWithWidth extends StatelessWidget {
  final double? width;
  const SizedBoxWithWidth({super.key, this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 16,
    );
  }
}

class SizedBoxWithHeight extends StatelessWidget {
  final double? height;
  const SizedBoxWithHeight({super.key, this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 16,
    );
  }
}
