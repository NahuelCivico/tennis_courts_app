import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:tennis_court_app/core/helpers/app_constants.dart';
import 'package:tennis_court_app/core/widgets/shared/app_divider.dart';

import '../../design/app_colors.dart';
import '../shared/app_title.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.lima,
      child: Padding(
        padding:
            const EdgeInsets.only(top: 100, bottom: 50, left: 40, right: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AppTitle(
              text: 'Tennis Court App',
              style: Theme.of(context).textTheme.displayLarge!,
            ),
            const SizedBox(height: 20),
            const AppDivider(),
            const SizedBox(height: 40),
            FadeInRight(
              duration: const Duration(milliseconds: 400),
              child: InkWell(
                onTap: () =>
                    Navigator.pushNamed(context, AppConstants.scheduleCourt),
                child: Row(
                  children: [
                    const Icon(Icons.calendar_month_outlined),
                    const SizedBox(width: 20),
                    AppTitle(
                      text: 'Schedule',
                      style: Theme.of(context).textTheme.displayMedium!,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            FadeInRight(
              duration: const Duration(milliseconds: 400),
              child: InkWell(
                onTap: () =>
                    Navigator.pushNamed(context, AppConstants.tennisCourts),
                child: Row(
                  children: [
                    const Icon(Icons.sports_tennis),
                    const SizedBox(width: 20),
                    AppTitle(
                      text: 'Tennis courts',
                      style: Theme.of(context).textTheme.displayMedium!,
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            Row(
              children: [
                const Icon(Icons.logout),
                const SizedBox(width: 10),
                AppTitle(
                  text: 'Logout',
                  style: Theme.of(context).textTheme.displayMedium!,
                ),
              ],
            ),
            const SizedBox(height: 50),
            AppTitle(
              text: 'Version 1.0.0',
              style: Theme.of(context).textTheme.displayMedium!,
            ),
          ],
        ),
      ),
    );
  }
}
