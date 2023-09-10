import 'package:app/core/util/entities.dart';
import 'package:app/core/util/responsive/responsive_text_style.dart';
import 'package:flutter/material.dart';

class AppOutlineButton extends StatelessWidget {
  const AppOutlineButton({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
        style: OutlinedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            side: BorderSide(color: Theme.of(context).primaryColor)),
        onPressed: () {},
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            "Login",
            style: getResponsiveTextStyle(context, AppTextTheme.title),
          ),
        ));
  }
}

class AppFilledButton extends StatelessWidget {
  const AppFilledButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
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
        ));
  }
}