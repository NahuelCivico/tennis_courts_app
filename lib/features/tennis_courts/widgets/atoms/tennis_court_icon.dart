import 'package:flutter/material.dart';

class TennisCourtIcon extends StatelessWidget {
  final IconData icon;

  const TennisCourtIcon({
    Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(icon);
  }
}
