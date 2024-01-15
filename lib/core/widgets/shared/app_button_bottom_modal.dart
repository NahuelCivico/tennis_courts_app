import 'package:flutter/material.dart';

import '../../design/app_colors.dart';
import 'app_title.dart';

class AppButtonBottomModal extends StatelessWidget {
  final String title;
  final IconData icon;
  final String route;

  const AppButtonBottomModal({
    Key? key,
    required this.title,
    required this.icon,
    required this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.pushNamed(context, route),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            decoration: const BoxDecoration(
              color: AppColors.lima,
              shape: BoxShape.circle,
              border: Border.fromBorderSide(
                BorderSide(color: AppColors.black),
              ),
            ),
            child: Icon(
              icon,
              color: AppColors.black,
            ),
          ),
          const SizedBox(width: 20),
          AppTitle(
            text: title,
            style: Theme.of(context).textTheme.labelLarge!,
          )
        ],
      ),
    );
  }
}
