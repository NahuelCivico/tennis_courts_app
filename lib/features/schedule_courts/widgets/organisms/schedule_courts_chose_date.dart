import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tennis_court_app/features/schedule_courts/cubit/rain_probability_cubit.dart';
import 'package:tennis_court_app/features/schedule_courts/cubit/rain_probability_state.dart';

import '../../../../core/widgets/shared/app_input_date.dart';
import '../atoms/schedule_courts_rain_probability.dart';

class ScheduleCourtsChoseDate extends StatelessWidget {
  final TextEditingController dateEditingController;

  const ScheduleCourtsChoseDate({
    Key? key,
    required this.dateEditingController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: AppInputDate(
            textEditingController: dateEditingController,
            hintText: 'Chose date',
            errorEmptyText: 'date',
          ),
        ),
        const SizedBox(width: 20),
        Row(
          children: [
            const Icon(Icons.thunderstorm_outlined),
            const SizedBox(width: 10),
            BlocBuilder<RainProbabilityCubit, RainProbabilityState>(
              builder: (BuildContext context, RainProbabilityState state) {
                switch (state) {
                  case RainProbabilityInitState():
                    return const ScheduleCourtRainProbability(
                      rainProbability: 0,
                    );
                  case RainProbabilityLoadedState(
                      rainProbability: int rainProbability
                    ):
                    return ScheduleCourtRainProbability(
                      rainProbability: rainProbability,
                    );
                  case RainProbabilityErrorState(errorMessage: String error):
                    return Text(error);
                  default:
                    return const ScheduleCourtRainProbability(
                      rainProbability: 0,
                    );
                }
              },
            ),
          ],
        ),
      ],
    );
  }
}
