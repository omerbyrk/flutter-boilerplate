import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../../core/exceptions/failure.dart';
import '../../repository/index.dart';
import '../usecase.dart';

class SetToken implements UseCase<void, Params> {
  Repository repository;

  SetToken({@required this.repository});

  @override
  Future<Either<Failure, void>> call(Params params) async {
    return await repository.setToken(params.token);
  }
}

class Params {
  final String token;

  Params(this.token);
}