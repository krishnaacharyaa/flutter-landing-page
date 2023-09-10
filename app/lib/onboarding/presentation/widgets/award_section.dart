import 'package:app/core/util/entities.dart';
import 'package:app/core/util/responsive/responsive_text.dart';
import 'package:app/core/util/responsive/responsive_text_style.dart';
import 'package:app/onboarding/presentation/widgets/common/call_out_button.dart';
import 'package:app/onboarding/presentation/widgets/common/section_header.dart';
import 'package:app/onboarding/utils/constants.dart';
import 'package:flutter/material.dart';

class AwardsSection extends StatelessWidget {
  const AwardsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SectionHeader(heading: "Awards"),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: awards
              .map((award) => Card(
                    elevation: 3,
                    surfaceTintColor: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        // crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Image.asset(award.imageUrl),
                          const SizedBox(height: 16),
                          ResponsiveText(
                              text: award.title,
                              textStyle: getResponsiveTextStyle(
                                  context, AppTextTheme.title)),
                          const SizedBox(
                            height: 32,
                          ),
                          OutlinedButton(
                              onPressed: () {}, child: const Text("Hello"))
                        ],
                      ),
                    ),
                  ))
              .toList(),
        ),
      ],
    );
  }
}
