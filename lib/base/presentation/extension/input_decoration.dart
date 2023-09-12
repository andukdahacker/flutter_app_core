import 'package:flutter/material.dart';

import '../theme/app_theme.dart';
import 'context_theme.dart';

extension InputDecorationTheme on InputDecoration {
  InputDecoration defaultThemeOf(BuildContext context) => applyDefaults(
        context.isLightMode
            ? AppTheme.inputDecorationThemeLight
            : AppTheme.inputDecorationThemeDark,
      );
}
