import 'package:app/core/util/entities.dart';
import 'package:app/core/util/responsive_text.dart';
import 'package:app/onboarding/widgets/common/helpers.dart';
import 'package:app/responsive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../utils/constants.dart';

class NavBarSection extends StatelessWidget {
  const NavBarSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Logo(),
        if (!Responsive.isMobile(context)) NavBarItems(),
        if (!Responsive.isMobile(context)) const CallOutButtons(),
        if (Responsive.isMobile(context))
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
    return Row(
      children: [
        OutlinedButton(
            style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                side: BorderSide(color: Theme.of(context).primaryColor)),
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                "Login",
                style: getResponsiveTextStyle(context, AppTextTheme.title),
              ),
            )),
        const SizedBoxWithWidth(),
        FilledButton(
            style: FilledButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
            onPressed: () {},
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                "Join the Beta",
                style: getResponsiveTextStyle(context, AppTextTheme.title),
              ),
            ))
      ],
    );
  }
}

class NavBarItems extends StatelessWidget {
  NavBarItems({super.key});
  final List<String> navItems = ["Product", "Subscribe", "About"];
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: navItems
            .map(
              (item) => Row(
                children: [
                  Text(
                    item,
                    style: getResponsiveTextStyle(context, AppTextTheme.title),
                  ),
                  const SizedBoxWithWidth()
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
        Text("ImagineWorks",
            style: getResponsiveTextStyle(context, AppTextTheme.headline)),
        const SizedBoxWithWidth(),
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
  switch (getAppSize(context)) {
    case AppSize.desktop:
      return OnBoardingConstants.LOGO_SIZE_DESKTOP;
    case AppSize.tablet:
      return OnBoardingConstants.LOGO_SIZE_TABLET;
    default:
      return OnBoardingConstants.LOGO_SIZE_MOBILE;
  }
}
