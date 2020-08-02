import 'dart:convert' as convert;

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../bases/user_datasource.dart';
import '../exceptions/local_server_exception.dart';
import 'models/user_model.dart';

const USER_KEY = "USER";

// we simulated the api connection in here because I don't have api. We just use predefined data but if you wan't you use this.dio to request your apii
class UserLocalDataSourceImpl extends UserDataSource<UserModel> {
  final SharedPreferences sharedPreferences;
  UserLocalDataSourceImpl({@required this.sharedPreferences}) {
    UserModel userModel = UserModel(
        username: "admin",
        password: "admin",
        token: "Tokenn",
        age: 25,
        country: "Turkey",
        fullname: "Ömer Bayrak",
        twitterAccount: "https://twitter.com/omerbyrk8");
    String userJson = convert.jsonEncode(userModel.toJSON());
    sharedPreferences.setString(USER_KEY, userJson);
  }

  Future<String> login(String username, String password) async {
    try {
      await Future.delayed(Duration(seconds: 2));

      String userString = sharedPreferences.getString(USER_KEY);
      Map<String, dynamic> userMap = await convert.jsonDecode(userString);
      UserModel userModel = UserModel.fromMap(userMap);

      if (userModel.username != username || userModel.password != password) {
        throw LocalServerException(
            message:
                "Username or password are incorrect... [username= admin,password= admin]");
      }

      return userModel.token;
    } catch (err) {
      throw LocalServerException(message: err.message);
    }
  }

  Future<UserModel> getBy(String token) async {
    try {
      await Future.delayed(Duration(seconds: 2));
      String userString = sharedPreferences.getString(USER_KEY);
      Map<String, dynamic> userMap = await convert.jsonDecode(userString);
      UserModel userModel = UserModel.fromMap(userMap);

      if (userModel.token == token) {
        return userModel;
      } else
        throw LocalServerException(message: "Invalid Token");
    } catch (err) {
      throw LocalServerException(message: err.message);
    }
  }
}
