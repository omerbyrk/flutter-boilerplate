import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../../core/failures.dart/failure.dart';
import '../../../data/models/user_model.dart';
import '../../entities/user_entity.dart';
import '../../repository/repository.dart';
import '../usecase.dart';

@lazySingleton
class GetByToken implements UseCase<UserModel, Params> {
  Repository repository;

  GetByToken({@required this.repository});

  @override
  Future<Either<Failure, UserEntity>> call(Params params) async {
    return await repository.getUserByToken(params.token);
  }
}

class Params {
  final String token;

  Params(this.token);
}
