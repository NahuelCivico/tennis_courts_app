import 'package:flutter/material.dart';

import 'app_bubble.dart';

class AppBubbles extends StatelessWidget {
  const AppBubbles({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        Positioned(
          top: 30,
          right: -180,
          child: AppBubble(size: 420),
        ),
        Positioned(
          top: 450,
          left: -140,
          child: AppBubble(size: 200),
        ),
        Positioned(
          bottom: -200,
          left: -20,
          child: AppBubble(size: 400, isStrong: false),
        ),
      ],
    );
  }
}
