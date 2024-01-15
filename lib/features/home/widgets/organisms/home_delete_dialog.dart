import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:tennis_court_app/core/widgets/shared/app_button.dart';

import '../../../../core/design/app_colors.dart';
import '../../../../core/widgets/shared/app_title.dart';
import '../../cubit/home_cubit.dart';

class HomeDeleteDialog extends StatelessWidget {
  final int id;

  const HomeDeleteDialog({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 3,
      backgroundColor: AppColors.white,
      title: Center(
        child: AppTitle(
          text: 'Are you sure?',
          style: Theme.of(context).textTheme.displayLarge!,
        ),
      ),
      icon: const Icon(
        Icons.warning_amber_rounded,
        color: AppColors.black,
        size: 70,
      ),
      titlePadding: const EdgeInsets.only(bottom: 35),
      actions: [
        Row(
          children: [
            TextButton(
              child: AppTitle(
                  text: 'Cancel',
                  style: Theme.of(context).textTheme.displayMedium!),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            const SizedBox(width: 10),
            Expanded(
              child: AppButton(
                text: 'Delete',
                onPressed: () {
                  context.read<HomeCubit>().deleteTennisCourtBooking(id);
                  Navigator.of(context).pop();
                },
              ),
            )
          ],
        ),
      ],
    );
  }
}
