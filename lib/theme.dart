import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static ThemeData get lightTheme {
    final base = ThemeData.light();

    return base.copyWith(
      textTheme: TextTheme(
        bodySmall: GoogleFonts.ubuntu(
          fontWeight: FontWeight.w400,
          fontSize: 12,
          color: const Color(0xFF252838),
        ),
        bodyLarge: GoogleFonts.ubuntu(
          fontWeight: FontWeight.w700,
          fontSize: 30,
          color: const Color(0xFF252838),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          surfaceTintColor: Colors.white,
          shadowColor: const Color.fromARGB(255, 0, 0, 0),
          elevation: 1,
        ),
      ),
    );
  }
}
