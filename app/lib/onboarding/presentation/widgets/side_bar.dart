import '../../utils/constants.dart';
import './common/call_out_button.dart';
import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  final GlobalKey featureKey;
  final GlobalKey aboutKey;
  const SideBar({super.key, required this.aboutKey, required this.featureKey});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: NavBarItems(aboutKey: aboutKey, featureKey: featureKey),
        ),
        bottomNavigationBar: const Padding(
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
        SizedBox(height: 16),
        SizedBox(width: double.infinity, child: AppFilledButton())
      ],
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
                      onPressed: () {
                        Scrollable.ensureVisible(
                          item == product
                              ? featureKey.currentContext!
                              : item == about
                                  ? aboutKey.currentContext!
                                  : context,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.easeInOut,
                        );
                        Navigator.pop(context);
                      },
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
