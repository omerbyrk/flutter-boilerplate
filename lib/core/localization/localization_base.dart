import 'package:get_it/get_it.dart';

import 'app_localizations.dart';

abstract class Localization {
  String t(String key, {List<String> params}) =>
      GetIt.instance.get<AppLocalizations>().translate(key, params: params);
}
