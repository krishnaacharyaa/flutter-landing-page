import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobile;
  final Widget desktop;
  final Widget tablet;
  const ResponsiveLayout({
    super.key,
    required this.tablet,
    required this.mobile,
    required this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 904) {
        return mobile;
      }
      if (constraints.maxWidth < 1239) {
        return tablet;
      }
      return desktop;
    });
  }
}
