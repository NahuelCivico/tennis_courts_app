import 'package:flutter/material.dart';

import '../../../../core/widgets/shared/app_title.dart';

class ScheduleCourtsTitle extends StatelessWidget {
  const ScheduleCourtsTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.calendar_month_outlined),
        const SizedBox(width: 20),
        AppTitle(
          text: 'Schedule a tennis court',
          style: Theme.of(context).textTheme.displayLarge!,
        ),
      ],
    );
  }
}
