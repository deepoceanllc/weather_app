import 'package:flutter/material.dart';
import 'package:weather_app/src/common/constants/app_colors.dart';

abstract final class AppTheme {
  static final light = ThemeData(
    useMaterial3: true,
    fontFamily: "Overpass",
    primaryColor: AppColors.blue1,
    colorScheme: const ColorScheme.light(
      primary: AppColors.blue1,
      secondary: AppColors.blue2,
    ),
  );

  static final dark = ThemeData(
    useMaterial3: true,
    fontFamily: "Overpass",
    primaryColor: AppColors.white,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.darkBlue1,
      secondary: AppColors.darkBlue2,
    ),
  );
}
