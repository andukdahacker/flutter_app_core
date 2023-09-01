import 'package:flutter/material.dart';
import 'app_color.dart';

class AppTextStyle extends TextStyle {
  const AppTextStyle({
    double super.fontSize = 14,
    super.color = AppColor.black,
    super.fontWeight,
    super.fontStyle,
    double super.height = 1,
    super.decoration,
  }) : super(
          fontFamily: 'Montserrat',
        );
}
