import 'dart:ui';

class LocalizationService {
  static const String pathLocale = 'assets/translations';
  static const List<Locale> supportedLocales = <Locale>[
    Locale('vi', 'VN'),
    Locale('en', 'US'),
    Locale('th', 'TH'),
  ];
}
