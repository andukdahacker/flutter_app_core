import 'package:flutter/material.dart';

import 'app_theme_src.dart';


class AppTheme {
  static ThemeData lightTheme = ThemeData(
    cardColor: AppColor.white,
    useMaterial3: true,
    textTheme: AppTextTheme.textThemeLight,
    fontFamily: 'Montserrat',
    visualDensity: VisualDensity.adaptivePlatformDensity,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColor.primary,
      error: AppColor.accent,
    ),
  );
  static ThemeData darkTheme = ThemeData(
    cardColor: AppColor.white,
    useMaterial3: true,
    textTheme: AppTextTheme.textThemeDark,
    fontFamily: 'Montserrat',
    visualDensity: VisualDensity.adaptivePlatformDensity,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColor.primary,
      brightness: Brightness.dark,
      error: AppColor.accent,
    ),
  );
}
