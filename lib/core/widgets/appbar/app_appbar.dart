import 'package:flutter/material.dart';

import '../../design/app_colors.dart';
import '../shared/app_title.dart';

class AppAppBar extends StatelessWidget implements PreferredSizeWidget {
  const AppAppBar({super.key});

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
      backgroundColor: AppColors.lima,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(80);
}
