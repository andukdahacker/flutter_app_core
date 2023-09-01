import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../app/app.dart';
import '../configs/app_configs.dart';
import '../configs/app_flavor.dart';
import '../l10n/localization_service.dart';

void main() async {
  await configMain(Flavor.dev);
  runApp(
    EasyLocalization(
      supportedLocales: LocalizationService.supportedLocales,
      path: LocalizationService.pathLocale,
      fallbackLocale: LocalizationService.supportedLocales[0],
      child: const MyApp(),
    ),
  );
}
