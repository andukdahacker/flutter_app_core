import 'package:flutter/material.dart';

import 'app_theme_src.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    cardColor: Colors.white,
    useMaterial3: true,
    textTheme: AppTextTheme.textThemeLight,
    fontFamily: 'Montserrat',
    visualDensity: VisualDensity.adaptivePlatformDensity,
    inputDecorationTheme: inputDecorationThemeLight,
    checkboxTheme: checkboxTheme,
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
    inputDecorationTheme: inputDecorationThemeDark,
    checkboxTheme: checkboxTheme,
    colorScheme: ColorScheme.fromSeed(
      seedColor: AppColor.primary,
      secondary: AppColor.secondary,
      brightness: Brightness.dark,
      error: AppColor.accent,
    ),
  );

  static InputDecorationTheme inputDecorationThemeLight = InputDecorationTheme(
    border: const OutlineInputBorder(
      borderRadius: AppBorderRadius.circular4,
      borderSide: BorderSide(color: AppColor.gray200, width: 1),
    ),
    hintStyle: AppTextTheme.textThemeLight.labelMedium,
  );

  static InputDecorationTheme inputDecorationThemeDark = InputDecorationTheme(
    border: const OutlineInputBorder(
      borderRadius: AppBorderRadius.circular4,
      borderSide: BorderSide(color: AppColor.gray200, width: 1),
    ),
    hintStyle: AppTextTheme.textThemeDark.labelMedium,
  );

  static CheckboxThemeData checkboxTheme = const CheckboxThemeData(
    visualDensity: VisualDensity(
      horizontal: VisualDensity.minimumDensity,
      vertical: VisualDensity.minimumDensity,
    ),
    shape: CircleBorder(),
  );
}
