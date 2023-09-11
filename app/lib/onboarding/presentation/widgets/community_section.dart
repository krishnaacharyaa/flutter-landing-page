import 'package:app/core/util/responsive/responsive_layout.dart';
import 'package:app/onboarding/presentation/widgets/common/section_header.dart';
import 'package:app/onboarding/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:scroll_loop_auto_scroll/scroll_loop_auto_scroll.dart';

class CommunitySection extends StatefulWidget {
  const CommunitySection({Key? key}) : super(key: key);

  @override
  State<CommunitySection> createState() => _CommunitySectionState();
}

class _CommunitySectionState extends State<CommunitySection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SectionHeader(heading: "Community"),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: const ScrollLoopAutoScroll(
            gap: 0,
            delayAfterScrollInput: Duration(seconds: 8),
            delay: Duration(seconds: 0),
            duration: Duration(minutes: 10),
            scrollDirection: Axis.horizontal,
            child: LogoWidget(),
          ),
        ),
      ],
    );
  }
}

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: communityLogos.map((e) {
        return Container(
            width:
                MediaQuery.of(context).size.width / _getNumberOfLogos(context),
            alignment: Alignment.center,
            child: Image.asset(
              e,
              fit: BoxFit.fill,
              height: heightOfLogo,
            ));
      }).toList(),
    );
  }

  int _getNumberOfLogos(BuildContext context) => isDesktop(context)
      ? noOfLogosDesktop
      : isTablet(context)
          ? noOfLogosTablet
          : noOfLogosMobile;
}
