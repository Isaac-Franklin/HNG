import 'package:flutter/material.dart';

class DeviceUtils {
  static late double screenWidth;
  static late double screenHeight;
  static late Orientation orientation;

  static bool _initialized = false;

  static void init(BuildContext context) {
    if (_initialized) return;
    final mediaQuery = MediaQuery.of(context);
    screenWidth = mediaQuery.size.width;
    screenHeight = mediaQuery.size.height;
    orientation = mediaQuery.orientation;
    _initialized = true;
  }

  static bool isPortrait() => orientation == Orientation.portrait;
  static bool isLandscape() => orientation == Orientation.landscape;
  static bool isTablet() => screenWidth >= 600 && screenWidth < 1024;
  static bool isMobile() => screenWidth < 600;
  static bool isDesktop() => screenWidth >= 1024;
}

class AppSizes {
  static const double spacingXS = 4.0;
  static const double spacingS = 8.0;
  static const double spacingM = 16.0;
  static const double spacingL = 24.0;
  static const double spacingXL = 32.0;
  static const double spacingXXL = 48.0;

  static const double cardWidthSmall = 280.0;
  static const double cardWidthMedium = 400.0;
  static const double cardWidthLarge = 600.0;

  static const double buttonHeight = 48.0;
  static const double appBarHeight = 56.0;
  static const double bottomNavBarHeight = 60.0;
  static const double inputFieldHeight = 60.0;
}
