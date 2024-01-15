import 'package:flutter/material.dart';

import '../../design/app_colors.dart';
import '../../helpers/app_constants.dart';
import 'app_button_bottom_modal.dart';
import 'app_divider.dart';
import 'app_drag_bar.dart';

class AppFloatingActionButton extends StatelessWidget {
  const AppFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () {
        showModalBottomSheet(
          context: context,
          barrierColor: AppColors.barrierColor,
          builder: (context) => Container(
            width: double.infinity,
            height: 220,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              color: AppColors.lima,
            ),
            child: const Column(
              children: [
                SizedBox(height: 20),
                AppDragBar(),
                SizedBox(height: 20),
                AppButtonBottomModal(
                  title: 'Schedule tennis court',
                  icon: Icons.calendar_month_outlined,
                  route: AppConstants.scheduleCourt,
                ),
                SizedBox(height: 20),
                AppDivider(),
              ],
            ),
          ),
        );
      },
    );
  }
}
