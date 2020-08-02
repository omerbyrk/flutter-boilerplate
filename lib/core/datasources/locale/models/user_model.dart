
import '../../bases/model_base.dart';

class UserModel implements ModelBase {
  final String username;
  final String password;
  final String token;
  final String fullname;
  final int age;
  final String country;
  final String twitterAccount;

  UserModel({this.username, this.password, this.token, this.fullname, this.age, this.country, this.twitterAccount});

  @override
  Map<String, dynamic> toJSON() => {
        "fullname": fullname,
        "age": age,
        "country": country,
        "twitterAccount": twitterAccount,
        "username": username,
        "password": password,
        "token": token
      };

  factory UserModel.fromMap(Map<String, dynamic> map) => UserModel(
      age: map["age"],
      country: map["country"],
      fullname: map["fullname"],
      username: map["username"],
      password: map["password"],
      token: map["token"],
      twitterAccount: map["twitterAccount"]);
}
