import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tennis_court_app/core/design/app_colors.dart';

class AppTheme {
  static final AppTheme _instance = AppTheme._();

  factory AppTheme() {
    return _instance;
  }

  AppTheme._();

  ThemeData get defaultTheme => ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.dmSansTextTheme(
          const TextTheme(
            displaySmall: TextStyle(
              color: AppColors.black,
              fontSize: 12,
              fontWeight: FontWeight.w700,
              letterSpacing: 2.5,
            ),
            displayMedium: TextStyle(
              color: AppColors.black,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            displayLarge: TextStyle(
              color: AppColors.black,
              fontSize: 20,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.15,
            ),
            labelSmall: TextStyle(
              color: AppColors.black,
              fontSize: 14,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.25,
            ),
            labelLarge: TextStyle(
              color: AppColors.black,
              fontSize: 18,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.25,
            ),
            headlineSmall: TextStyle(
              color: AppColors.black,
              fontSize: 12,
              fontWeight: FontWeight.w400,
              letterSpacing: 0.25,
            ),
            headlineMedium: TextStyle(
              color: AppColors.white,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
            titleMedium: TextStyle(
              color: AppColors.black,
              fontSize: 17,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        filledButtonTheme: FilledButtonThemeData(
          style: ButtonStyle(
            elevation: MaterialStateProperty.all<double>(3),
            padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
              const EdgeInsets.symmetric(vertical: 16),
            ),
            backgroundColor: MaterialStateProperty.all<Color>(AppColors.lima),
            shape: MaterialStateProperty.all<OutlinedBorder>(
              const StadiumBorder(),
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            textStyle: MaterialStateProperty.all<TextStyle>(
              const TextStyle(
                fontSize: 14,
                color: AppColors.black,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: AppColors.lima,
          foregroundColor: AppColors.black,
          shape: StadiumBorder(),
          elevation: 3,
        ),
      );
}
