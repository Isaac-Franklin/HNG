import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppButtons {
  static final ButtonStyle elevatedLight = ElevatedButton.styleFrom(
    backgroundColor: AppColors.primary,
    foregroundColor: Colors.white,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
  );

  static final ButtonStyle elevatedDark = ElevatedButton.styleFrom(
    backgroundColor: AppColors.darkPrimary,
    foregroundColor: Colors.black,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
  );
}
