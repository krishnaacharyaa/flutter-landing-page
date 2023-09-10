import 'package:app/onboarding/utils/constants.dart';
import 'package:app/onboarding/presentation/widgets/common/call_out_button.dart';
import 'package:app/onboarding/presentation/widgets/common/sized_box.dart';
import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: NavBarItems(),
        ),
        bottomNavigationBar: Padding(
            padding: EdgeInsets.all(
              16.0,
            ),
            child: CallOutButtons()));
  }
}

class CallOutButtons extends StatelessWidget {
  const CallOutButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(width: double.infinity, child: AppOutlineButton()),
        AppSizedBoxOfHeight(),
        SizedBox(width: double.infinity, child: AppFilledButton())
      ],
    );
  }
}

class NavBarItems extends StatelessWidget {
  const NavBarItems({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView(
        children: navItems
            .map(
              (item) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    item,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.arrow_forward_ios_sharp,
                        size: 20,
                      ))
                ],
              ),
            )
            .toList());
  }
}
