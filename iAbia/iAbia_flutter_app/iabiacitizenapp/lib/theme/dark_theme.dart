import 'package:flutter/material.dart';
import 'package:iabiacitizenapp/theme/app_text_styles.dart';
import 'app_colors.dart';
import 'app_buttons.dart';

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  fontFamily: 'Lato',
  primaryColor: AppColors.darkPrimary,
  scaffoldBackgroundColor: const Color.fromARGB(255, 74, 14, 20),
  textTheme: AppTextStyles.darkTextTheme,
  elevatedButtonTheme: ElevatedButtonThemeData(style: AppButtons.elevatedDark),
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.darkPrimary,
    foregroundColor: Colors.black,
    elevation: 0,
  ),
);
