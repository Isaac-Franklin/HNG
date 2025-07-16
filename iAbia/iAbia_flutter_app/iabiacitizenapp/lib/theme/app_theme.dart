import 'package:flutter/material.dart';
import 'light_theme.dart';
import 'dark_theme.dart';

class AppTheme {
  static ThemeData getLight() => lightTheme;
  static ThemeData getDark() => darkTheme;
}
