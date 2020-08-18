import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:translator/translator.dart';

/// [AppLocalizations] is default implementation of the localization in flutter.
class AppLocalizations {
  final Locale locale;
  Map<String, String> _localizedStrings;
  final googleTranslator = GoogleTranslator(client: ClientType.siteGT);

  AppLocalizations(this.locale);

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  Future<bool> load() async {
    String jsonString =
        await rootBundle.loadString('assets/lang/${locale.languageCode}.json');
    Map<String, dynamic> jsonMap = json.decode(jsonString);
    _localizedStrings =
        jsonMap.map((key, value) => MapEntry(key, value.toString()));
    return true;
  }

  /// localize the key from the [assets/lang/${locale.languageCode}.json] json assets.
  /// If not fount, then print it to notify you.
  String translate(String key, {List<String> params}) {
    String localizedString = _localizedStrings[key];
    if (params != null) {
      for (var i = 0; i < params.length; i++) {
        var param = params[i];
        localizedString = localizedString.replaceFirst("{$i}", param);
      }
    }
    if (localizedString == null) {
      debugPrint("Localization: $key - not fount");
    }
    return localizedString ?? key;
  }

  /// You need to implement your google translator api with your api key!
  Future<String> translateFromGoogle(String text) async {
    try {
      /*return (await googleTranslator.translate(text, to: locale.languageCode))
          .text;*/
      return Future.value(text);
    } catch (ex) {
      debugPrint("Google Translate Error for: " + text);
      return Future.value(text);
    }
  }
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();
  @override
  bool isSupported(Locale locale) {
    return ['en', 'tr'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    AppLocalizations localizations = AppLocalizations(locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) => false;
}
