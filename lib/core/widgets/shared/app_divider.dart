import 'package:flutter/material.dart';

import '../../design/app_colors.dart';

class AppDivider extends StatelessWidget {
  const AppDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: AppColors.black,
      indent: 30,
      endIndent: 30,
    );
  }
}
