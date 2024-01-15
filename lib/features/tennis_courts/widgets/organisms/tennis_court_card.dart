import 'package:flutter/material.dart';

import 'package:tennis_court_app/core/models/tennis_court_model.dart';

import '../../../../core/design/app_colors.dart';
import '../molecules/tennis_court_icon_label.dart';

class TennisCourtCard extends StatelessWidget {
  final TennisCourtModel tennisCourtModel;

  const TennisCourtCard({
    Key? key,
    required this.tennisCourtModel,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TennisCourtIconLabel(
            icon: Icons.sports_tennis_outlined,
            label: tennisCourtModel.name,
          ),
          const SizedBox(height: 10),
          TennisCourtIconLabel(
            icon: Icons.location_pin,
            label: tennisCourtModel.location,
          ),
          const SizedBox(height: 10),
          TennisCourtIconLabel(
            icon: Icons.people_outline_outlined,
            label: 'Max Attendees: ${tennisCourtModel.maxAttendees}',
          ),
        ],
      ),
    );
  }
}
