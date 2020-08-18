import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../../core/failures.dart/failure.dart';
import '../../repository/repository.dart';
import '../usecase.dart';

@lazySingleton
class GetUserToken implements UseCase<String, NoParams> {
  Repository repository;

  GetUserToken({@required this.repository});

  @override
  Future<Either<Failure, String>> call(NoParams params) async {
    return await repository.getToken();
  }
}
