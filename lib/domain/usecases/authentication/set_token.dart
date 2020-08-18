import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../../core/failures.dart/failure.dart';
import '../../repository/repository.dart';
import '../usecase.dart';

@lazySingleton
class SetUserToken implements UseCase<void, Params> {
  Repository repository;

  SetUserToken({@required this.repository});

  @override
  Future<Either<Failure, void>> call(Params params) async {
    return await repository.setToken(params.token);
  }
}

class Params {
  final String token;

  Params(this.token);
}
