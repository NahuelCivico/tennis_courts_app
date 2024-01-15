import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/design/app_colors.dart';
import '../../../../core/widgets/shared/app_title.dart';
import '../../../home/cubit/home_cubit.dart';

class ScheduleCourtsAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const ScheduleCourtsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: AppTitle(
        text: 'Tennis Court App',
        style: Theme.of(context).textTheme.displayLarge!,
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(30),
        ),
      ),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_new),
        onPressed: () {
          context.read<HomeCubit>().goBackHome();
          Navigator.pop(context);
        },
      ),
      backgroundColor: AppColors.lima,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
