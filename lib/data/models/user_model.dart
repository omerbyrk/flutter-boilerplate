import 'model_base.dart';

class UserModel implements ModelBase {
  int id;
  String username;
  String password;
  String fullname;
  int age;
  String country;
  String twitterAccount;

  UserModel(
      {this.id,
      this.username,
      this.password,
      this.fullname,
      this.age,
      this.country,
      this.twitterAccount});

  @override
  Map<String, dynamic> toMap() => {
        "id": id,
        "fullname": fullname,
        "age": age,
        "country": country,
        "twitterAccount": twitterAccount,
        "username": username,
        "password": password,
      };

  factory UserModel.fromMap(Map<String, dynamic> map) => UserModel(
      id: map["id"],
      age: map["age"],
      country: map["country"],
      fullname: map["fullname"],
      username: map["username"],
      password: map["password"],
      twitterAccount: map["twitterAccount"]);
}
