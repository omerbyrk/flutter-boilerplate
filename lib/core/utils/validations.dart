import '../consts/app_consts.dart';

/// [Validations] is validation class all application level.
class Validations {
  static bool lNotNullOrEmpty(List<dynamic> list) =>
      list != null && list.length > 0;

  static bool sNotNullOrEmpty(String string) =>
      (string != null && string.length > 0);

  static bool IsUrl(String string) =>
      RegExp(AppConsts.email_regex).firstMatch(string) != null;
}
