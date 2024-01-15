import 'package:flutter/material.dart';

import '../../design/app_colors.dart';

class AppBubble extends StatelessWidget {
  final double size;
  final bool isStrong;

  const AppBubble({
    Key? key,
    required this.size,
    this.isStrong = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: isStrong
            ? RadialGradient(
                colors: [
                  AppColors.lima.withOpacity(1.0),
                  AppColors.lima.withOpacity(0.9),
                  AppColors.lima.withOpacity(0.8),
                  AppColors.lima.withOpacity(0.6),
                  AppColors.lima.withOpacity(0.4),
                  AppColors.lima.withOpacity(0.2),
                  AppColors.lima.withOpacity(0.1),
                ],
                stops: const [0.0, 0.1, 0.2, 0.4, 0.6, 0.8, 1.0],
              )
            : RadialGradient(
                colors: [
                  AppColors.lima.withOpacity(0.6),
                  AppColors.lima.withOpacity(0.5),
                  AppColors.lima.withOpacity(0.45),
                  AppColors.lima.withOpacity(0.40),
                  AppColors.lima.withOpacity(0.35),
                  AppColors.lima.withOpacity(0.30),
                  AppColors.lima.withOpacity(0.25),
                  AppColors.lima.withOpacity(0.20),
                  AppColors.lima.withOpacity(0.15),
                  AppColors.lima.withOpacity(0.10),
                  AppColors.lima.withOpacity(0.05),
                ],
                stops: const [
                  0.0,
                  0.1,
                  0.2,
                  0.3,
                  0.4,
                  0.45,
                  0.5,
                  0.55,
                  0.65,
                  0.75,
                  1.0
                ],
              ),
      ),
    );
  }
}
