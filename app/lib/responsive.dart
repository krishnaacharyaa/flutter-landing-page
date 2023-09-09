import 'package:app/core/util/constants.dart';
import 'package:flutter/material.dart';

class Responsive {
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < AppConstants.maxMobileScreenWidth;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= AppConstants.minTabletScreenWidth &&
      MediaQuery.of(context).size.width < AppConstants.maxTabletScreenWidth;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= AppConstants.minDesktopScreenWidth;
}
