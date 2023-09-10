import 'package:app/core/util/entities.dart';
import 'package:app/core/util/responsive/responsive_text.dart';
import 'package:app/core/util/responsive/responsive_text_style.dart';
import 'package:app/onboarding/utils/constants.dart';
import 'package:app/onboarding/presentation/widgets/common/call_out_button.dart';
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
