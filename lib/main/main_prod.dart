import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../app/app.dart';
import '../configs/app_configs.dart';
import '../configs/app_flavor.dart';
import '../l10n/localization_service.dart';

void main() async {
  await configMain(Flavor.prod);
  runApp(
    EasyLocalization(
      supportedLocales: LocalizationService.supportedLocales,
      path: LocalizationService.pathLocale,
      child: const MyApp(),
    ),
  );
}
