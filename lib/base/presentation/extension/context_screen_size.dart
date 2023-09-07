import 'package:flutter/cupertino.dart';

extension BuildContextScreenSize on BuildContext {
  Size get screenSize => MediaQuery.of(this).size;

  double get screenWidth => screenSize.width;

  double get screenHeight => screenSize.height;

  bool get isExtraSmallScreen => screenWidth < 600;

  bool get isSmallScreen => screenWidth >= 600 && screenWidth < 1240;

  bool get isMediumScreen => screenWidth >= 1240 && screenWidth < 1440;

  bool get isLargeScreen =>  screenWidth >= 1440;
}