import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../../../core/datasources/bases/user_datasource.dart';
import '../../../../core/domain_bases/repository.dart';
import '../../../../core/exceptions/failure.dart';
import '../../../../core/extensions/repository_extension.dart';

abstract class LoginRepository implements Repository {
  Future<Either<Failure, String>> login(String username, String password);
}

class LoginRepositoryImpl implements LoginRepository {
  final UserDataSource userDataSource;

  LoginRepositoryImpl({@required this.userDataSource});

  @override
  Future<Either<Failure, String>> login(String username, String password) {
    return this.run(() async {
      return await this.userDataSource.login(username, password);
    });
  }
}
