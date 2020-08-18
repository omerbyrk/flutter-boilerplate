import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:sembast/sembast.dart';

import '../../../core/localization/app_localization_base.dart';
import '../../exceptions/local_server_exception.dart';
import '../../models/user_model.dart';
import '../local_consts.dart';

@lazySingleton
class UserLocalDataSource extends AppLocalizationBase {
  final _usersStore = intMapStoreFactory.store(LocalConsts.USER_STORE_NAME);
  final Database database;

  UserLocalDataSource({@required this.database}) {
    UserModel userModel = UserModel(
        username: "admin",
        password: "admin",
        age: 25,
        country: "Turkey",
        fullname: "Ömer Bayrak",
        twitterAccount: "https://twitter.com/omerbyrk8");
    final finder = _usernameAndPasswordFinder("admin", "admin");
    _usersStore.findKey(database, finder: finder).then((value) {
      if (value == null) {
        _usersStore.add(database, userModel.toMap());
      }
    });
  }

  Future<String> login(String username, String password) async {
    try {
      final finder = _usernameAndPasswordFinder(username, password);
      ;
      final recordSnapshot =
          await _usersStore.findFirst(database, finder: finder);

      if (recordSnapshot == null) {
        throw LocalServerException(t("incorrect_username_or_password"));
      }

      final userModel = UserModel.fromMap(recordSnapshot.value);
      userModel.id = recordSnapshot.key;

      return userModel.id.toString();
    } catch (err) {
      throw LocalServerException(err);
    }
  }

  Future<UserModel> getByToken(String token) async {
    try {
      int id = int.parse(token);
      final finder = Finder(filter: Filter.byKey(id));
      final recordSnapshot =
          await _usersStore.findFirst(database, finder: finder);

      if (recordSnapshot == null) {
        throw LocalServerException(t("token_invalid"));
      }

      UserModel userModel = UserModel.fromMap(recordSnapshot.value);
      userModel.id = recordSnapshot.key;
      return userModel;
    } catch (err) {
      throw LocalServerException(err);
    }
  }

  Finder _usernameAndPasswordFinder(String username, String password) => Finder(
          filter: Filter.and([
        Filter.equals("username", username),
        Filter.equals("password", password)
      ]));
}
