import 'package:flutter/material.dart';
import 'package:weather_app/src/common/constants/app_colors.dart';

abstract final class AppTheme {
  static final light = ThemeData(
    useMaterial3: true,
    fontFamily: "Overpass",
    primaryColor: AppColors.white,
  );

  static final dark = ThemeData(
    useMaterial3: true,
    fontFamily: "Overpass",
    primaryColor: AppColors.dark,
  );
}
