import 'package:flutter/material.dart';

import 'app_title.dart';

class AppButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  const AppButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FilledButton.tonal(
      onPressed: () => onPressed(),
      child: AppTitle(
        text: text,
        style: Theme.of(context).textTheme.labelLarge!,
      ),
    );
  }
}
