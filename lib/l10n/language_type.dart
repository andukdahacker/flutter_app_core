import 'package:easy_localization/easy_localization.dart';

enum LanguageType {
  english,
  vietnamese,
  thailand,
}

extension LanguageTypeExtension on LanguageType {
  String get languageCode {
    switch (this) {
      case LanguageType.english:
        return 'en';
      case LanguageType.vietnamese:
        return 'vi';
      case LanguageType.thailand:
        return 'th';
    }
  }

  String get displayName {
    switch (this) {
      case LanguageType.english:
        return 'English';
      case LanguageType.vietnamese:
        return 'Tiếng Việt';
      case LanguageType.thailand:
        return 'ประเทศไทย';
    }
  }

  String get translatedName {
    switch (this) {
      case LanguageType.english:
        return 'english'.tr();
      case LanguageType.vietnamese:
        return 'vietnamese'.tr();
      case LanguageType.thailand:
        return 'thailand'.tr();
    }
  }

  String get apiCountryCode {
    switch (this) {
      case LanguageType.english:
        return 'US';
      case LanguageType.vietnamese:
        return 'VN';
      case LanguageType.thailand:
        return 'TH';
    }
  }

  static LanguageType parseLanguageCode(String languageCode) {
    switch (languageCode) {
      case 'en':
        return LanguageType.english;
      case 'vi':
        return LanguageType.vietnamese;
      case 'th':
        return LanguageType.thailand;
      default:
        return LanguageType.english;
    }
  }
}
