import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/localization/app_localization_base.dart';
import '../../exceptions/sharedpref_exception.dart';
import '../sharedpref_consts.dart';

@immutable
@lazySingleton
class AuthenticationDataSource extends AppLocalizationBase {
  final SharedPreferences sharedPreferences;

  AuthenticationDataSource({@required this.sharedPreferences});

  Future<void> saveToken(String token) async {
    try {
      bool result = await this
          .sharedPreferences
          .setString(SharedPrefConsts.TOKEN_KEY, token);
      if (!result) {
        throw SharedPrefException(t("error_when_save", params: ["token"]));
      }
    } catch (err) {
      throw SharedPrefException(err);
    }
  }

  Future<String> getToken() async {
    try {
      String result =
          await this.sharedPreferences.getString(SharedPrefConsts.TOKEN_KEY);
      return result;
    } catch (err) {
      throw SharedPrefException(err);
    }
  }

  Future<bool> hasToken() async {
    try {
      bool result =
          await this.sharedPreferences.containsKey(SharedPrefConsts.TOKEN_KEY);
      return result;
    } catch (err) {
      throw SharedPrefException(err);
    }
  }

  Future<bool> clearToken() async {
    try {
      bool result =
          await this.sharedPreferences.remove(SharedPrefConsts.TOKEN_KEY);
      return result;
    } catch (err) {
      throw SharedPrefException(err);
    }
  }
}
