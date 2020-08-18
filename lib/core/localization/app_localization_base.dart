import 'package:get_it/get_it.dart';

import 'app_localizations.dart';

class AppLocalizationBase {
  String t(String key, {List<String> params}) =>
      GetIt.instance.get<AppLocalizations>().translate(key, params: params);

  Future<String> tg(String key) async =>
      await GetIt.instance.get<AppLocalizations>().translateFromGoogle(key);
}
