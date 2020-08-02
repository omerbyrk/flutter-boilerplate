import 'package:flutter/foundation.dart';
import 'package:sembast/sembast.dart';

import '../../exceptions/local_server_exception.dart';
import '../../models/user_model.dart';
import '../db_consts.dart' as DBConsts;

class UserLocalDataSource {
  final _usersStore = intMapStoreFactory.store(DBConsts.USER_STORE_NAME);
  final Database database;

  UserLocalDataSource({@required this.database}) {
    UserModel userModel = UserModel(
        username: "admin",
        password: "admin",
        token: "Tokenn",
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
        throw LocalServerException(
            message:
                "Username or password are incorrect... [username= admin,password= admin]");
      }

      final userModel = UserModel.fromMap(recordSnapshot.value);
      userModel.id = recordSnapshot.key;

      return userModel.token;
    } catch (err) {
      throw LocalServerException(message: err.message);
    }
  }

  Future<UserModel> getByToken(String token) async {
    try {
      final finder = _tokenFinder(token);
      final recordSnapshot =
          await _usersStore.findFirst(database, finder: finder);

      if (recordSnapshot == null) {
        throw LocalServerException(message: "Invalid Token");
      }

      UserModel userModel = UserModel.fromMap(recordSnapshot.value);
      userModel.id = recordSnapshot.key;
      return userModel;
    } catch (err) {
      throw LocalServerException(message: err.message);
    }
  }

  Finder _usernameAndPasswordFinder(String username, String password) => Finder(
          filter: Filter.and([
        Filter.equals("username", username),
        Filter.equals("password", password)
      ]));

  Finder _tokenFinder(String token) =>
      Finder(filter: Filter.equals("token", token));
}
