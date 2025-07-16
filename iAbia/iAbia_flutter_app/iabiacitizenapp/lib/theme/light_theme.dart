import 'package:flutter/material.dart';
import 'package:iabiacitizenapp/theme/app_text_styles.dart';
import 'app_colors.dart';
import 'app_buttons.dart';

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  fontFamily: 'Lato',
  primaryColor: AppColors.primary,
  scaffoldBackgroundColor: AppColors.background,
  textTheme: AppTextStyles.lightTextTheme,
  elevatedButtonTheme: ElevatedButtonThemeData(style: AppButtons.elevatedLight),
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.primary,
    foregroundColor: Colors.white,
    elevation: 0,
  ),
);
