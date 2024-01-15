import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:tennis_court_app/core/models/tennis_court_booking_model.dart';
import 'package:tennis_court_app/features/home/widgets/atoms/home_delete_button.dart';

import '../../../../core/design/app_colors.dart';
import '../molecules/home_icon_label.dart';

class HomeCard extends StatelessWidget {
  final TennisCourtBookingModel tennisCourtBookingModel;

  const HomeCard({
    Key? key,
    required this.tennisCourtBookingModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: AppColors.lima,
            blurRadius: 5,
            offset: Offset(2, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HomeIconLabel(
                  icon: Icons.sports_tennis,
                  label: tennisCourtBookingModel.tennisCourt.name,
                  style: Theme.of(context).textTheme.displayLarge!,
                ),
                const SizedBox(height: 10),
                HomeIconLabel(
                  icon: Icons.person,
                  label: tennisCourtBookingModel.firstName,
                  style: Theme.of(context).textTheme.displayMedium!,
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    HomeIconLabel(
                      icon: Icons.calendar_today,
                      label: DateFormat('dd/MM/yyyy').format(
                        tennisCourtBookingModel.date,
                      ),
                      style: Theme.of(context).textTheme.displayMedium!,
                    ),
                    const SizedBox(width: 15),
                    HomeIconLabel(
                      icon: Icons.thunderstorm_outlined,
                      label: '${tennisCourtBookingModel.rainProbability}%',
                      style: Theme.of(context).textTheme.displayMedium!,
                    ),
                  ],
                ),
              ],
            ),
          ),
          HomeCardDeleteButton(id: tennisCourtBookingModel.id)
        ],
      ),
    );
  }
}
