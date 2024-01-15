import 'package:flutter/material.dart';

import '../../design/app_colors.dart';

class AppDragBar extends StatelessWidget {
  const AppDragBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 5,
      decoration: BoxDecoration(
        color: AppColors.black,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
