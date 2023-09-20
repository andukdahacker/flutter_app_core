import 'package:flutter/material.dart';

import '../../modules/router/router.dart';
import '../presentation/extension/context_screen_size.dart';

class SnackBarUtils {
  static void showErrorSnackBar({
    required String content,
    required BuildContext context,
  }) {
    AppRouter.scaffoldKey.currentState?.showSnackBar(
      SnackBar(
        content: Text(content),
        width: context.screenWidth / 3 * 2,
      ),
    );
  }
}
