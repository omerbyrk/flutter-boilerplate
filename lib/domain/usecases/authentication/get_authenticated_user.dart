import 'package:covid19_app/core/exceptions/failure.dart';
import 'package:covid19_app/domain/entities/user_entity.dart';
import 'package:covid19_app/domain/repositories/authentication/authentication_repository.dart';
import 'package:covid19_app/domain/repositories/user/user_repository.dart';
import 'package:covid19_app/domain/usecases/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

class GetAuthenticatedUser implements UseCase<UserEntity, NoParams> {
  AuthenticationRepository authenticationRepository;
  UserRepository userRepository;

  GetAuthenticatedUser(
      {@required this.authenticationRepository, @required this.userRepository});

  @override
  Future<Either<Failure, UserEntity>> call(NoParams noParams) async {
    final tokenResult = await this.authenticationRepository.getToken();

    return tokenResult.fold<Future<Either<Failure, UserEntity>>>(
        (failure) => Future.value(Left(failure)),
        (token) async => await userRepository.getByToken(token));
  }
}
