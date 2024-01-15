import 'package:flutter/material.dart';

import '../../../../core/widgets/shared/app_title.dart';

class ScheduleCourtRainProbability extends StatelessWidget {
  final int rainProbability;

  const ScheduleCourtRainProbability({
    Key? key,
    required this.rainProbability,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppTitle(
      text: 'Probability: $rainProbability%',
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
    );
  }
}
