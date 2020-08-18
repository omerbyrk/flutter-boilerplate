import 'package:flutmovie/core/blocs/bases/bloc_event_base.dart';
import 'package:get_it/get_it.dart';

import 'app_localizations.dart';

/// [AppLocalizationBase] is extended from other class to get localization features.
/// Example: [BlocEventBase]
class AppLocalizationBase {
  /// localize the [key] from localization.json file.
  String t(String key, {List<String> params}) =>
      GetIt.instance.get<AppLocalizations>().translate(key, params: params);

  /// Translate the [sourceText] from the google.
  Future<String> tg(String sourceText) async => await GetIt.instance
      .get<AppLocalizations>()
      .translateFromGoogle(sourceText);
}
