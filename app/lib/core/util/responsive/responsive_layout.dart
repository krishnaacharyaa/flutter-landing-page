import 'package:app/core/util/constants.dart';
import 'package:app/core/util/entities.dart';
import 'package:flutter/material.dart';

bool isMobile(BuildContext context) =>
    MediaQuery.of(context).size.width < AppConstants.maxMobileScreenWidth;

bool isTablet(BuildContext context) =>
    MediaQuery.of(context).size.width >= AppConstants.minTabletScreenWidth &&
    MediaQuery.of(context).size.width < AppConstants.maxTabletScreenWidth;

bool isDesktop(BuildContext context) =>
    MediaQuery.of(context).size.width >= AppConstants.minDesktopScreenWidth;

AppSize getAppSize(BuildContext context) {
  if (isDesktop(context)) {
    return AppSize.desktop;
  } else if (isTablet(context)) {
    return AppSize.tablet;
  } else {
    return AppSize.mobile;
  }
}
