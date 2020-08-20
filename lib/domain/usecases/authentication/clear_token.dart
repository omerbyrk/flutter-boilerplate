import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../../core/failures/failure.dart';
import '../../repository/repository.dart';
import '../usecase.dart';

/// [ClearUserToken] clears user token from the local dbs.
@lazySingleton
class ClearUserToken implements UseCase<bool, NoParams> {
  Repository repository;

  ClearUserToken({@required this.repository});

  @override
  Future<Either<Failure, bool>> call(NoParams params) async {
    return await repository.clearToken();
  }
}
