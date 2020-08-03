import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../../core/exceptions/failure.dart';
import '../../repositories/authentication/authentication_repository.dart';
import '../usecase.dart';

class IsAuthenticatedUser implements UseCase<bool, NoParams> {
  AuthenticationRepository authenticationRepository;

  IsAuthenticatedUser({@required this.authenticationRepository});

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return await authenticationRepository.hasToken();
  }
}
