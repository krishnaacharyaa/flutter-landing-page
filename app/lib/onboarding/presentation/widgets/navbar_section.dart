import 'package:app/core/util/entities.dart';
import 'package:app/core/util/responsive/responsive_text.dart';
import 'package:app/core/util/responsive/responsive_text_style.dart';
import 'package:app/onboarding/utils/constants.dart';
import 'package:app/onboarding/presentation/widgets/common/call_out_button.dart';
import 'package:app/core/util/responsive/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavBarSection extends StatelessWidget {
  final GlobalKey featureKey;
  final GlobalKey aboutKey;
  const NavBarSection(
      {super.key, required this.aboutKey, required this.featureKey});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Logo(),
        if (!isMobile(context))
          NavBarItems(aboutKey: aboutKey, featureKey: featureKey),
        if (!isMobile(context)) const CallOutButtons(),
        if (isMobile(context))
          InkWell(
              onTap: () {
                Scaffold.of(context).openEndDrawer();
              },
              child: const Icon(Icons.menu))
      ],
    );
  }
}

class CallOutButtons extends StatelessWidget {
  const CallOutButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [AppOutlineButton(), SizedBox(width: 16), AppFilledButton()],
    );
  }
}

class NavBarItems extends StatelessWidget {
  final GlobalKey featureKey;
  final GlobalKey aboutKey;
  const NavBarItems(
      {super.key, required this.aboutKey, required this.featureKey});

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: navItems
            .map(
              (item) => Row(
                children: [
                  InkWell(
                    onTap: () {
                      Scrollable.ensureVisible(
                        item == product
                            ? featureKey.currentContext!
                            : item == about
                                ? aboutKey.currentContext!
                                : context,
                        duration: const Duration(milliseconds: 1000),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: ResponsiveText(
                      text: item,
                      textStyle:
                          getResponsiveTextStyle(context, AppTextTheme.title),
                    ),
                  ),
                  const SizedBox(width: 16)
                ],
              ),
            )
            .toList());
  }
}

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        ResponsiveText(
            text: logoTitle,
            textStyle: getResponsiveTextStyle(context, AppTextTheme.headline)),
        const SizedBox(width: 16),
        SvgPicture.asset(
          logoIcon,
          height: sizeOfLogo(context),
          width: sizeOfLogo(context),
        ),
      ],
    );
  }
}

double sizeOfLogo(BuildContext context) {
  if (isDesktop(context)) {
    return logoSizeDesktop;
  }
  if (isTablet(context)) {
    return logoSizeTablet;
  }
  return logoSizeMobile;
}
