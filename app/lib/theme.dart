import 'package:app/core/util/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTheme {
  static getTheme() {
    return ThemeData(
        textTheme: GoogleFonts.interTextTheme(
          const TextTheme(
            displayLarge:
                TextStyle(fontSize: 57, letterSpacing: 0.25, height: 64),
            displayMedium:
                TextStyle(fontSize: 45, letterSpacing: 0.0, height: 52),
            displaySmall:
                TextStyle(fontSize: 36, letterSpacing: 0.0, height: 44),
            headlineLarge:
                TextStyle(fontSize: 32, letterSpacing: 0.0, height: 40),
            headlineMedium:
                TextStyle(fontSize: 28, letterSpacing: 0.0, height: 36),
            headlineSmall:
                TextStyle(fontSize: 24, letterSpacing: 0.0, height: 32),
            titleLarge: TextStyle(fontSize: 22, letterSpacing: 0.0, height: 28),
            titleMedium:
                TextStyle(fontSize: 16, letterSpacing: 0.15, height: 24),
            titleSmall:
                TextStyle(fontSize: 14, letterSpacing: 0.10, height: 20),
            labelLarge:
                TextStyle(fontSize: 14, letterSpacing: 0.10, height: 20),
            labelMedium:
                TextStyle(fontSize: 12, letterSpacing: 0.50, height: 16),
            labelSmall:
                TextStyle(fontSize: 11, letterSpacing: 0.50, height: 16),
          ),
        ),
        primaryColor: AppConstants.gold,
        useMaterial3: true);
  }
}
