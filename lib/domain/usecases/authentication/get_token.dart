import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../../core/exceptions/failure.dart';
import '../../repository/index.dart';
import '../usecase.dart';

class GetUserToken implements UseCase<String, NoParams> {
  Repository repository;

  GetUserToken({@required this.repository});

  @override
  Future<Either<Failure, String>> call(NoParams params) async {
    return await repository.getToken();
  }
}
