import 'package:flutter/material.dart';
import 'package:tennis_court_app/core/widgets/shared/app_title.dart';
import 'package:tennis_court_app/features/tennis_courts/widgets/atoms/tennis_court_icon.dart';

class TennisCourtIconLabel extends StatelessWidget {
  final IconData icon;
  final String label;

  const TennisCourtIconLabel({
    Key? key,
    required this.icon,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TennisCourtIcon(icon: icon),
        const SizedBox(width: 15),
        AppTitle(
          text: label,
          style: Theme.of(context).textTheme.displayMedium!,
        ),
      ],
    );
  }
}
