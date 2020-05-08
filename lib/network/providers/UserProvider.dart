import 'package:covid19_app/model/User.dart';
import 'package:covid19_app/network/dto/User.dart';
import 'package:covid19_app/network/providers/ProviderBase.dart';

// we simulated the api connection in here because I don't have api. We just use predefined data but if you wan't you use this.dio to request your apii
class UserProvider extends ProviderBase {
  Future<String> login(LoginDTO loginDTO) {
    return Future.delayed(Duration(seconds: 2), () {
      if (loginDTO.username != "admin" || loginDTO.password != "admin") {
        return Future.error(
            "Username or password are incorrect... [username= admin,password= admin]");
      }
      return Future.value("Tokennnn");
    });
  }

  Future<User> getBy(String token) {
    return Future.delayed(Duration(seconds: 2), () {
      return Future.value(User()
        ..fullname = "Ömer Bayrak"
        ..age = 25
        ..country = "Turkey"
        ..twitterAccount = "https://twitter.com/omerbyrk8");
    });
  }
}
