import 'package:covid19_app/core/exceptions/failure.dart';
import 'package:covid19_app/data/sharedpref/datasources/AuthenticationDataSource.dart';
import 'package:covid19_app/domain/repositories/repository.dart';
import 'package:covid19_app/domain/repositories/repository_extension.dart';
import 'package:dartz/dartz.dart';

abstract class AuthenticationRepository extends Repository {
  Future<Either<Failure, void>> setToken(String token);
  Future<Either<Failure, String>> getToken();
  Future<Either<Failure, bool>> hasToken();
  Future<Either<Failure, bool>> clearToken();
}

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationDataSource authenticationDataSource;

  AuthenticationRepositoryImpl({this.authenticationDataSource});

  @override
  Future<Either<Failure, String>> getToken() {
    return this.convertToEither<String>(
        () => this.authenticationDataSource.getToken());
  }

  @override
  Future<Either<Failure, void>> setToken(String token) {
    return this.convertToEither<void>(
        () => this.authenticationDataSource.saveToken(token));
  }

  @override
  Future<Either<Failure, bool>> hasToken() {
    return this
        .convertToEither<bool>(() => this.authenticationDataSource.hasToken());
  }

  @override
  Future<Either<Failure, bool>> clearToken() {
    return this.convertToEither<bool>(
        () => this.authenticationDataSource.clearToken());
  }
}
