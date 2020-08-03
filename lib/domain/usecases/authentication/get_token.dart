import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../../core/exceptions/failure.dart';
import '../../repositories/authentication/authentication_repository.dart';
import '../usecase.dart';

class GetToken implements UseCase<String, NoParams> {
  AuthenticationRepository authenticationRepository;

  GetToken({@required this.authenticationRepository});

  @override
  Future<Either<Failure, String>> call(NoParams params) async {
    return await authenticationRepository.getToken();
  }
}