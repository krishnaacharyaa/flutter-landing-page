import 'package:app/onboarding/widgets/common/helpers.dart';
import 'package:flutter/material.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: NavBarItems(),
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
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  side: BorderSide(color: Theme.of(context).primaryColor)),
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  "Login",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              )),
        ),
        const SizedBoxWithHeight(),
        SizedBox(
          width: double.infinity,
          child: FilledButton(
              style: FilledButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20))),
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  "Join the Beta",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              )),
        )
      ],
    );
  }
}

class NavBarItems extends StatelessWidget {
  NavBarItems({super.key});
  final List<String> navItems = ["Product", "Subscribe", "About"];
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
