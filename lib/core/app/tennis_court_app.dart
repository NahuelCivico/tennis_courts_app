import 'package:flutter/material.dart';

import '../../features/tennis_courts/screens/tennis_court_screen.dart';
import '../../features/home/screen/home_screen.dart';
import '../../features/schedule_courts/screen/schedule_courts_screen.dart';
import '../design/app_theme.dart';
import '../helpers/app_constants.dart';

class TennisCourtApp extends StatelessWidget {
  const TennisCourtApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tennis Court App',
      themeMode: ThemeMode.system,
      theme: AppTheme().defaultTheme,
      initialRoute: AppConstants.home,
      routes: {
        AppConstants.home: (context) => const HomeScreen(),
        AppConstants.scheduleCourt: (context) => const ScheduleCourtsScreen(),
        AppConstants.tennisCourts: (context) => const TennisCourtScreen(),
      },
    );
  }
}
