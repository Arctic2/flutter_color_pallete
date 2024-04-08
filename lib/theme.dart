import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:surf_flutter_courses_template/assets/app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    final base = ThemeData.light();

    return base.copyWith(
      textTheme: TextTheme(
        bodySmall: GoogleFonts.ubuntu(
          fontWeight: FontWeight.w400,
          fontSize: 12,
          color: AppColors.darkBlue,
        ),
        bodyLarge: GoogleFonts.ubuntu(
          fontWeight: FontWeight.w700,
          fontSize: 30,
          color: AppColors.darkBlue,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          backgroundColor: AppColors.white,
          surfaceTintColor: AppColors.white,
          elevation: 1,
        ),
      ),
    );
  }
}
