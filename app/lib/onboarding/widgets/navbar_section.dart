import 'package:app/core/util/entities.dart';
import 'package:app/core/util/responsive/responsive_text.dart';
import 'package:app/core/util/responsive/responsive_text_style.dart';
import 'package:app/onboarding/utils/constants.dart';
import 'package:app/onboarding/widgets/common/call_out_button.dart';
import 'package:app/onboarding/widgets/common/sized_box.dart';
import 'package:app/core/util/responsive/responsive_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NavBarSection extends StatelessWidget {
  const NavBarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Logo(),
        if (!isMobile(context)) const NavBarItems(),
        if (!isMobile(context)) const CallOutButtons(),
        if (isMobile(context))
          IconButton(
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
              icon: const Icon(Icons.menu))
      ],
    );
  }
}

class CallOutButtons extends StatelessWidget {
  const CallOutButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [AppOutlineButton(), AppSizedBoxOfWidth(), AppFilledButton()],
    );
  }
}

class NavBarItems extends StatelessWidget {
  const NavBarItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: navItems
            .map(
              (item) => Row(
                children: [
                  ResponsiveText(
                    text: item,
                    textStyle:
                        getResponsiveTextStyle(context, AppTextTheme.title),
                  ),
                  const AppSizedBoxOfWidth()
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
            text: "ImagineWorks",
            textStyle: getResponsiveTextStyle(context, AppTextTheme.headline)),
        const AppSizedBoxOfWidth(),
        SvgPicture.asset(
          'svg/logo.svg',
          height: sizeOfLogo(context),
          width: sizeOfLogo(context),
        ),
      ],
    );
  }
}

double sizeOfLogo(context) {
  if (isDesktop(context)) {
    return logoSizeDesktop;
  }
  if (isTablet(context)) {
    return logoSizeTablet;
  }

  return logoSizeMobile;
}
