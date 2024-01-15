import 'package:flutter/material.dart';

import '../../../../core/widgets/shared/app_title.dart';

class HomeIconLabel extends StatelessWidget {
  final IconData icon;
  final String label;
  final TextStyle? style;

  const HomeIconLabel({
    Key? key,
    required this.icon,
    required this.label,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        const SizedBox(width: 10),
        AppTitle(
          text: label,
          style: style!,
        ),
      ],
    );
  }
}
