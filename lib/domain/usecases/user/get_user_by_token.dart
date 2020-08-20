import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../../core/failures/failure.dart';
import '../../entities/user_entity.dart';
import '../../repository/repository.dart';
import '../usecase.dart';

/// [GetUserByToken] get authenticated user if there is a user-token.
@lazySingleton
class GetUserByToken implements UseCase<UserEntity, NoParams> {
  Repository repository;

  GetUserByToken({@required this.repository});

  @override
  Future<Either<Failure, UserEntity>> call(NoParams noParams) async {
    final tokenResult = await this.repository.getToken();

    return tokenResult.fold<Future<Either<Failure, UserEntity>>>(
        (failure) => Future.value(Left(failure)),
        (token) async => await repository.getUserByToken(token));
  }
}
