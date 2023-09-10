import 'package:app/core/util/entities.dart';
import 'package:app/core/util/responsive/responsive_layout.dart';
import 'package:app/core/util/responsive/responsive_text.dart';
import 'package:app/core/util/responsive/responsive_text_style.dart';
import 'package:app/onboarding/widgets/common/call_out_button.dart';
import 'package:app/onboarding/widgets/common/sized_box.dart';
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
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ResponsiveHeaderText(
                        text: "Imagination Meets Intelligence",
                        textStyle: getResponsiveTextStyle(
                            context, AppTextTheme.display)),
                    const AppSizedBoxOfHeight(height: 32),
                    ResponsiveText(
                        text:
                            "As AI as your collaborator to create anything you can imagine",
                        textStyle: getResponsiveTextStyle(
                            context, AppTextTheme.headline)),
                    const AppSizedBoxOfHeight(height: 64),
                    const AppFilledButton()
                  ],
                ),
              ),
              Flexible(
                  child: Image.asset(
                "images/hero_image.png",
                fit: BoxFit.fill,
                height: _getContainerHeight(context),
              ))
            ],
          )
        : Column(
            children: [
              Image.asset(
                "images/hero_image.png",
                fit: BoxFit.fill,
                width: double.infinity,
                height: _getContainerHeight(context),
              ),
              const AppSizedBoxOfHeight(
                height: 32,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ResponsiveHeaderText(
                      text: "Imagination Meets Intelligence",
                      textStyle: getResponsiveTextStyle(
                          context, AppTextTheme.display)),
                  const AppSizedBoxOfHeight(height: 16),
                  ResponsiveText(
                      text:
                          "As AI as your collaborator to create anything you can imagine",
                      textStyle: getResponsiveTextStyle(
                          context, AppTextTheme.headline)),
                  const AppSizedBoxOfHeight(height: 32),
                  const AppFilledButton()
                ],
              ),
            ],
          );
  }
}

_getContainerHeight(BuildContext context) {
  if (isDesktop(context)) return 500;
  if (isTablet(context)) return 450;
  return 400;
}
