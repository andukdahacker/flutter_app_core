import 'package:flutter/material.dart';
import 'contents/alert_dialog_content.dart';
import 'contents/two_button_dialog_content.dart';

class AppDialog {
  static Future showTwoButtonDialog(
    BuildContext context, {
    required Widget child,
    required String titleLeft,
    required String titleRight,
    required VoidCallback onClickLeft,
    required VoidCallback onClickRight,
  }) =>
      showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: TwoButtonDialogContent(
              titleLeft: titleLeft,
              titleRight: titleRight,
              onClickLeft: onClickLeft,
              onClickRight: onClickRight,
              child: child,
            ),
          );
        },
      );

  static Future showAlertDialog(
    BuildContext context, {
    required Widget child,
    required String titleRight,
    required VoidCallback onClickRight,
  }) =>
      showDialog(
        context: context,
        builder: (context) {
          return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            child: AlertDialogContent(
              buttonTitle: titleRight,
              onPressed: onClickRight,
              child: child,
            ),
          );
        },
      );
}
