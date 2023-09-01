import 'package:flutter/material.dart';

extension AppBorderRadius on BorderRadius {
  static const zero = BorderRadius.zero;

  static const circular2 = BorderRadius.all(Radius.circular(2));
  static const circular3 = BorderRadius.all(Radius.circular(3));
  static const circular4 = BorderRadius.all(Radius.circular(4));
  static const circular6 = BorderRadius.all(Radius.circular(6));
  static const circular8 = BorderRadius.all(Radius.circular(8));
  static const circular10 = BorderRadius.all(Radius.circular(10));
  static const circular12 = BorderRadius.all(Radius.circular(12));
  static const circular16 = BorderRadius.all(Radius.circular(16));
  static const circular20 = BorderRadius.all(Radius.circular(20));
  static const circular24 = BorderRadius.all(Radius.circular(24));
  static const circular30 = BorderRadius.all(Radius.circular(30));
  static const circular40 = BorderRadius.all(Radius.circular(40));
  static const circular60 = BorderRadius.all(Radius.circular(60));
  static const circular50 = BorderRadius.all(Radius.circular(50));
  static const circular85 = BorderRadius.all(Radius.circular(85));
  static const circular999 = BorderRadius.all(Radius.circular(999));

  static const circularOnlyTopLef8TopRight8 = BorderRadius.only(
    topLeft: Radius.circular(8),
    topRight: Radius.circular(8),
  );

  static const circularOnlyTopLef16TopRight16 = BorderRadius.only(
    topLeft: Radius.circular(16),
    topRight: Radius.circular(16),
  );

  static const circularOnlyTopLef20TopRight20 = BorderRadius.only(
    topLeft: Radius.circular(20),
    topRight: Radius.circular(20),
  );

  static const circularOnlyTopRight4BottomRight4 = BorderRadius.only(
    topRight: Radius.circular(4),
    bottomRight: Radius.circular(4),
  );

  static const circularOnlyTopLeft4BottomLeft4 = BorderRadius.only(
    topLeft: Radius.circular(4),
    bottomLeft: Radius.circular(4),
  );
  static const circularBottom4 = BorderRadius.only(
    bottomRight: Radius.circular(4),
    bottomLeft: Radius.circular(4),
  );
  static const circularBottom8 = BorderRadius.only(
    bottomRight: Radius.circular(8),
    bottomLeft: Radius.circular(8),
  );
  static const circularTop4 = BorderRadius.only(
    topLeft: Radius.circular(4),
    topRight: Radius.circular(4),
  );
}
