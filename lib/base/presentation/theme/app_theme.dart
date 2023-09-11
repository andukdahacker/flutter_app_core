import 'package:flutter/material.dart';

import 'app_theme_src.dart';


class AppTheme {
  static ThemeData lightTheme = ThemeData(
    cardColor: Colors.white,
    useMaterial3: true,
    textTheme: AppTextTheme.textThemeLight,
    fontFamily: 'Montserrat',
    visualDensity: VisualDensity.adaptivePlatformDensity,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColor.primary,
      secondary: AppColor.secondary,
      error: AppColor.accent,
    ),
  );
  static ThemeData darkTheme = ThemeData(
    cardColor: Colors.white,
    useMaterial3: true,
    textTheme: AppTextTheme.textThemeDark,
    fontFamily: 'Montserrat',
    visualDensity: VisualDensity.adaptivePlatformDensity,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColor.primary,
      secondary: AppColor.secondary,
      brightness: Brightness.dark,
      error: AppColor.accent,
    ),
  );
}
