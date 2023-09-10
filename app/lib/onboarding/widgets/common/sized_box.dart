import 'package:flutter/material.dart';

class AppSizedBoxOfWidth extends StatelessWidget {
  final double? width;
  const AppSizedBoxOfWidth({super.key, this.width});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 16,
    );
  }
}

class AppSizedBoxOfHeight extends StatelessWidget {
  final double? height;
  const AppSizedBoxOfHeight({super.key, this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 16,
    );
  }
}
