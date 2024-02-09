import 'package:flutter/material.dart';

import '../constants/colors/app_colors.dart';

abstract interface class AppTheme {
  static ThemeData light = ThemeData(
    scaffoldBackgroundColor: AppColors.white,
    colorScheme: const ColorScheme.light(),
  );
  static ThemeData dark = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: AppColors.black26,
  );
}
