import 'package:app/core/util/entities.dart';
import 'package:app/core/util/responsive/responsive_layout.dart';
import 'package:flutter/material.dart';

TextStyle getResponsiveTextStyle(
    BuildContext context, AppTextTheme appTextTheme) {
  final AppSize appSize = getAppSize(context);

  return _getTextStyle(context, appTextTheme, appSize);
}

TextStyle _getTextStyle(
    BuildContext context, AppTextTheme appTextTheme, AppSize appSize) {
  TextStyle? textStyle;

  switch (appSize) {
    case AppSize.desktop:
      textStyle = _getTextStyleForDesktop(context, appTextTheme);
      break;
    case AppSize.tablet:
      textStyle = _getTextStyleForTablet(context, appTextTheme);
      break;
    case AppSize.mobile:
      textStyle = _getTextStyleForMobile(context, appTextTheme);
      break;
  }

  return textStyle ?? const TextStyle();
}

TextStyle? _getTextStyleForDesktop(
    BuildContext context, AppTextTheme appTextTheme) {
  final ThemeData theme = Theme.of(context);

  switch (appTextTheme) {
    case AppTextTheme.display:
      return theme.textTheme.displayLarge;
    case AppTextTheme.headline:
      return theme.textTheme.headlineLarge;
    case AppTextTheme.title:
      return theme.textTheme.titleLarge;
    case AppTextTheme.label:
      return theme.textTheme.labelLarge;
  }
}

TextStyle? _getTextStyleForTablet(
    BuildContext context, AppTextTheme appTextTheme) {
  final ThemeData theme = Theme.of(context);

  switch (appTextTheme) {
    case AppTextTheme.display:
      return theme.textTheme.displayMedium;
    case AppTextTheme.headline:
      return theme.textTheme.headlineMedium;
    case AppTextTheme.title:
      return theme.textTheme.titleMedium;
    case AppTextTheme.label:
      return theme.textTheme.labelMedium;
  }
}

TextStyle? _getTextStyleForMobile(
    BuildContext context, AppTextTheme appTextTheme) {
  final ThemeData theme = Theme.of(context);

  switch (appTextTheme) {
    case AppTextTheme.display:
      return theme.textTheme.displaySmall;
    case AppTextTheme.headline:
      return theme.textTheme.headlineSmall;
    case AppTextTheme.title:
      return theme.textTheme.titleMedium;
    case AppTextTheme.label:
      return theme.textTheme.labelMedium;
  }
}
