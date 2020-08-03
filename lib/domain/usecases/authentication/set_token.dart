import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../../core/exceptions/failure.dart';
import '../../repositories/authentication/authentication_repository.dart';
import '../usecase.dart';

class SetToken implements UseCase<void, Params> {
  AuthenticationRepository authenticationRepository;

  SetToken({@required this.authenticationRepository});

  @override
  Future<Either<Failure, void>> call(Params params) async {
    return await authenticationRepository.setToken(params.token);
  }
}

class Params {
  final String token;

  Params(this.token);
}