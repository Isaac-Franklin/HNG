import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  // static const String fontFamily = 'Poppins';

  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      fontFamily: 'Lato',
      color: AppColors.text,
    ),
    bodyMedium: TextStyle(
      fontSize: 24,
      fontFamily: 'Lato',
      color: AppColors.text,
    ),
    bodySmall: TextStyle(
      fontSize: 14,
      fontFamily: 'Lato',
      color: AppColors.text,
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: TextStyle(
      fontSize: 32,
      fontFamily: 'Lato',
      fontWeight: FontWeight.bold,
      color: AppColors.darkText,
    ),
    bodyMedium: TextStyle(
      fontSize: 24,
      fontFamily: 'Lato',
      color: AppColors.darkText,
    ),
    bodySmall: TextStyle(
      fontSize: 14,
      fontFamily: 'Lato',
      color: AppColors.darkText,
    ),
  );
}
