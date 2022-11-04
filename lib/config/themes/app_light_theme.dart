import 'package:flutter/material.dart';
import 'package:jop_task/core/utils/app_colors.dart';

final appTheme = ThemeData(
  appBarTheme: const AppBarTheme(
    backgroundColor: AppColors.primary,
  ),
  scaffoldBackgroundColor: AppColors.backgroundLight,
  brightness: Brightness.light,
  primaryColor: AppColors.primary,
  colorScheme: const ColorScheme.light(
    primary: AppColors.primary,
  ),
  progressIndicatorTheme: const ProgressIndicatorThemeData(
    color: AppColors.primary,
  ),
  inputDecorationTheme: _getInputDecoration(),
);

InputDecorationTheme _getInputDecoration() {
  return InputDecorationTheme(
    floatingLabelStyle: const TextStyle(
      color: Colors.black,
      fontSize: 14,
    ),
    labelStyle: TextStyle(
      color: Colors.black.withOpacity(0.5),
      fontSize: 16,
    ),
    errorStyle: const TextStyle(
      color: AppColors.error,
    ),
    iconColor: AppColors.primary,
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(22),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(22),
      borderSide: BorderSide(
        color: Colors.black.withOpacity(0.3),
      ),
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(22),
    ),
  );
}
