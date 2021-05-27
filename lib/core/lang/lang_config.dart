import 'dart:ui';

import 'package:getx_boilerplate/core/lang/en_us.dart';
import 'package:getx_boilerplate/core/lang/id.dart';
import 'package:get/get.dart';

class LangConfig extends Translations {
  // Default locale
  static final locale = Locale('en', 'US');

  // fallbackLocale saves the day when the locale gets in trouble
  static final fallbackLocale = Locale('en', 'US');

  // Supported languages
  // Needs to be same order with locales
  static final langs = ['English', 'Indonesia'];

  static final locales = [Locale('en', 'US'), Locale('id', 'ID')];

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUS,
        'id': id,
      };

  // Gets locale from language, and updates the locale
  void changeLocale(String lang) {
    final locale = _getLocaleFromLanguage(lang);
    Get.updateLocale(locale!);
  }

  // Finds language in `langs` list and returns it as Locale
  Locale? _getLocaleFromLanguage(String lang) {
    for (int i = 0; i < langs.length; i++) {
      if (lang == langs[i]) return locales[i];
    }
    return Get.locale;
  }
}
