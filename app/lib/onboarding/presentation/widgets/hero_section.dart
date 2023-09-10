import 'package:app/core/util/entities.dart';
import 'package:app/core/util/responsive/responsive_layout.dart';
import 'package:app/core/util/responsive/responsive_text.dart';
import 'package:app/core/util/responsive/responsive_text_style.dart';
import 'package:app/onboarding/utils/constants.dart';
import 'package:app/onboarding/presentation/widgets/common/call_out_button.dart';
import 'package:flutter/material.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return !isMobile(context)
        ? Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Flexible(child: _Content()),
              SizedBox(
                width: !isTablet(context) ? 96 : 72,
              ),
              const Flexible(child: _Image())
            ],
          )
        : const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [_Image(), SizedBox(height: 32), _Content()],
          );
  }
}

_getContainerHeight(BuildContext context) {
  if (isDesktop(context)) return heroImageHeightDesktop;
  if (isTablet(context)) return heroImageHeightTablet;
  return heroImageHeightMobile;
}

class _Image extends StatelessWidget {
  const _Image();

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      heroImage,
      fit: BoxFit.fill,
      width: double.infinity,
      height: _getContainerHeight(context),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ResponsiveHeaderText(
            text: heading,
            textStyle: getResponsiveTextStyle(context, AppTextTheme.display)),
        SizedBox(height: !isMobile(context) ? 32 : 16),
        ResponsiveText(
            text: subHeading,
            textStyle: getResponsiveTextStyle(context, AppTextTheme.headline)),
        SizedBox(height: !isMobile(context) ? 64 : 32),
        const AppFilledButton()
      ],
    );
  }
}
