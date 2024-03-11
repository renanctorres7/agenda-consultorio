import 'package:flutter/material.dart';
import 'package:office_schedule/app/core/localization/languages.dart';
import 'package:office_schedule/app/core/localization/languages_portuguese.dart';

class AppLocalizationDelegates extends LocalizationsDelegate<Languages> {
  const AppLocalizationDelegates();

  @override
  bool isSupported(Locale locale) => ['pt'].contains(locale.languageCode);

  @override
  Future<Languages> load(Locale locale) async {
    switch (locale.languageCode) {
      case 'pt':
      default:
        return LanguagesPortugues();
    }
  }

  @override
  bool shouldReload(AppLocalizationDelegates old) => false;
}
