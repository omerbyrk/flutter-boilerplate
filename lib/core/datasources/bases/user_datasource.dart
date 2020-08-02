import 'package:covid19_app/core/datasources/bases/model_base.dart';

// Regardless its implementation, we assume every user has the these methods

abstract class UserDataSource<Model extends ModelBase> {
  Future<String> login(String username, String password);
  Future<Model> getBy(String token);
}