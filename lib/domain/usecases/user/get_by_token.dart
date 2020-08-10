import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../../../core/exceptions/failure.dart';
import '../../../data/models/user_model.dart';
import '../../entities/user_entity.dart';
import '../../repository/index.dart';
import '../usecase.dart';

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
