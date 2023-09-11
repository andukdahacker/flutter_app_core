
import 'package:flutter/material.dart';

extension BuildContextTheme on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;

  bool get isDarkMode {
    final brightness = MediaQuery.of(this).platformBrightness;

    return brightness == Brightness.dark;
  }

  bool get isLightMode {
    final brightness = MediaQuery.of(this).platformBrightness;

    return brightness == Brightness.light;
  }
}
