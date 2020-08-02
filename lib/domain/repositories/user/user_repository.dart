import 'package:covid19_app/data/models/user_model.dart';
import 'package:covid19_app/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../repository.dart';
import '../../../core/exceptions/failure.dart';
import '../repository_extension.dart';
import '../../../data/locale/datasources/user_local_datasource.dart';

abstract class UserRepository implements Repository {
  Future<Either<Failure, String>> login(String username, String password);
  Future<Either<Failure, UserEntity>> getByToken(String token);
}

class UserRepositoryImpl implements UserRepository {
  final UserLocalDataSource localDataSource;

  UserRepositoryImpl({@required this.localDataSource});

  @override
  Future<Either<Failure, String>> login(String username, String password) {
    return this.convertToEither<String>(() async {
      return await this.localDataSource.login(username, password);
    });
  }

  @override
  Future<Either<Failure, UserEntity>> getByToken(String token) {
    return this.convertToEither<UserEntity>(() async {
      return UserEntity.fromModel(await this.localDataSource.getByToken(token));
    });
  }
}
